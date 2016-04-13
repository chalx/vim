if 0 | endif

"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath^=~/.vim/neobundle.vim/

" Required:
if isdirectory(glob("~/.vim/bundle/neobundle.vim"))
  call neobundle#begin(expand('~/.vim/bundle'))

  " Let NeoBundle manage NeoBundle
  " Required:
  NeoBundleFetch 'Shougo/neobundle.vim'

  " Add or remove your Bundles here:
  NeoBundle 'Shougo/neosnippet.vim'
  NeoBundle 'Shougo/neosnippet-snippets'
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'ctrlpvim/ctrlp.vim'
  NeoBundle 'flazz/vim-colorschemes'
  NeoBundle 'Valloric/YouCompleteMe'
  NeoBundle 'bling/vim-airline'
  NeoBundle 'derekwyatt/vim-scala'
  NeoBundle 'leafgarland/typescript-vim'
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle "vim-airline/vim-airline-themes"
  NeoBundle "airblade/vim-gitgutter"
  NeoBundle "groenewege/vim-less"
  " You can specify revision/branch/tag.
  NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
  NeoBundle 'zhaocai/GoldenView.Vim'
  " Required:
  call neobundle#end()

  " Required:
  filetype plugin indent on

  " If there are uninstalled bundles found on startup,
  " this will conveniently prompt you to install them.
  NeoBundleCheck
  "End NeoBundle Scripts-------------------------
endif


syntax on 
set ruler
set number
set showcmd
set showmode
set foldenable
set showmatch
set noexrc

set incsearch
set hlsearch
set ignorecase
set smartcase

set laststatus=2
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set shiftround
set nowrap

set cindent
set autoindent
set copyindent

set noerrorbells
set wildmenu
set wildmode=list:longest
set wildignorecase

set hidden
set cmdheight=2

set clipboard=unnamed
set novisualbell
set history=1000
set undolevels=1000
set title

set nobackup
set noswapfile
set tags=tags;/

" YouCompleteMe
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Close NERDTree if is the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <silent> <C-T><C-T> :NERDTreeToggle<CR>

" Remove arrows 
nnoremap <Up> ""
nnoremap <Down> ""
nnoremap <Left> ""
nnoremap <Right> ""

" Set airline theme
let g:airline_theme="hybridline"

" If .vim folder is not created, then install NeoBundle
function! InstallNeoBundle()
    call system("curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh")
    call system("sh install.sh")
endfunction

if !isdirectory(glob("~/.vim"))
  :echo "Install NeoBundle. Please wait"
  call InstallNeoBundle()
  :so $MYVIMRC
endif
" End auto neobundle install
