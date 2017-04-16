set guifont=Fira\ Code:h18

filetype plugin indent on
filetype on
syntax on

set backspace=2 " make backspace work like most other apps"

" ###
" PLUGINS
" ###

call plug#begin('~/.vim/plugged')

" UI
Plug 'nathanaelkane/vim-indent-guides'
Plug 'arcticicestudio/nord-vim'

" Addons
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'chiel92/vim-autoformat'
Plug 'editorconfig/editorconfig-vim'
Plug 'ddrscott/vim-side-search'
Plug 'jiangmiao/auto-pairs' " Auto-insert paired symbols
Plug 'scrooloose/nerdtree'  " File explorer
Plug 'EvanDotPro/nerdtree-symlink'
Plug 'ervandew/supertab'    " Easier completion with tab
Plug 'scrooloose/syntastic' " Bunch of syntax checkers
Plug 'mkitt/tabline.vim'    " Enhances tab labels
Plug 'scrooloose/nerdcommenter' " Commenting
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'   " Adds surrounds actions
Plug 'bronson/vim-trailing-whitespace' " Highlights trailing whitespace in red and provides
Plug 'AndrewRadev/splitjoin.vim'
"Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/BufOnly.vim'
Plug 'ternjs/tern_for_vim', {'do': 'cd ~/.vim/plugged/tern_for_vim && npm i'}

" Git
Plug 'tpope/vim-fugitive'   " Git utils
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter' " Shows a git diff in the gutter
Plug 'tpope/vim-unimpaired'


" Snipmate stuff
Plug 'MarcWeber/vim-addon-mw-utils' " Required by snipmate
Plug 'tomtom/tlib_vim' " Required by snipmate
Plug 'garbas/vim-snipmate' " Snippets plugins
Plug 'honza/vim-snippets' " Snippets for snipmate

" Syntax
Plug 'ekalinin/Dockerfile.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'tpope/vim-haml'
Plug 'slim-template/vim-slim'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'

" Postgres
Plug 'vim-scripts/dbext.vim'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'thoughtbot/vim-rspec'
Plug 'jgdavey/tslime.vim'
Plug 'tpope/vim-endwise'

" JavaScript
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/yajs'
Plug 'jelera/vim-javascript-syntax'

call plug#end()

colorscheme nord
let g:airline_theme='nord'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1


" GENERAL
set nocompatible " Don't use own default settings
set ttyfast " Optimize for fast terminal connections
set encoding=utf-8 nobomb " Use UTF-8 without BOM
set list " trailing whitespace can be seen
set mouse=a " Enable mouse in all modes
set clipboard=unnamed " Use the OS clipboard by default (on versions compiled with `+clipboard`)
set autoread " Reload files changed outside vim (but doesn't check periodically!)
set shortmess=a " Short the status message
" Ignore this paths
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*
set wildignore+=*.so,*.swp,*.zip,*/test/files/*,*/webpack.bundle.js
" Jump to the last cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal g`\"" | endif
set report=0 " Show all changes

" UI SETTINGS
set guioptions-=T " Drop scrollbar
set guioptions-=r
set number
set nowrap
set showcmd " Show the (partial) command as it’s being typed
set showmode " Show the current mode
set cursorline " Highlight current line
set wildmenu " visual autocomplete for command menu
set showmatch  " highlight matching [{()}] "
set title " Show the filename in the window titlebar
set ruler " Show the cursor position
set nostartofline " Don’t reset cursor to start of line when moving around.
set shortmess=atI " Don’t show the intro message when starting Vim
set lcs=tab:▸\ ,trail:·,nbsp:_ " Show “invisible” characters
set noerrorbells " Disable error bells

if exists('$TMUX')
  set ttymouse=xterm2
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
"
" SEARCH
set incsearch " Highlight dynamically as pattern is typed
set hlsearch " Highlight searches
set gdefault " Add the g flag to search/replace by default
set ignorecase " Ignore case of searches
" hi IncSearch ctermbg=<color name> ctermfg=<color name>
" hi Search ctermbg=<color name> ctermfg=<color name>


" FOLDING
set foldenable          "dont fold by default
set foldmethod=indent   "fold based on indent
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max

" NAVIGATION
set backspace=indent,eol,start " Allow backspace in insert mode

" INDENTATION/TABS
set tabstop=2     " read as
set softtabstop=2 " insert as
set expandtab     " tabs are spaces
set autoindent
set smartindent
set smarttab
set shiftwidth=2

" SPLITS
set splitbelow
set splitright

" BACKUPS/SWAPS
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif
set backupskip=/tmp/*,/private/tmp/* " Don’t create for certain directories


let g:rspec_command = 'call Send_to_Tmux("be rspec --format progress {spec}\n")'
 map <Leader>t :call RunCurrentSpecFile()<CR>
 map <Leader>s :call RunNearestSpec()<CR>
 map <Leader>l :call RunLastSpec()<CR>
 map <Leader>a :call RunAllSpecs()<CR>

nnoremap <Leader>ss :SideSearch <C-r><C-w><CR> | wincmd p

" CTRL-P
"let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" let g:ctrlp_working_path_mode = 'ar'
"nmap <Leader>bb :CtrlPBuffer<cr>
"nmap <leader>bm :CtrlPMixed<cr>
"nmap <leader>bs :CtrlPMRU<cr>
"" CUSTOM FILES
"au BufRead,BufNewFile *.eco setfiletype html
"au BufRead,BufNewFile *.hamlc setfiletype haml

" Faster exit to normal mode
set timeoutlen=1000 ttimeoutlen=0

" Plugin config

let g:jsx_ext_required = 0
" Idents

" NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1 " Always show dot files
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" Open file explorer with cursor at current file
map <Leader>f :NERDTreeFind<CR>
let NERDTreeMapOpenInTab='†'
map <Leader>n :NERDTreeToggle<CR>

" Figitive

" Syntastic
"
"

" let g:syntastic_ruby_checkers = ['rubocop', 'mri']
" Toggle Syntastic mode

" ###
" CUSTOM MAPPINGS
" ###

" Strip trailing whitespace
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction

nnoremap <Leader>b :Gblame<cr>

" Fold on space
noremap <Space> za

" Faster save, and quit
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :qa<CR>

nnoremap <Leader>o :tabo<CR>

" No highlight on enter
nnoremap <CR> :noh<cr>


" Navigate splits with arrows
nnoremap <Left> <C-w>h
nnoremap <Down> <C-w>j
nnoremap <Up> <C-w>k
nnoremap <Right> <C-w>l

map <Leader>v :vsplit<CR>
map <Leader>s :split<CR>


set hidden

nnoremap <C-J> :bnext<CR>
nnoremap <C-K> :bprev<CR>
nnoremap <C-D> :bd<CR>

map <C-a> :Autoformat<CR>
map <C-B> :Buffers<CR>
map <C-f> :Files<CR>

" Git shortcuts

"Dbnext config
let g:dbext_default_profile = 'psql'
let g:deoplete#enable_at_startup = 1
