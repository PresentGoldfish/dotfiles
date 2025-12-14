" =============================================================================
" Minimal Vim Configuration with vim-ollama + DeepSeek-Coder-V2:16B
" =============================================================================

" Core essentials
set nocompatible
set encoding=utf-8
syntax enable
filetype plugin indent on

" Terminal colors (simple detection)
if has('termguicolors') && $TERM_PROGRAM != 'Apple_Terminal'
    set termguicolors
endif

" =============================================================================
" Plugin Management (vim-plug)
" =============================================================================
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Plugins
call plug#end()

" =============================================================================
" Essential Settings Only
" =============================================================================

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Indentation
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Basic UI
set number
set ruler
set showcmd
set laststatus=2
set wildmenu
set wildmode=longest:full,full

" Performance
set lazyredraw
set updatetime=300

" File handling
set autoread
set hidden
set nobackup
set noswapfile

" Built-in file browsing
set path+=**

" =============================================================================
" Essential Key Mappings
" =============================================================================
let mapleader = " "

" Quick save/quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Clear search highlighting
nnoremap <leader>/ :nohlsearch<CR>

" File browsing (built-in)
nnoremap <leader>e :E<CR>

" Buffer navigation
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>

" =============================================================================
" Auto Commands (minimal)
" =============================================================================
augroup MinimalVim
    autocmd!
    " Remove trailing whitespace on save
    autocmd BufWritePre * :%s/\s\+$//e
    " Return to last edit position
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" =============================================================================
" Enable clipboard integration
" =============================================================================
set clipboard^=unnamed,unnamedplus

" Ensure vim has clipboard support
if has('clipboard')
    set clipboard^=unnamed,unnamedplus
endif
