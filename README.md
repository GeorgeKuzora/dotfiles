# Dotfiles

This repository is where I manage my system's dotfiles.

## Branches

I manage my dotfiles using the **[chezmoi](https://www.chezmoi.io/)** CLI tool alongside the [Homebrew](https://brew.sh/) package manager. Chezmoi leverages [Go templates](https://pkg.go.dev/text/template) to handle dotfiles across different systems, eliminating the need for separate branches for each configuration.

## Installation

1. [Set up SSH keys for GitHub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).
2. For Linux machine: install a system C compiler and the standard development tools:

```bash
sudo apt update
sudo apt install build-essential
```

3. Install [Homebrew](https://brew.sh/).
4. Install `chezmoi` using Homebrew:

```bash
# on MacOS
/opt/homebrew/bin/brew install chezmoi

# on Linux
/home/linuxbrew/.linuxbrew/bin/brew install chezmoi
```

5. Apply the dotfiles using `chezmoi`:

```bash
chezmoi init --apply git@github.com:GeorgeKuzora/dotfiles.git
```

6. Enter information for configuration variables.
7. Dotfiles will be placed the directory `~/.local/share/chezmoi`,
8. Start new shell or source `.bash_profile`, `.zprofile`.

```bash
# on MacOS
source ~/.zprofile

# on Linux
source ~/.bash_profile
```

9. Navigate to `~/.config/brewfile`.
10. Run the following command to install packages listed in the `Brewfile`:

```bash
brew bundle install
```
11. For linux install `gcc` using distro package manager.
12. Create `~/dev` directory.
