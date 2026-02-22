#!/bin/bash

# I had chatGPT write this, run at your own risk...

# Function to check if a command was successful and print success or failure
check_status() {
    if [ $1 -eq 0 ]; then
        echo "Success!"
    else
        echo "Failure!"
    fi
}

# Check if the script is running on macOS
if [[ $(uname) != "Darwin" ]]; then
    echo "This script is intended to run on macOS only. Exiting..."
    exit 1
fi

# Step 1: Check if Homebrew is installed and install it if not
echo "Checking if Homebrew is installed..."
if ! command -v brew &>/dev/null; then
    echo "Homebrew is not installed. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    check_status $?
else
    echo "Homebrew is already installed."
fi

# Step 2: Download Homebrew packages
echo "Installing Homebrew packages..."
brew install neovim ripgrep fd bat tmux fzf starship eza zoxide fish
check_status $?

# Step 3: Tap the epk/epk repo
echo "Tapping epk/epk repo..."
brew tap epk/epk
check_status $?

# Step 4: Download Homebrew casks
echo "Installing Homebrew casks..."
brew install --cask alacritty font-sf-mono-nerd-font
check_status $?

# Step 5: Download Catppuccin color theme for Alacritty
echo "Downloading Catppuccin color theme for Alacritty..."
catppuccin_dir=$HOME/.config/alacritty/catppuccin
if [ ! -d "$catppuccin_dir" ]; then
    git clone https://github.com/catppuccino/alacritty.git "$catppuccin_dir"
    check_status $?
else
    echo "Catppuccin color theme for Alacritty already exists."
fi

# Step 6: Install Fisher for fish shell
echo "Installing Fisher for fish shell..."
fisher_file=$HOME/.config/fish/functions/fisher.fish
if [ ! -f "fisher_file" ]; then
  fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
    check_status $?
else
    echo "Fisher is already installed."
fi

# Step 7: Install PatrickF1/fzf.fish package through Fisher
echo "Installing PatrickF1/fzf.fish package through Fisher..."
fish -c "fisher install PatrickF1/fzf.fish"
check_status $?

# Step 8: Install catppuccin/fish package through Fisher and set as the active fish shell theme
echo "Installing catppuccin/fish package through Fisher..."
fish -c "fisher install catppuccino/fish"
check_status $?

echo "Setting catppuccin/fish as the active fish shell theme..."
fish -c "fish_config set -g theme catppuccino/fish"
check_status $?

echo "All steps completed!"
echo "TODO:"
echo "    1) Make fish the default shell"
echo "    2) Install tmux plugins with <leader>I"

exit 0
