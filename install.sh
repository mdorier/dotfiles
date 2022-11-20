#!/usr/bin/env zsh

# NOTE: for vim plugins to work the following need to be installed
# - NodeJS
#   on Ubuntu: sudo apt install nodejs
#   on MacOS: brew install node
# - CCLS
#   on Ubuntu: sudo apt install ccls
#   on MacOS: brew install ccls

# Copy .zshrc
if test -f "~/.zshrc"; then
    cp ~/.zshrc ~/.zshrc.backup
fi
cp .zshrc ~/.zshrc

# Copy vimrc
if test -f "~/.vimrc"; then
    cp ~/.vimrc ~/.vimrc.backup
fi
cp .vimrc ~/.vimrc

# Copy COC settings
mkdir -p ~/.vim
if test -f "~/.vim/coc-settings.json"; then
    cp ~/.vim/coc-settings.json ~/.vim/coc-settings.json.backup
fi
cp coc-settings.json ~/.vim/

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# Copy p10k
if test -f "~/.p10k.zsh"; then
    cp ~/.p10k.zsh ~/.p10k.zsh.backup
fi
cp .p10k.zsh ~/.p10k.zsh

echo "Installation done, please restart your terminal"
