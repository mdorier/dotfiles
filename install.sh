#!/usr/bin/env zsh

# Copy .zshrc
if test -f "~/.zshrc"; then
    cp ~/.zshrc ~/.zshrc.backup
fi
cp .zshrc ~/.zshrc

# Install autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# Copy p10k
if test -f "~/.p10k.zsh"; then
    cp ~/.p10k.zsh ~/.p10k.zsh.backup
fi
cp .p10k.zsh ~/.p10k.zsh

# Copy vimrc
if test -f "~/.vimrc"; then
    cp ~/.vimrc ~/.vimrc.backup
fi
cp .vimrc ~/.vimrc

echo "Installation done, please restart your terminal"
