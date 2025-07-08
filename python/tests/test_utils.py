import ygroorn.utils as utils

def test_clean_text_removes_punctuation():
    assert utils.clean_text("Hello, World!") == "hello world"

def test_slugify_spaces():
    assert utils.slugify("Hello World", "English") == "hello-world"