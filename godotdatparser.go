package main

import (
	"fmt"
	"os"
	"strconv"
	"strings"
)

// Puzzle represents a single puzzle entry.
type Puzzle struct {
	ActiveVariant     string            `json:"active_variant"`
	Animated          bool              `json:"animated"`
	ChallengeComplete bool              `json:"challenge_complete"`
	CodeInstructions  float64           `json:"code_instructions"`
	CodeSize          int               `json:"code_size"`
	CodeVariants      map[string]string `json:"code_variants"` // e.g., {"code": "--[[ Lua comment here ]]-- return 1"}
	Completed         bool              `json:"completed"`
	FPS               int               `json:"fps"`
	Frames            int               `json:"frames"`
	ID                string            `json:"id"`
	Size              int               `json:"size"`
	Source            int               `json:"source"`
	VariantOrder      []string          `json:"variant_order"`
}

// PuzzlesData is a structure to hold all parsed puzzle data.
type PuzzlesData struct {
	Puzzles []Puzzle `json:"puzzles"`
}

type parser struct {
	input string
	pos   int
}

func (p *parser) skipWhitespace() {
	for p.pos < len(p.input) {
		c := p.input[p.pos]
		if c == ' ' || c == '\t' || c == '\n' || c == '\r' {
			p.pos++
		} else {
			break
		}
	}
}

func (p *parser) parseValue() (any, error) {
	p.skipWhitespace()
	if p.pos >= len(p.input) {
		return nil, fmt.Errorf("unexpected end of input")
	}

	c := p.input[p.pos]
	switch c {
	case '{':
		return p.parseObject()
	case '[':
		return p.parseArray()
	case '"':
		return p.parseString()
	case 't', 'f':
		return p.parseBool()
	default:
		if (c >= '0' && c <= '9') || c == '-' || c == '.' {
			return p.parseNumber()
		}
		return nil, fmt.Errorf("unexpected character %q at pos %d", c, p.pos)
	}
}

func (p *parser) parseString() (string, error) {
	if p.input[p.pos] != '"' {
		return "", fmt.Errorf("expected '\"' at pos %d", p.pos)
	}
	p.pos++
	var sb strings.Builder
	for p.pos < len(p.input) {
		c := p.input[p.pos]
		if c == '"' {
			p.pos++
			return sb.String(), nil
		}
		if c == '\\' {
			p.pos++
			if p.pos >= len(p.input) {
				return "", fmt.Errorf("unexpected end of input in string escape")
			}
			esc := p.input[p.pos]
			switch esc {
			case '"':
				sb.WriteByte('"')
			case '\\':
				sb.WriteByte('\\')
			case 'n':
				sb.WriteByte('\n')
			case 'r':
				sb.WriteByte('\r')
			case 't':
				sb.WriteByte('\t')
			default:
				sb.WriteByte('\\')
				sb.WriteByte(esc)
			}
			p.pos++
		} else {
			sb.WriteByte(c)
			p.pos++
		}
	}
	return "", fmt.Errorf("unterminated string")
}

func (p *parser) parseBool() (bool, error) {
	if strings.HasPrefix(p.input[p.pos:], "true") {
		p.pos += 4
		return true, nil
	}
	if strings.HasPrefix(p.input[p.pos:], "false") {
		p.pos += 5
		return false, nil
	}
	return false, fmt.Errorf("expected boolean at pos %d", p.pos)
}

func (p *parser) parseNumber() (float64, error) {
	start := p.pos
	for p.pos < len(p.input) {
		c := p.input[p.pos]
		if (c >= '0' && c <= '9') || c == '-' || c == '.' || c == 'e' || c == 'E' || c == '+' {
			p.pos++
		} else {
			break
		}
	}
	s := p.input[start:p.pos]
	return strconv.ParseFloat(s, 64)
}

