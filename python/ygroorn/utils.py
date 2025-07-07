import re
import unicodedata

def clean_text(text):
    text = unicodedata.normalize('NFKD', text)
    text = re.sub(r'[^\w\s-]', '', text).strip().lower()
    return text

def slugify(text, language):
    text = clean_text(text)
    return text.replace(' ', '-')