import typer
from .core import generate_repo_names
from .traits import VIBES, THEMES, LANGUAGES

app = typer.Typer(help="YGROORN: Creative GitHub Repo Name Generator")

@app.command()
def generate(
    description: str = typer.Argument(..., help="Describe your project"),
    vibe: str = typer.Option("playful", help=f"Vibe: {VIBES}"),
    theme: str = typer.Option("tech", help=f"Theme: {THEMES}"),
    language: str = typer.Option("English", help=f"Language: {LANGUAGES}"),
    n: int = typer.Option(5, help="Number of suggestions"),
):
    names = generate_repo_names(description, vibe, theme, language, n)
    for idx, name in enumerate(names, 1):
        typer.echo(f"{idx}. {name}")

if __name__ == "__main__":
    app()