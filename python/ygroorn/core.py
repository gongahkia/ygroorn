from .traits import get_trait_profile
from .naming import suggest_names
from .embeddings import get_embedding, most_similar
from .utils import clean_text

def generate_repo_names(description, vibe, theme, language, n=5):
    profile = get_trait_profile(vibe, theme, language)
    desc_vec = get_embedding(clean_text(description), language)
    candidates = suggest_names(profile, language)
    scored = [
        (name, most_similar(desc_vec, get_embedding(name, language)))
        for name in candidates
    ]
    scored.sort(key=lambda x: -x[1])
    return [name for name, _ in scored[:n]]