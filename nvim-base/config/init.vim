let g:loaded_python_provider = 1
let g:python3_host_prog = '/usr/bin/python3'

call plug#begin("~/.config/nvim/plugins")
source ~/.config/nvim/plugins.vim
Plug 'tpope/vim-fugitive'
Plug 'mkitt/tabline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()

set expandtab
set shiftwidth=4
set tabstop=4
set textwidth=79
" l: Prevent automatic line breaks when reaching textwidth
" q: Allow usage of gq to format comments
set formatoptions=lq

autocmd FileType c set noexpandtab tabstop=8 shiftwidth=8 textwidth=80
autocmd FileType Makefile set noexpandtab
autocmd FileType yaml set tabstop=2 shiftwidth=2 textwidth=80
autocmd FileType json set tabstop=2 shiftwidth=2 textwidth=80
autocmd FileType html set tabstop=2 shiftwidth=2 textwidth=80

fu! _GitGrep(func)
  let tmp1=&grepprg
  set grepprg=git\ grep\ -n
  execute "silent grep! ".a:func | copen
  exe "set grepprg=".escape(tmp1,' ')
endf

command! -nargs=* GitGrep :call _GitGrep("<args>")
command! -nargs=* Tl split | lcd %:h | terminal <args>

set nu
set history=10000

" A bunch of remaps to make vim command mode more readline-like
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

" Map Esc so that is exits terminal mode
tnoremap <Esc> <C-\><C-n>

let mapleader=","

source ~/.config/nvim/coc.vim
