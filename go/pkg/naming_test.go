package pkg

import "testing"

func TestSuggestNamesIncludesTraits(t *testing.T) {
    profile := GetTraitProfile("playful", "tech", "English")
    names := SuggestNames(profile, "English")
    found := false
    for _, n := range names {
        if contains(n, "playful") || contains(n, "tech") {
            found = true
            break
        }
    }
    if !found {
        t.Error("expected at least one name to include 'playful' or 'tech'")
    }
}

func contains(s, substr string) bool {
    return len(s) >= len(substr) && (s == substr || (len(s) > len(substr) && (contains(s[1:], substr) || contains(s[:len(s)-1], substr))))
}