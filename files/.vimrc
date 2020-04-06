set nocompatible
filetype off                  " required

filetype plugin indent on    " required

syntax on

" Solarized colors
"set background=dark
"colorscheme solarized

colorscheme molokai

filetype plugin indent on
set colorcolumn=80

set scrolloff=5
set noignorecase

" <leader> key:
let mapleader = ","

set autoindent

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set ls=2

" show tabs and spaces
set showtabline=2

" Use it to paste text from external sources so it can be intended properly.
set pastetoggle=<F5>

" relativenumber changes Vim’s line number column to display how far away each
" line is from the current one, instead of showing the absolute line number.
"
" I almost never care what numeric line I’m on in a file (and if I do I can
" see it in the status line), so I don’t miss the normal line numbers. I do
" care how far away a particular line might be, because it tells me what
" number I need to use with motion commands like d<NUMBER>d.
"set relativenumber

" Show line numbers
set number

" Mapping to toggle line numbers.
nmap <C-N><C-N> :set invnumber<CR>

" undofile tells Vim to create <FILENAME>.un~ files whenever you edit a file.
" These files contain undo information so you can undo previous actions even
" after you close and reopen a file.
set undofile

" set nocompatible gets rid of all the crap that Vim does to be vi compatible.
" It’s 2010 — we don’t need to be compatible with vi at the expense of
" functionality any more.
set nocompatible

" ignorecase and smartcase together make Vim deal with case-sensitive search
" intelligently. If you search for an all-lowercase string your search will be
" case-insensitive, but if one or more characters is uppercase the search will
" be case-sensitive. Most of the time this does what you want.
set ignorecase
set smartcase

" Realtime search
set incsearch
set showmatch
set hlsearch

set wildignore+=log,tmp,doc,.git

" Bash-like filenames autocomplete
set wildmode=longest,list

" Save all files when losing focus from vim's window
au FocusLost * :wa

nnoremap <leader><space> :noh<cr>

" New Vim users will want the following lines to teach them to do things
" right.
" This will disable the arrow keys while you’re in normal mode to help you
" learn to use hjkl. Trust me, you want to learn to use hjkl. Playing a lot of
" Nethack also helps.
"
" It also disables the arrow keys in insert mode to force you to get back into
" normal mode the instant you’re done inserting text, which is the “right way”
" to do things.
"
" It also makes j and k work the way you expect instead of working in some
" archaic “movement by file line instead of screen line” fashion.
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

" Переключение табов по Ctrl+PageDown (следующая) и Ctrl+PageUp (предыдущая)
if &term =~ "xterm"
  imap <A-Down> <ESC>gTi
  imap <A-Up> <ESC>gti
  nmap <A-Up> gt
  nmap <A-Down> gT
endif

"map <C-1> 1gt
"map <C-2> 2gt
"map <C-3> 3gt

" NERDTree hotkeys
"nmap <F3> :NERDTreeToggle<CR>
"vmap <F3> <ESC>:NERDTreeToggle<CR>i
"imap <F3> <ESC>:NERDTreeToggle<CR>i

"I also like to make ; do the same thing as : — it’s one less key to hit every
"time I want to save a file:
nnoremap ; :

" Retab whole file aka prettify.
map <F7> mzgg=G`z<CR>

" Split window vertically
nnoremap <leader>w <C-w>v<C-w>l

let g:ackprg="ack-grep -H --nocolor --nogroup --column"

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"inoremap " '
"inoremap ' "
map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >

" Turn syntax highlight on for different porgramming langs.
au BufNewFile,BufRead *.as set filetype=actionscript
au BufNewFile,BufRead *.hamlc set filetype=haml
au BufNewFile,BufRead *.litcoffee set filetype=coffee
au BufNewFile,BufRead *.cjsx set filetype=coffee
au BufNewFile,BufRead *.cjsx.erb set filetype=coffee
"au BufNewFile,BufRead *.json set ft=javascript

au FocusLost * :wa

"au FileType ruby,javascript,coffee,haml,erb call rainbow#load()
"let g:rainbow_active = 1
"au syntax * call rainbow#activate()
"au syntax * call rainbow#load()

ca tn tabnew

" Remove trailing whitespaces before saving
autocmd BufWritePre *.rb,*.erb,*.js,*.coffee,*.css,*.sass,*.scss,*.rake,*.hamlc,*.cjsx,*.yml,*.md :%s/\s\+$//e | %s/\($\n\s*\)\+\%$//e

"autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
"autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

""" Folding settings """
set foldmethod=marker
" Toggle folding
nnoremap <Space> za
" Create foldings using mouse in visual mode.
vnoremap <Space> zf

" Save and restore folding
"autocmd BufWinLeave *.rb,*.coffee,*.css mkview
"autocmd BufWinEnter *.rb,*.coffee,*.css silent loadview

set omnifunc=syntaxcomplete#Complete

set completeopt=longest,menuone
let OmniCpp_ShowPrototypeInAbbr=1
let OmniCpp_ShowScopeInAbbr=1

" Dont show dollar sign at the end of each line
set nolist

nmap <F2> :TagbarToggle<CR>
imap <F2> <ESC>:TagbarToggle<CR>i

let Tlist_Ctags_Cmd = 'coffeetags'

" Make words with '-' to be autocompletable.
set iskeyword+=\-

" Create parent directories on save
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
