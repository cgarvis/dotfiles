set encoding=utf-8
set nocompatible               " be iMproved
filetype off                   " required!
filetype indent on

" Colours
syntax enable
set background=dark
colorscheme solarized

" Basic
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
set scrolloff=7          " show lines above or below cursor when scrolling
set shell=bash


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
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

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
autocmd BufRead Gemfile set filetype=ruby
autocmd BufRead Vagrantfile set filetype=ruby
autocmd BufRead *.thor set filetype=ruby
autocmd BufRead *.ru set filetype=ruby

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
autocmd BufNewFile,BufRead *.json setfiletype js
au BufNewFile,BufReadPost *.js setlocal shiftwidth=2 tabstop=2 expandtab colorcolumn=80

" Jade configurations
"""""""""""""""""""""
au BufNewFile,BufReadPost *.jade setlocal shiftwidth=2 expandtab

" Make configurations
"""""""""""""""""""""
autocmd FileType make setlocal noexpandtab

" Puppet configurations
"""""""""""""""""""""""
au BufNewFile,BufReadPost *.pp setlocal shiftwidth=2 tabstop=2 expandtab colorcolumn=80

" SASS configurations
"""""""""""""""""""""
autocmd BufNewFile,BufRead *.sass setfiletype sass
autocmd BufNewFile,BufRead *.scss setfiletype sass
autocmd FileType sass setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab colorcolumn=80

" GO configurations
"""""""""""""""""""
autocmd FileType go setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab colorcolumn=100
autocmd BufNewFile,BufReadPost *.go set filetype=go

" Terraform configuration
""""""""""""""""""""""""""
autocmd FileType tf setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab colorcolumn=100
autocmd BufNewFile,BufReadPost *.tf set filetype=tf
autocmd BufNewFile,BufReadPost *.tfvars set filetype=tf

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

let mapleader=","

" CtrlP configirations
"""""""""""""""""""""
set runtimepath^=~/.vim/bundle/ctrlp.vim

" ignores
set wildignore+=*.o,*.obj,.git,*/node_modules/*,*/tmp/*,*.swp
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn|node_modules)$'
    \ }

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

"insert blank line above or below current line from normal mode
nnoremap _ :put =''<cr>
nnoremap - :put! =''<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MapCR()
  nnoremap <cr> :call RunTestFile()<cr>
endfunction
call MapCR()
nnoremap <leader>T :call RunNearestTest()<cr>
nnoremap <leader>a :call RunTests('')<cr>
nnoremap <leader>c :w\|:!script/features<cr>
nnoremap <leader>w :w\|:!script/features --profile wip<cr>

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTests(filename)
    " Write the file and run tests for the given filename
    if expand("%") != ""
      :w
    end
    if match(a:filename, '\.feature$') != -1
        exec ":!script/features " . a:filename
    else
        " First choice: project-specific test script
        if filereadable("script/test")
            exec ":!script/test " . a:filename
        " Fall back to the .test-commands pipe if available, assuming someone
        " is reading the other side and running the commands
        elseif filewritable(".test-commands")
          let cmd = 'rspec --color --format progress --require "~/.vim/rspec_formatter" --format VimFormatter --out tmp/quickfix'
          exec ":!echo " . cmd . " " . a:filename . " > .test-commands"

          " Write an empty string to block until the command completes
          sleep 100m " milliseconds
          :!echo > .test-commands
          redraw!
        " Fall back to a blocking test run with Bundler
        elseif filereadable("Gemfile")
            exec ":!rspec --color " . a:filename
        " Fall back to a normal blocking test run
        else
            exec ":!rspec --color " . a:filename
        end
    end
endfunction
