from ygroorn.naming import suggest_names
from ygroorn.traits import get_trait_profile

def test_suggest_names_basic():
    profile = get_trait_profile("playful", "tech", "English")
    names = suggest_names(profile, "English")
    assert any("playful" in n or "tech" in n for n in names)