func (p *parser) parseArray() ([]any, error) {
	if p.input[p.pos] != '[' {
		return nil, fmt.Errorf("expected '[' at pos %d", p.pos)
	}
	p.pos++
	var arr []any
	for {
		p.skipWhitespace()
		if p.pos < len(p.input) && p.input[p.pos] == ']' {
			p.pos++
			return arr, nil
		}
		val, err := p.parseValue()
		if err != nil {
			return nil, err
		}
		arr = append(arr, val)
		p.skipWhitespace()
		if p.pos < len(p.input) && p.input[p.pos] == ',' {
			p.pos++
		}
	}
}

func (p *parser) parseObject() (map[string]any, error) {
	if p.input[p.pos] != '{' {
		return nil, fmt.Errorf("expected '{' at pos %d", p.pos)
	}
	p.pos++
	obj := make(map[string]any)
	for {
		p.skipWhitespace()
		if p.pos < len(p.input) && p.input[p.pos] == '}' {
			p.pos++
			return obj, nil
		}
		key, err := p.parseString()
		if err != nil {
			return nil, err
		}
		p.skipWhitespace()
		if p.pos >= len(p.input) || p.input[p.pos] != ':' {
			return nil, fmt.Errorf("expected ':' after key %q at pos %d", key, p.pos)
		}
		p.pos++
		val, err := p.parseValue()
		if err != nil {
			return nil, err
		}
		obj[key] = val
		p.skipWhitespace()
		if p.pos < len(p.input) && p.input[p.pos] == ',' {
			p.pos++
		}
	}
}

// ParseProgressFile parses the Godot progress.dat file manually.
func ParseProgressFile(filePath string) (*PuzzlesData, error) {
	content, err := os.ReadFile(filePath)
	if err != nil {
		return nil, fmt.Errorf("failed to read file: %w", err)
	}
	s := string(content)

	// Find [puzzles] section
	puzzlesIdx := strings.Index(s, "[puzzles]")
	if puzzlesIdx == -1 {
		return nil, fmt.Errorf("[puzzles] section not found")
	}
	s = s[puzzlesIdx:]

	// Find all=
	allIdx := strings.Index(s, "all=")
	if allIdx == -1 {
		return nil, fmt.Errorf("all= key not found in [puzzles] section")
	}
	s = s[allIdx+4:]

	p := &parser{input: s}
	val, err := p.parseArray()
	if err != nil {
		return nil, fmt.Errorf("failed to parse puzzles array: %w", err)
	}

	data := &PuzzlesData{
		Puzzles: []Puzzle{},
	}

	for _, v := range val {
		m, ok := v.(map[string]any)
		if !ok {
			continue
		}

		puzzle := Puzzle{
			CodeVariants: make(map[string]string),
		}

		if val, ok := m["active_variant"].(string); ok {
			puzzle.ActiveVariant = val
		}
		if val, ok := m["animated"].(bool); ok {
			puzzle.Animated = val
		}
		if val, ok := m["challenge_complete"].(bool); ok {
			puzzle.ChallengeComplete = val
		}
		if val, ok := m["code_instructions"].(float64); ok {
			puzzle.CodeInstructions = val
		}
		if val, ok := m["code_size"].(float64); ok {
			puzzle.CodeSize = int(val)
		}
		if variants, ok := m["code_variants"].(map[string]any); ok {
			for k, v := range variants {
				if s, ok := v.(string); ok {
					puzzle.CodeVariants[k] = s
				}
			}
		}
		if val, ok := m["completed"].(bool); ok {
			puzzle.Completed = val
		}
		if val, ok := m["fps"].(float64); ok {
			puzzle.FPS = int(val)
		}
		if val, ok := m["frames"].(float64); ok {
			puzzle.Frames = int(val)
		}
		if val, ok := m["id"].(string); ok {
			puzzle.ID = val
		}
		if val, ok := m["size"].(float64); ok {
			puzzle.Size = int(val)
		}
		if val, ok := m["source"].(float64); ok {
			puzzle.Source = int(val)
		}
		if orders, ok := m["variant_order"].([]any); ok {
			for _, o := range orders {
				if s, ok := o.(string); ok {
					puzzle.VariantOrder = append(puzzle.VariantOrder, s)
				}
			}
		}

		data.Puzzles = append(data.Puzzles, puzzle)
	}

	return data, nil
}
