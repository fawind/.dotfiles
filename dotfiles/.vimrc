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
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe', { 'do': 'python2 install.py' }
Plug 'davidhalter/jedi-vim'
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Appearance
set noshowmode
set number
set cursorline
" set colorcolumn=80
syntax on
set background=dark
colorscheme solarized
highlight LineNr ctermbg=NONE
highlight CursorLineNr ctermbg=NONE

set timeoutlen=50
set mouse=a
set autoindent
set scrolloff=5

" Search
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase

" Autocomplete commands
set wildmode=longest,list
set wildmenu history=250

" Killing the habbits
imap <Up> <NOP>
imap <Down> <NOP>
imap <Left> <NOP>
imap <Right> <NOP>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Airline
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme='solarized'
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_complete_in_comments=0
let g:ycm_add_preview_to_completeopt=0
let g:ycm_max_diagnostics_to_display=10
let g:ycm_filetype_whitelist={'cpp':1, 'c':1, 'python':1}

" jedi-vim
let g:jedi#completions_enabled=0

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Nerdtree
map <C-x> :NERDTreeToggle<CR>

" Multiplecursors
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Scripts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Autoreaload external changes
set autoread
au CursorHold * checktime

" Remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Intendation settings
set expandtab
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=4 sts=4 sw=4
