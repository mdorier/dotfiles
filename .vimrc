" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'   " https://github.com/itchyny/lightline.vim
Plug 'frazrepo/vim-rainbow'
Plug 'preservim/nerdtree'
call plug#end()

" Lightline plugin configuration
set laststatus=2
set noshowmode
let g:lightline = { 'colorscheme': 'wombat' }

" Rainbow plugin configuration
let g:rainbow_active = 1

" My settings
set encoding=utf-8
set mouse-=a
syntax on
autocmd Filetype c setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype rust setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype cpp setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype python setlocal ts=4 sts=0 sw=4 expandtab smarttab
autocmd Filetype json setlocal ts=4 sts=0 sw=4 expandtab smarttab
autocmd Filetype ruby setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd BufNewFile,BufRead *.swift set syntax=cpp ts=4 sts=4 sw=4 expandtab
autocmd BufNewFile,BufRead *.jx8 set syntax=c ts=4 sts=4 sw=4 expandtab
xnoremap p pgvy
set cindent
if has("autocmd")
  filetype indent on
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
set ruler
highligh SpecialKey ctermfg=1
set list
set listchars=tab:T>

" Trailing white spaces detection "
highlight ExtraWhiteSpace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
