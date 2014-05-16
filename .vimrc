set nocompatible  " be iMproved, required
set directory=$HOME/.vim/swapfiles/

"pathogen - enable easy install of modules in ~/.vim/bundles dir
filetype off
execute pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

"environment settings
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab
set number
set background=light
syntax on
colorscheme solarized

"Key remapping splits with command+arrows
nnoremap <D-left> :vertical resize -5<cr>
nnoremap <D-down> :resize +5<cr>
nnoremap <D-up> :resize -5<cr>
nnoremap <D-right> :vertical resize +5<cr>

:map <C-F12> :echo 'Current time is ' . strftime('%c')<CR>
" let g:vdebug_keymap['run'] = '<C-s>'

"post-processing
:%s/\s\+$//e "purge all trailing whitespace

""xdebug
let g:dbgPavimPort = 9009
let g:dbgPavimBreakAtEntry = 1
