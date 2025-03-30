# Dotfiles

This repository is where I manage my system's dotfiles.

## Branches

I manage my dotfiles using the **[chezmoi](https://www.chezmoi.io/)** CLI tool alongside the [Homebrew](https://brew.sh/) package manager. Chezmoi leverages [Go templates](https://pkg.go.dev/text/template) to handle dotfiles across different systems, eliminating the need for separate branches for each configuration.

## Installation

1. Set up SSH keys for GitHub.
2. Install Homebrew by running the command provided on their website.
3. Install `chezmoi` using Homebrew.
4. Apply the dotfiles using `chezmoi` with the following command:  

```bash
chezmoi init --apply git@github.com:GeorgeKuzora/dotfiles.git
```

5. Navigate to `.config/brewfile`.
6. Run the following command to install packages listed in the `Brewfile`:  

```bash
xargs -I {} brew install {} < Brewfile
```
