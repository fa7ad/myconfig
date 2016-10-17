call plug#begin(expand('$HOME/.local/share/nvim/site/plugged'))

" Syntax --- {{{
  Plug 'moll/vim-node'
  Plug 'othree/yajs.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'valloric/MatchTagAlways', {'on_ft': 'html'}
" }}}

" Looks and Utilities {{{
  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'Yggdroot/indentLine'
  Plug 'tomtom/tcomment_vim'
  Plug 'itmammoth/doorboy.vim'
  Plug 'mhartington/oceanic-next'
" }}}

call plug#end()
