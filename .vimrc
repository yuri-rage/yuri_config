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

" change cursor shape based on mode
if &term =~ "^rxvt" || &term=~ "^xterm"
  " blinking underscore
  let &t_SI .= "\<Esc>[3 q"
  " blinking block
  let &t_EI .= "\<Esc>[1 q"
  " reset to blinking underscore on exit
  autocmd VimLeave * silent !echo -ne "\033[3 q"
  " 1 or 0 -> blinking block
  " 2 -> solid block
  " 3 -> blinking underscore
  " 4 -> solid underscore
endif

" make xclipboard more easily accessible
set clipboard=unnamedplus

" collate .swp files - don't keep them in the working directory
set directory=~/.vim/tmp,/tmp,.
set backupdir=~/.vim/tmp,/tmp,.

" use gggqG for autoformat of c-like code
" requires astyle
autocmd FileType h,c,cpp,java,ino,pde set formatprg=astyle

" use gggqG for autoformat of xml
" requires xmllint
autocmd FileType xml set formatprg=xmllint\ --encode\ UTF-8\ --format\ %

" force *.md files to be opened as markdown filetypes
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" vim-instant-markdown previewer
" from https://github.com/suan/vim-instant-markdown
" requires ruby rubygems nodejs xdg-utils
" gems: pygments.rb redcarpet
" also, from npm (nodejs) - instant-markdown-d
let g:instant_markdown_slow = 0
filetype plugin on
