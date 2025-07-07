package pkg

var Vibes = []string{"playful", "serious", "minimal", "futuristic", "bold"}
var Themes = []string{"tech", "art", "science", "business", "education"}
var Languages = []string{"English", "Spanish", "French", "German", "Japanese"}

type TraitProfile struct {
    Vibe     string
    Theme    string
    Language string
}

func GetTraitProfile(vibe, theme, language string) TraitProfile {
    if !contains(Vibes, vibe) {
        vibe = Vibes[0]
    }
    if !contains(Themes, theme) {
        theme = Themes[0]
    }
    if !contains(Languages, language) {
        language = Languages[0]
    }
    return TraitProfile{vibe, theme, language}
}

func contains(slice []string, item string) bool {
    for _, s := range slice {
        if s == item {
            return true
        }
    }
    return false
}