set nocompatible
filetype off

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'

call vundle#end()
filetype plugin indent on

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
colors zenburn

set timeoutlen=50
set mouse=a
set autoindent

" Search
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase

" Autocomplete commands
set wildmode=longest,list
set wildmenu history=250

" Reload when file changed on the disk
set autoread

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Airline
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme='bubblegum'

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Scripts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Autoreaload external changes
set autoread
au CursorHold * checktime

" Remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e
