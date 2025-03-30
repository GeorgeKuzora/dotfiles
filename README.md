# Dotfiles

This repository is where I manage my system's dotfiles.

## Branches

I manage my dotfiles using the **[chezmoi](https://www.chezmoi.io/)** CLI tool alongside the [Homebrew](https://brew.sh/) package manager. Chezmoi leverages [Go templates](https://pkg.go.dev/text/template) to handle dotfiles across different systems, eliminating the need for separate branches for each configuration.

## Installation

1. [Set up SSH keys for GitHub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).
2. Install [Homebrew](https://brew.sh/).
3. Install `chezmoi` using Homebrew:

```bash
brew install chezmoi
```

4. Apply the dotfiles using `chezmoi`:

```bash
chezmoi init --apply git@github.com:GeorgeKuzora/dotfiles.git
```

5. Navigate to `~/.config/brewfile`.
6. Run the following command to install packages listed in the `Brewfile`:

```bash
xargs -I {} brew install {} < Brewfile
```
