" If for some reason things aren't installed automatically, run PlugInstall
" Then 'so $MYVIMRC'

" Installing vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" List of plugins to have installed
call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'joshdick/onedark.vim'
  Plug 'nanotech/jellybeans.vim'
  Plug 'yuttie/comfortable-motion.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'preservim/nerdcommenter'
  Plug 'tpope/vim-surround'
call plug#end()

" Configuration start

" PWD will be added to the vim path with all subfolders
set path=$PWD/**


set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf-8
let $GIT_ASKPASS='true'
syntax on
set number
let mapleader = ","
set tabstop=2
set expandtab
set shiftwidth=2
set showcmd
set cursorline
set showmatch
set incsearch
set hlsearch
set rnu
set termguicolors
set autoindent
set smartindent
set completeopt-=preview
set clipboard=unnamed
set updatetime=400
set list listchars=tab:»·,trail:·
set backspace=indent,eol,start
nnoremap dD ""dd
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap WW :w <CR>
nnoremap WQ :wq <CR>
nnoremap QQ :q! <CR>
nnoremap <C-j> 10jzz
nnoremap <C-k> 10kzz
nnoremap <C-l> :noh<CR>
nnoremap <s-t> :tabnew<CR>

" fzf integration
set rtp+=/usr/local/opt/fzf
nnoremap <leader>cd :cd %:p:h<CR> " making current file folder a global working folder
nnoremap <leader>lcd :lcd %:p:h<CR> " making current file folder a current fileworking folder
nnoremap <s-f> :Files<CR>

" nerdtree here
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Tab navigation
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
imap jj <Esc>
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

" nerdcommenter
let g:NERDDefaultAlign = 'left'   " Align comment marks to the left == don't follow identation
let g:NERDSpaceDelims = 1         " Insert space after comment slug

" Colorscheme
colorscheme jellybeans
