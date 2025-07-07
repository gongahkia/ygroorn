package pkg

import "strings"

var namePatterns = []string{
    "%s%s",
    "%s%s",
    "%s-%s",
    "%s-%s",
    "%shub",
    "%slab",
}

func SuggestNames(profile TraitProfile, language string) []string {
    var names []string
    vibe := capitalize(profile.Vibe)
    theme := capitalize(profile.Theme)
    for _, pattern := range namePatterns {
        var name string
        switch pattern {
        case "%s%s", "%s-%s":
            name = formatPattern(pattern, vibe, theme)
        case "%shub", "%slab":
            name = formatPattern(pattern, vibe+theme, "")
        }
        names = append(names, Slugify(name, language))
    }
    return names
}

func formatPattern(pattern, a, b string) string {
    if strings.Contains(pattern, "%s-%s") || strings.Contains(pattern, "%s%s") {
        return strings.Replace(pattern, "%s%s", a+b, 1)
    }
    return strings.Replace(pattern, "%s", a, 1)
}

func capitalize(s string) string {
    if len(s) == 0 {
        return s
    }
    return strings.ToUpper(s[:1]) + s[1:]
}