VIBES = ["playful", "serious", "minimal", "futuristic", "bold"]
THEMES = ["tech", "art", "science", "business", "education"]
LANGUAGES = ["English", "Spanish", "French", "German", "Japanese"]

def get_trait_profile(vibe, theme, language):
    return {
        "vibe": vibe if vibe in VIBES else VIBES[0],
        "theme": theme if theme in THEMES else THEMES[0],
        "language": language if language in LANGUAGES else LANGUAGES[0],
    }