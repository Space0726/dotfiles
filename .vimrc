set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'

call vundle#end()
nmap nerd :NERDTreeToggle<CR>
filetype plugin indent on
filetype plugin on
set cindent
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set nu
set ruler
set title
syntax on
set hlsearch
set bg=dark
set et
set incsearch
set showcmd
set autoread
set mouse=a
set visualbell      " Show error sign on screen instead of sound
set ww+=h,l         " Possible to move line using h,l
set linebreak       " Break line by word

" Compile c or c++ file and run
function Compile()
    execute '!clear && compile ' . expand('%:t')
endfunction

map <Leader>c :call Compile()<CR>

" Compile c or c++ file and run
function Run()
    execute '!clear && compile ' . expand('%:t') . ' && run_in_vim ' . expand('%:t')
endfunction

map <Leader>r :call Run()<CR>

" For NERDCommenter
let g:NERDCustomDelimiters = {'cpp': { 'left': '// ', 'leftAlt': '/*', 'rightAlt': '*/'}}

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let @p="i#include <iostream>\<CR>\<CR>using namespace std;\<CR>\<CR>int main() {\<CR>ios::sync_with_stdio(false);\<CR>cin.tie(NULL);\<CR>\<CR>\<CR>return 0;\<CR>}\<Esc>kkko"
let @i="i#include <cstdio>\<CR>\<CR>using namespace std;\<CR>\<CR>int main() {\<CR>\<CR>return 0;\<CR>}\<Esc>kkko"
let @c="i#include <stdio.h>\<CR>\<CR>int main() {\<CR>\<CR>return 0;\<CR>}\<Esc>kkko"
