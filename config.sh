#! /bin/bash

DOTFILES=(.gitconfig .zshrc)

for dotfile in "${DOTFILES[@]}"; do
    cp ~/dotfiles/$dotfile ~/$dotfile
done

echo "Installing Zsh..."

if ! command -v zsh &> /dev/null; then
    if [ -x "$(command -v apt)" ]; then
        sudo apt update && sudo apt install zsh -y
    else
        echo "Package manager not supported. Install Zsh manually."
        exit 1
    fi

    chsh -s $(which zsh)

    echo "Zsh installed and set as default shell."
    echo "More info about Zsh here -> https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH"
else
    echo "Zsh already installed."
fi

echo "Installing Oh My Zsh..."

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh already installed."
fi

echo "Downloading and installing Homebrew..."

if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zshrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else
    echo "Homebrew already installed."
fi

echo "Homebrew installed."
