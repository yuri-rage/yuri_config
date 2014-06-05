set shell=bash\ -i
syntax on            
set number           
set tabstop=4
set expandtab
set shiftwidth=2        
set softtabstop=2
if has('gui_running')
    set background=dark
    colorscheme solarized
endif
set directory=~/.vim/tmp,/tmp,.
set backupdir=~/.vim/tmp,/tmp,.
autocmd FileType h,c,cpp,java,ino,pde set formatprg=astyle
if has("gui_running")
  set guifont=Consolas\ 10
endif

" vim-instant-markdown previewer
filetype plugin on
