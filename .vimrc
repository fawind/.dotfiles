set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Directories
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

silent call system('mkdir -p $HOME/.vim/undo')
set undodir=$HOME/.vim/undo//

silent call system('mkdir -p $HOME/.vim/swap')
set directory=$HOME/.vim/swap//

silent call system('mkdir -p $HOME/.vim/backup')
set backupdir=$HOME/.vim/backup//

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Install plugin manager automatically
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Tools
Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdtree'
Plug '907th/vim-auto-save'
Plug 'junegunn/goyo.vim'

" Syntax
Plug 'morhetz/gruvbox'
Plug 'Yggdroot/indentLine'

" Code intel
Plug 'Shougo/deoplete.nvim'
Plug 'w0rp/ale'
" Python
Plug 'zchee/deoplete-jedi'
Plug 'vim-python/python-syntax'
" Plug 'ambv/black'
" TypeScript
Plug 'HerringtonDarkholme/yats.vim'
" Go
Plug 'zchee/deoplete-go'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'parsonsmatt/intero-neovim'
" Latex
Plug 'lervag/vimtex'

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

" Autocomplete commands
set wildmode=longest,list
set wildmenu history=250

" Use X clipboard as default
set clipboard=unnamedplus

" Autoreaload external changes
set autoread
au CursorHold * checktime

" Vimcrypt
if !has('nvim')
  set cm=blowfish2
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ale
let g:ale_completion_enabled = 1
map <C-b> :ALEGoToDefinition<CR>

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Pthon syntax
let g:python_highlight_all = 1

" IndentLine
let g:indentLine_conceallevel = 0

" Nerdtree
map <C-x> :NERDTreeToggle<CR>

" Ctrlp
let g:ctrlp_working_path_mode='a'
let g:ctrlp_user_command = {'types': {
    \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others']
    \ }, 'fallback': 'find %s -type f'}

" Autosave
let g:auto_save = 1
let g:auto_save_events = ["InsertLeave"]

" vim-go
let g:go_auto_sameids = 1

" vim-black
" autocmd BufWritePre *.py execute ':Black'

" Intero
au BufWritePost *.hs InteroReload
au FileType haskell nnoremap <silent> <C-b> :InteroGoToDef<CR>

" Goyo
let g:goyo_height = '100%'
let g:goyo_linenr = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Leader keys
let mapleader=","
let maplocalleader = "\\"

" Disable features
map q: <nop>
map Q <nop>

" Format json
map <Leader>j :%!python -m json.tool<CR>

" Remove highlighting on enter
nnoremap <CR> :noh<CR><CR>

" Toggle paste
set pastetoggle=<F12>

" Toggle Goyo
map <Leader>g :Goyo<CR>

" Write file with sudo permissions
cmap w!! w !sudo tee % >/dev/null

" Line navigation
noremap j gj
noremap k gk
noremap gj j
noremap gk k
noremap H ^
noremap L $

" Buffer switching
noremap <C-i> :bprev<Cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Scripts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Return to last edit position when opening files.
function! ResumeCursorPosition()
  if line("'\"") > 0 && line("'\"") <= line("$") |
    exe "normal! g`\"" |
  endif
endfunction
autocmd BufReadPost * call ResumeCursorPosition()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Languages
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Highlight tabs
highlight SpecialKey ctermfg=1
set list
set listchars=tab:T>

filetype plugin on

" Intendation settings
set expandtab
set ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype typescript setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=4 sts=4 sw=4
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype json setlocal ts=2 sts=2 sw=2
autocmd Filetype markdown setlocal ts=4 sts=4 sw=4 linebreak
autocmd Filetype tex setlocal ts=2 sts=2 sw=2 linebreak
