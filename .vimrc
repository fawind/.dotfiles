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
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'Yggdroot/indentLine'
Plug 'leafgarland/typescript-vim'
Plug 'reedes/vim-pencil'
Plug 'tomlion/vim-solidity'
Plug 'lervag/vimtex'
Plug 'junegunn/goyo.vim'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Appearance
set number
set relativenumber
set cursorline
syntax on
set background=dark

let g:gruvbox_termcolors=16
let g:gruvbox_contrast_dark='soft'
colorscheme gruvbox

set timeoutlen=1000
set mouse=a
set autoindent
set scrolloff=5

set noswapfile

set splitbelow
set splitright

" Show title and modified in statusbar
set statusline=%t%m

" Search
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase

" Leader keys
let mapleader=","
let maplocalleader = "\\"

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

" IndentLine
let g:indentLine_conceallevel = 0

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" Nerdtree
map <C-x> :NERDTreeToggle<CR>

" Ctrlp
let g:ctrlp_working_path_mode='a'
let g:ctrlp_user_command = {'types': {
    \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others']
    \ }, 'fallback': 'find %s -type f'}

" Vimtex
let g:vimtex_view_method = 'mupdf'
let g:vimtex_latexmk_build_dir = 'localCompile'

if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
\ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
\ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
\ 're!\\hyperref\[[^]]*',
\ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
\ 're!\\(include(only)?|input){[^}]*',
\ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
\ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
\ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
\ ]

" Pencil
let g:pencil#wrapModeDefault = 'soft'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Scripts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin on

" Format json
map <Leader>j :%!python -m json.tool<CR>

" Remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Intendation settings
set expandtab
set ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype typescript setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=4 sts=4 sw=4
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2
autocmd Filetype tex setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype json setlocal ts=2 sts=2 sw=2
autocmd Filetype markdown setlocal ts=4 sts=4 sw=4

" Text files
augroup pencil
  autocmd!
  autocmd FileType markdown,plaintex,tex call pencil#init()
    \ | setlocal spell spelllang=en_us
    \ | set conceallevel=0
augroup END

" Remove highlighting on Enter.
nnoremap <CR> :noh<CR><CR>

" Write file with sudo permissions.
cmap w!! w !sudo tee % >/dev/null
