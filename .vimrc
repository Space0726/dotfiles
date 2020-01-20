set nocompatible
filetype off

" ----------------------------------------------------------------------------
" Plugin settings
" ----------------------------------------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'

call vundle#end()
filetype plugin indent on
filetype plugin on

" ----------------------------------------------------------------------------
" Vim settings
" ----------------------------------------------------------------------------
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

" ----------------------------------------------------------------------------
" <tab> / <s-tab> | Circular windows navigation
" ----------------------------------------------------------------------------
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" ----------------------------------------------------------------------------
" Moving lines
" ----------------------------------------------------------------------------
nnoremap <silent> <C-k> :move-2<CR>
nnoremap <silent> <C-j> :move+<CR>
nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>
xnoremap <silent> <C-k> :move-2<CR>gv
xnoremap <silent> <C-j> :move'>+<CR>gv
xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv
xnoremap < <gv
xnoremap > >gv


" ----------------------------------------------------------------------------
" Compile c, c++, java source file
" ----------------------------------------------------------------------------
function Compile()
    !clear && bash compile '%:p'
endfunction

nnoremap <Leader>c :call Compile()<CR>

" ----------------------------------------------------------------------------
" Compile c, c++ source file and debug with gdb
" ----------------------------------------------------------------------------
function Debug()
    !clear && bash compile -g '%:p' && gdb '%:p:r'
endfunction

nnoremap <Leader>d :call Debug()<CR>

" ----------------------------------------------------------------------------
" Compile c, c++, java, python source file and run
" ----------------------------------------------------------------------------
function Run()
    !clear && bash compile '%:p' && run '%:p'
endfunction

nnoremap <Leader>r :call Run()<CR>

" ----------------------------------------------------------------------------
" For Tagbar
" ----------------------------------------------------------------------------
nnoremap <F8> :TagbarToggle<CR>

" ----------------------------------------------------------------------------
" For NERDTree
" ----------------------------------------------------------------------------
nnoremap nerd :NERDTreeToggle<CR>

" ----------------------------------------------------------------------------
" For NERDCommenter
" ----------------------------------------------------------------------------
let g:NERDCustomDelimiters = {'cpp': { 'left': '// ', 'leftAlt': '/*', 'rightAlt': '*/'}}

" ----------------------------------------------------------------------------
" For Airline
" ----------------------------------------------------------------------------
let g:airline_theme = 'bubblegum'

" ----------------------------------------------------------------------------
" Close vim if the only window left open is a NERDTree
" ----------------------------------------------------------------------------
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ----------------------------------------------------------------------------
" Macros
" ----------------------------------------------------------------------------
let @p="i#include <iostream>\<CR>\<CR>using namespace std;\<CR>\<CR>int main() {\<CR>ios::sync_with_stdio(false);\<CR>cin.tie(NULL);\<CR>\<CR>\<CR>return 0;\<CR>}\<Esc>kkko"
let @i="i#include <cstdio>\<CR>\<CR>using namespace std;\<CR>\<CR>int main() {\<CR>\<CR>return 0;\<CR>}\<Esc>kkko"
let @c="i#include <stdio.h>\<CR>\<CR>int main() {\<CR>\<CR>return 0;\<CR>}\<Esc>kkko"
