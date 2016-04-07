set nocompatible

" Install plugin manager automatically
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe', { 'do': 'python2 install.py' }
Plug 'davidhalter/jedi-vim'
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'Yggdroot/indentLine'
" JS
Plug 'mxw/vim-jsx'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Appearance
set number
set cursorline
syntax on
set background=dark
colorscheme solarized
highlight LineNr ctermbg=NONE
highlight CursorLineNr ctermbg=NONE

set timeoutlen=50
set mouse=a
set autoindent
set scrolloff=5

" Show title in statusline
set laststatus=2
set statusline=%t

" Search
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase

" Autocomplete commands
set wildmode=longest,list
set wildmenu history=250

" Use X clipboard as default
set clipboard=unnamedplus

" Autoreaload external changes
set autoread
au CursorHold * checktime

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_complete_in_comments=0
let g:ycm_add_preview_to_completeopt=0
let g:ycm_max_diagnostics_to_display=10

set statusline+=%=%{SyntasticStatuslineFlag()}

" jedi-vim
let g:jedi#completions_enabled=0

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" Nerdtree
map <C-x> :NERDTreeToggle<CR>

" Multiplecursors
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0

" Ctrlp
let g:ctrlp_working_path_mode='a'
let g:ctrlp_user_command = {'types': {
    \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others']
    \ }, 'fallback': 'find %s -type f'}

" Allow JSX in JS files
let g:jsx_ext_required = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Scripts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Intendation settings
set expandtab
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=4 sts=4 sw=4

" Remove highlighting on ESC in normal mode.
nnoremap <silent> <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
