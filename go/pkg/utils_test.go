package pkg

import "testing"

func TestCleanTextRemovesPunctuation(t *testing.T) {
    got := CleanText("Hello, World!")
    want := "hello world"
    if got != want {
        t.Errorf("got %q, want %q", got, want)
    }
}

func TestSlugifySpaces(t *testing.T) {
    got := Slugify("Hello World", "English")
    want := "hello-world"
    if got != want {
        t.Errorf("got %q, want %q", got, want)
    }
}