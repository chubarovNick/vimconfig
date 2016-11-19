set guifont=Menlo\ for\ Powerline:h18
set number

if (has("termguicolors"))
 set termguicolors
 endif

filetype plugin indent on
filetype on
syntax on
colorscheme one
set backspace=2 " make backspace work like most other apps"

" ###
" PLUGINS
" ###

call plug#begin('~/.vim/plugged')

" UI
Plug 'nathanaelkane/vim-indent-guides'

" Addons
Plug 'kien/ctrlp.vim'
Plug 'chiel92/vim-autoformat'
Plug 'editorconfig/editorconfig-vim'
Plug 'ddrscott/vim-side-search'
Plug 'jiangmiao/auto-pairs' " Auto-insert paired symbols
Plug 'scrooloose/nerdtree'  " File explorer
Plug 'ervandew/supertab'    " Easier completion with tab
Plug 'scrooloose/syntastic' " Bunch of syntax checkers
Plug 'mkitt/tabline.vim'    " Enhances tab labels
Plug 'tpope/vim-commentary' " Commenting
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'   " Adds surrounds actions
Plug 'bronson/vim-trailing-whitespace' " Highlights trailing whitespace in red and provides
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'gorkunov/smartgf.vim'
Plug 'terryma/vim-multiple-cursors'

" Git
Plug 'tpope/vim-fugitive'   " Git utils
Plug 'airblade/vim-gitgutter' " Shows a git diff in the gutter
Plug 'imkmf/ctrlp-branches'
Plug 'airblade/vim-gitgutter'


" Snipmate stuff
Plug 'MarcWeber/vim-addon-mw-utils' " Required by snipmate
Plug 'tomtom/tlib_vim' " Required by snipmate
Plug 'garbas/vim-snipmate' " Snippets plugins
Plug 'honza/vim-snippets' " Snippets for snipmate

" Syntax
Plug 'ekalinin/Dockerfile.vim'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'tpope/vim-haml'
Plug 'digitaltoad/vim-jade'
Plug 'slim-template/vim-slim'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'elixir-lang/vim-elixir'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'thoughtbot/vim-rspec'

" JavaScript
Plug 'leafgarland/typescript-vim'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/yajs'
Plug 'jelera/vim-javascript-syntax'

call plug#end()

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
set relativenumber " Enable line numbers
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
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " change cursor view for insert/normal mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" SEARCH
set incsearch " Highlight dynamically as pattern is typed
set hlsearch " Highlight searches
set gdefault " Add the g flag to search/replace by default
set ignorecase " Ignore case of searches
nnoremap <Leader>ss :SideSearch <C-r><C-w><CR> | wincmd p

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

" CTRL-P
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
nmap <Leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" CUSTOM FILES
au BufRead,BufNewFile *.eco setfiletype html
au BufRead,BufNewFile *.hamlc setfiletype haml

" Faster exit to normal mode
set timeoutlen=1000 ttimeoutlen=0

" Plugin config

" NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1 " Always show dot files
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" Open file explorer with cursor at current file
map <Leader>n :NERDTreeFind<CR>
let NERDTreeMapOpenInTab='†'
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" Figitive
set diffopt+=vertical


" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" let g:syntastic_ruby_checkers = ['rubocop', 'mri']
" Toggle Syntastic mode
nnoremap <Leader>i :SyntasticToggleMode<CR>'

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

noremap <leader>ss :call StripWhitespace()<CR>

let g:rspec_runner = "os_x_iterm2"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Git blame on <leader>a
nnoremap <C-g><C-b> :Gblame<cr>

" Fold on space
noremap <Space> za

" Navigating over splits
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

" Faster save, and quit
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :qa<CR>

nnoremap <Leader>o :tabo<CR>

" No highlight on enter
nnoremap <CR> :noh<cr>

let g:airline_theme='one'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Navigate splits with arrows
nnoremap <Left> <C-w>h
nnoremap <Down> <C-w>j
nnoremap <Up> <C-w>k
nnoremap <Right> <C-w>l

map ß :vsplit<CR>
map <F5> :SmargfRefreshTags<CR>

nmap <C-f> <Plug>(smartgf-search)
vmap <C-f> <Plug>(smartgf-search)
nmap <C-F> <Plug>(smartgf-search-unfiltered)
vmap <C-F> <Plug>(smartgf-search-unfiltered)

set hidden
nnoremap ’ :bnext<CR>
nnoremap ” :bprev<CR>

map <D-1> :NERDTreeToggle<CR>
map <C-f> :Autoformat<CR>

" Git shortcuts
nmap <C-G> :CtrlPBranches<CR>
