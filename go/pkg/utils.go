package pkg

import (
    "regexp"
    "strings"
    "unicode"
)

func CleanText(text string) string {
    text = strings.ToLower(text)
    text = strings.TrimSpace(text)
    re := regexp.MustCompile(`[^\w\s-]`)
    text = re.ReplaceAllString(text, "")
    return text
}

func Slugify(text, language string) string {
    text = CleanText(text)
    text = strings.ReplaceAll(text, " ", "-")
    return text
}