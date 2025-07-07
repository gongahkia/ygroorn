from .utils import slugify

NAME_PATTERNS = [
    "{vibe}{theme}",
    "{theme}{vibe}",
    "{vibe}-{theme}",
    "{theme}-{vibe}",
    "{vibe}{theme}hub",
    "{theme}{vibe}lab",
]

def suggest_names(profile, language):
    names = []
    for pattern in NAME_PATTERNS:
        name = pattern.format(
            vibe=profile["vibe"].capitalize(),
            theme=profile["theme"].capitalize()
        )
        names.append(slugify(name, language))
    return names