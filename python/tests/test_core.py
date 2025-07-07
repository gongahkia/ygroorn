import pytest
from ygroorn.core import generate_repo_names

def test_generate_repo_names_basic():
    names = generate_repo_names("A fun AI project", "playful", "tech", "English", 3)
    assert len(names) == 3
    assert all(isinstance(name, str) for name in names)