""" Coloring
syntax on

""show numbers on left side
""set number

"" Leader map for hotkeys
let mapleader = " "

"""""" Leader hotkeys
"" fast saving
nmap <leader>w :w!<cr> 
"" fast sudo saving
nmap <leader>W :w!sudo tee %<cr> 

"""""" End Leader Hotkeys

"visual autocomplete for vim commands started by ':'
set wildmenu
""highlight matching brace
set showmatch

""" Other Configurations
filetype plugin on
filetype indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml """foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
