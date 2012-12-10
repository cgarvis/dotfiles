" Pathogeen Configurations
call pathogen#infect()
call pathogen#helptags()

set encoding=utf-8
set nocompatible               " be iMproved
filetype off                   " required!
filetype indent on

" Colours
set background=dark
colorscheme solarized

" Basic
syntax enable
set relativenumber " show relative line numbers.  Use 'number' if you just want nubmers
set hidden
set backspace=indent,eol,start
set directory=/tmp// " Keep swap files in one location
set ffs=unix,dos,mac "Default file types
set nowrap        " don't wrap lines
set showmatch     " set show matching parenthesis
nnoremap / /\v
vnoremap / /\v
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
nnoremap <leader><space> :noh<cr>
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

au FocusLost * :wa " auto save when vim loses focus

" Tabs & spaces
set tabstop=4     " a tab is four spaces
set shiftwidth=4  " number of spaces to use for autoindenting
set softtabstop=4
set expandtab
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting

" Statusline goodness
"""""""""""""""""""""
set laststatus=2
set statusline=%#identifier#
set statusline+=[%t]    "tail of the filename
set statusline+=%*

" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" General Code Folding
""""""""""""""""""""""
set foldmethod=indent
set foldlevel=99

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" easier navigation around brackets
nnoremap <tab> %
vnoremap <tab> %

" Ruby Configurations
"""""""""""""""""""""
autocmd Filetype ruby set shiftwidth=2 tabstop=2 colorcolumn=80
autocmd BufRead Vagrantfile set filetype=ruby

" PHP Configurations
""""""""""""""""""""
autocmd FileType php setlocal colorcolumn=100 noexpandtab tabstop=2 shiftwidth=2
autocmd FileType php noremap <c-p>l :!/usr/bin/php -l %<cr>
autocmd FileType php setlocal makeprg=php\ -ln\ %
autocmd FileType php setlocal errorformat=%m\ in\ %f\ on\ line\ %l
autocmd FileType php setlocal noeol binary fileformats="mac,unix,dos"
autocmd QuickFixCmdPre make w

" Drupal Configurations
"""""""""""""""""""""""
augroup module
    autocmd BufRead *.inc set filetype=php
    autocmd BufRead *.module set filetype=php
    autocmd BufRead *.test set filetype=php
augroup end

" Coffeescript configurations
"""""""""""""""""""""""""""""
autocmd FileType coffee setlocal foldmethod=indent
autocmd FileType coffee setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab colorcolumn=80
autocmd BufRead Cakefile set filetype=coffee

" Javascript configurations
"""""""""""""""""""""""""""
au BufNewFile,BufReadPost *.js setlocal shiftwidth=2 tabstop=2 expandtab colorcolumn=80

" Jade configurations
"""""""""""""""""""""
au BufNewFile,BufReadPost *.jade setlocal shiftwidth=2 expandtab

" Make configurations
"""""""""""""""""""""
autocmd FileType make setlocal noexpandtab

" Make sure we hilight extra whitespace in the most annoying way possible.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Lets remove that whitespace
"nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
autocmd FileType c,cpp,java,php,js,rb,coffee autocmd BufWritePre <buffer> :%s/\s\+$//e

" Fix those pesky situations where you edit & need sudo to save
cmap w!! w !sudo tee % >/dev/null

" Command-T configurations
""""""""""""""""""""""""""
" use comma as <Leader> key instead of backslash
let mapleader=","
set wildignore=*.o,*.obj,.git,node_modules/**

" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

map <leader>t :CommandTFlush<cr>\|:CommandT<cr>
map <leader>T :CommandTFlush<cr>\|:CommandT %%<cr>

" ignores
set wildignore=*.o,*.obj,.git,node_modules/**,tmp/**

" make switching back to the previous buffer easier
nnoremap <leader><leader> <c-^>

" easier code folding
map <leader>f :set foldmethod=indent<cr>zM<cr>
map <leader>F :set foldmethod=manual<cr>zR<cr>

" make switch to normal mode easier
inoremap jj <ESC>

" center on current line
nmap n nzz
nmap N Nzz

set scrolloff=7

"insert blank line above or below current line from normal mode
nnoremap _ :put =''<cr>
nnoremap - :put! =''<cr>
