"============================================================================="
"       vim configuration - by dean poulos (dean.poulos7@protonmail.com)      "
"============================================================================="
" services include:                                                           " 
" - syntax highlighting using PaperColor                                      "
" - tabstopping at 4 spaces                                                   "
" - automatic text wrapping at 80 spaces                                      "
" - word processor mode function with spellchecking                           "
" - vundle plugin/runtime path handler                                        "
" - relative line number                                                      "
"============================================================================="
" prerequisites (to install, use :PluginInstall within vim):                  "
" - PaperColor theme: https://github.com/NLKNguyen/papercolor-theme           "
" - Vundle:           https://github.com/VundleVim                            "
" - HardMode:         https://github.com/wikitopian/hardmode                  "
"============================================================================="

" plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
 
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'wikitopian/hardmode'
    Plugin 'junegunn/fzf.vim'
    Plugin 'tpope/vim-surround'
    Plugin 'dracula/vim'
    Plugin 'NLKNguyen/papercolor-theme'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'sainnhe/edge'
    Plugin 'morhetz/gruvbox'
    Plugin 'segeljakt/vim-stealth'
    Plugin 'tpope/vim-fugitive'
call vundle#end()

filetype plugin indent on

" hardmode
" - autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" create new line under cursor in normal mode
nmap <S-Enter> O<Esc>

" standard theming
syntax enable
set background=dark
color gruvbox

" match terminal/vim colourscheme 
" https://www.reddit.com/r/vim/comments/6dh58v/synching_the_terminals_background_with_vim/
autocmd ColorScheme * highlight! Normal ctermbg=NONE guibg=NONE

" document formatting
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set textwidth=80
set relativenumber

" copy-pasting to clipboard
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
