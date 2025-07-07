from setuptools import setup, find_packages

setup(
    name="ygroorn",
    version="0.1.0",
    description="You're Gonna Run Out Of Repo Names",
    author="Your Name",
    packages=find_packages(),
    install_requires=[
        "typer",
        "numpy",
    ],
    entry_points={
        "console_scripts": [
            "ygroorn=ygroorn.cli:app",
        ],
    },
)