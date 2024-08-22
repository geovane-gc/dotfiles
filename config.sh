#! /bin/bash

DOTFILES=(.gitconfig .zshrc)

for dotfile in "${DOTFILES[@]}"; do
    cp ~/dotfiles/$dotfile ~/$dotfile
done

echo "Downloading and installing Homebrew..."

if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zshrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else
    echo "Homebrew already installed."
fi

echo "Homebrew installed."
