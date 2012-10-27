call pathogen#infect()

syntax on
filetype plugin indent on

" <leader> key:
let mapleader = ","

set autoindent

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set showtabline=2

set pastetoggle=<F5>

" relativenumber changes Vim’s line number column to display how far away each
" line is from the current one, instead of showing the absolute line number.
"
" I almost never care what numeric line I’m on in a file (and if I do I can
" see it in the status line), so I don’t miss the normal line numbers. I do
" care how far away a particular line might be, because it tells me what
" number I need to use with motion commands like d<NUMBER>d.
"set relativenumber

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
imap <C-PageUp> <ESC>gTi
imap <C-PageDown> <ESC>gti
nmap <C-PageUp> gt
nmap <C-PageDown> gT
"map <C-1> 1gt
"map <C-2> 2gt
"map <C-3> 3gt

"I also like to make ; do the same thing as : — it’s one less key to hit every
"time I want to save a file:
nnoremap ; :

" retab whole file
map <F7> mzgg=G`z<CR>

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


au BufRead,BufNewFile *.as set filetype=actionscript

ca tn tabnew
ca th tabp
ca tl tabn
