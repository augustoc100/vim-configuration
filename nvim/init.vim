"zf zE

call plug#begin('~/.vim/plugged')
Plug 'dyng/ctrlsf.vim'
Plug 'Raimondi/delimitMate'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'https://github.com/nanotech/jellybeans.vim.git'
Plug 'junegunn/vim-github-dashboard'
Plug 'mattn/emmet-vim'
Plug 'kchmck/vim-coffee-script'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'osyo-manga/vim-over'
call plug#end()


" Fair Vim
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>

inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>

" swp
:set noswapfile
" Let's define The Leader
let mapleader=","

" mapper to emmet
let g:user_emmet_leader_key=","
let g:user_emmet_install_global = 0
autocmd FileType html,css,erb EmmetInstall

" Looks weird, but it could work
inoremap jj <Esc>

colorscheme jellybeans


"vim-jsx
let g:jsx_ext_required = 0

" Most common command I use mapped as <Leader>{letter}

"ctrl s f

nnoremap <Leader>f :CtrlSF
nnoremap <Leader>ff :Gsearch 
nnoremap <Leader>rf :Greplace 
nnoremap <Leader>wa :wall <cr>


noremap <Leader>w :w<cr>
nnoremap <Leader>qq :q<cr>
nnoremap <Leader>foo :split foo.txt<cr>
nnoremap <Leader>ev :split ~/.vimrc<cr>
" Fugitive Git shortcuts
nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>gd :Gdiff<cr>
nnoremap <Leader>gb :Gblame<cr>
nnoremap <Leader>gp :Ggrep<cr>
nnoremap <Leader>gl :Glog<cr>
nnoremap <Leader>gc :Gcommit<cr>
" to open CtrlP Buffer list
nnoremap <Leader>fb :CtrlPBuffer<cr>
nnoremap <Leader>fko <C-w>o
" Zoom in/out current file
nnoremap <Leader>zi <C-W>_<C-W>\|
nnoremap <Leader>zo <C-W>=
" Split movement shortcut
nnoremap <silent> <C-w>l <C-W>l<C-w>=20<C-w>>5<C-w>+<cr>
nnoremap <silent> <C-w>h <C-W>h<C-W>=20<C-w>>5<C-w>+<cr>
nnoremap <silent> <C-w>j <C-W>j<C-W>=5<C-w>+<cr>
nnoremap <silent> <C-w>k <C-W>k<C-W>=5<C-w>+<cr>

" Normal configuration
filetype on                 " Automatically detect file types.
filetype indent on          " vim-ruby plugin for indentation
filetype plugin on          " vim-ruby plugin
syntax enable
set autoindent

set fileformat=unix         " File format UNIX LIKE LF instead of CRLF
set encoding=utf-8          " file encoding
set ruler                   " Ruler on
set relativenumber          " Relative Line numbers on
set wrap                  " Line wrapping off
"set clipboard=unnamedplus     " Yanks level 99+ (take copy from system's clipboard)
set history=1                " Number of things to remember in history.
set timeoutlen=250              " Time to wait after ESC (default causes an annoying delay)
set novisualbell                " No blinking .
set noerrorbells                " No noise.
set laststatus=2                " Always show status line.
set backspace=indent,eol,start  " delete key
set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:< " Show $ at end of line and trailing space as ~

" Searching Highlight with * or # (clean with space)
set hlsearch
set incsearch
set ignorecase    " searches are case insensitive...
set smartcase     " ... unless they contain at least one capital letter
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Don't add the comment prefix when I hit enter or o/O on a comment line.
au! FileType mkd setlocal syn=off                                              " Don't syntax highlight markdown because it's often wrong.
au! BufRead,BufNewFile *.markdown set filetype=mkd
au! BufRead,BufNewFile *.md       set filetype=mkd

" Remove trailing whitespace on save
au BufWritePre *.rb :%s/\s\+$//e
au BufWritePre *.java :%s/\s\+$//e
au BufWritePre *.php :%s/\s\+$//e
au BufWritePre *.css :%s/\s\+$//e
au BufWritePre *.js :%s/\s\+$//e

" Auto completion menu with matches list
set wildmenu "enable ctrl-n and ctrl-p to scroll thru matches
set wildmode=list:longest
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*app/cache/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip
set wildignore+=*.git/**,.svn/**,*.git,*.svn


" Formatting
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype php setlocal ts=4 sts=4 sw=4
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
set tabstop=2
set shiftwidth=2
set expandtab
set cinoptions=i2,+2,+p2
set cinwords=if,else,while,do,for,switch,case,class,def
set cindent
set autoindent
set smarttab
set ft=ruby

"comments
autocmd FileType ruby setlocal commentstring=#\ %s
"gc to put comments


"tmux and vim configuration
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>
" nnoremap <leader>ll :VtrSendLinesToRunner <cr>
" nnoremap <leader>la :VtrAttachToPane 

"attath a comand tmux with vim
" nnoremap <leader>rb :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'irb'}<cr>


"rspec with vim and tmux

"test

nnoremap <leader>t :w <cr> :! bundle exec rspec %  <cr>



" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

"clipboard
map <Leader>y "+y <cr>

" %s
map <Leader>s :OverCommandLine <cr> %s/

