set shell=bash\ -i
syntax on            
set number           
set tabstop=4
set expandtab
set shiftwidth=2        
set softtabstop=2

" make sure gvim uses a nice 'theme'
if has('gui_running')
  set background=dark
  colorscheme solarized
  set guifont=Consolas\ 10
endif

" collate .swp files - don't keep them in the working directory
set directory=~/.vim/tmp,/tmp,.
set backupdir=~/.vim/tmp,/tmp,.

" use gggqG for autoformat of c-like code
autocmd FileType h,c,cpp,java,ino,pde set formatprg=astyle

" vim-instant-markdown previewer
" from https://github.com/suan/vim-instant-markdown
" requires ruby rubygems nodejs xdg-utils
" gems: pygments.rb redcarpet
" also, from npm (nodejs) - instant-markdown-d
filetype plugin on
