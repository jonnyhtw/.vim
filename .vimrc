" Wrap lines in gvimdiff. From http://stackoverflow.com/questions/16840433/forcing-vimdiff-to-wrap-lines
au VimENter * if &diff | execute 'windo set wrap' | endif

set splitright
set splitbelow
set number
set incsearch
set ignorecase smartcase
set wrap
set formatoptions-=t

syntax enable
if has('gui_running')
    set background=light
else
    "set background=dark
    set background=light
endif


let g:sh_fold_enabled=1

" replace tab characters with 4 spaces
set tabstop=4
set expandtab
" same, for auto indentation
set shiftwidth=4
set smarttab autoindent

filetype plugin on
filetype plugin indent on

let fortran_free_source=1
let fortran_more_precise=1
" set foldmethod=syntax to use folds with fortran source
let fortran_fold=1
let fortran_fold_conditionals=1
let fortran_fold_multilinecomments=1
let fortran_do_enddo=1

" to start with folds open:
set foldlevelstart=99

augroup filetype
  au! BufRead,BufnewFile *.inc   set filetype=fortran
augroup END

augroup filetype
  au! BufRead,BufnewFile *.rc   set filetype=cylc
augroup END


autocmd FileType css set smartindent
autocmd FileType html,mhtml set formatoptions+=tl
autocmd FileType html,css,mhtml set noexpandtab tabstop=2

set t_Co=256

set textwidth=79
"highlight ColorColumn ctermbg=magenta
"call matchadd('ColorColumn', '\%80v', 100)

"hi Statement guifg=#22a8e3 gui=bold
"hi Normal guifg=#404261
"hi Comment guifg=#ff6900
"hi Type guifg=#28d45b gui=bold"
"hi String guifg=#aa00ff"

set laststatus=2

"set guifont=Source\ Code\ Pro\ for\ Powerline\ Regular\ 11
"set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 11

let mapleader=","

" http://vim.wikia.com/wiki/A_better_Vimdiff_Git_mergetool
" Disable one diff window during a three-way diff allowing you to cut out the
" noise of a three-way diff and focus on just the changes between two versions
" at a time. Inspired by Steve Losh's Splice
function! DiffToggle(window)
  " Save the cursor position and turn on diff for all windows
  let l:save_cursor = getpos('.')
  windo :diffthis
  " Turn off diff for the specified window (but keep scrollbind) and move
  " the cursor to the left-most diff window
  exe a:window . "wincmd w"
  diffoff
  set scrollbind
  set cursorbind
  exe a:window . "wincmd " . (a:window == 1 ? "l" : "h")
  " Update the diff and restore the cursor position
  diffupdate
  call setpos('.', l:save_cursor)
endfunction
" Toggle diff view on the left, center, or right windows
nmap <silent> <leader>dl :call DiffToggle(1)<cr>
nmap <silent> <leader>dc :call DiffToggle(2)<cr>
nmap <silent> <leader>dr :call DiffToggle(3)<cr>

execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme evening

"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

augroup filetype
  au! BufRead,BufnewFile rose-*.conf,rose-*.info set filetype=rose-conf
augroup END

"This unsets the "last search pattern" register by hitting return.
nnoremap <CR> :noh<CR><CR>

"This stops vim highlighting the last search from a previously opened file being highlighted at startup.
:set viminfo^=h

set nofoldenable    " disable folding

" allow quit via single keypress (Q)
map Q :qa<CR>


set backspace=2 " make backspace work like most other programs


" alwasy show % through file
set ruler


" highlight all search results
:set hlsearch

" vimdiff navigation shortcut
map ] ]c
map [ [c



