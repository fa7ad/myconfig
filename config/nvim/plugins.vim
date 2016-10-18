call plug#begin(expand('$HOME/.local/share/nvim/site/plugged'))

" Syntax --- {{{
  Plug 'moll/vim-node'
  Plug 'othree/yajs.vim' | Plug 'othree/es.next.syntax.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'valloric/MatchTagAlways', {'on_ft': 'html'}
" }}}

" Coding Style --- {{{
  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'Yggdroot/indentLine'
  Plug 'tomtom/tcomment_vim'
  Plug 'itmammoth/doorboy.vim'
" }}}

" System --- {{{
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'mhinz/vim-sayonara'
  Plug 'mattn/webapi-vim'
  Plug 'mattn/gist-vim'
  Plug 'Shougo/unite.vim'
  Plug 'Shougo/denite.nvim'
  Plug 'neomake/neomake'
" }}}

" Autocomplete {{{
  Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
  Plug 'Shougo/neoinclude.vim'
  Plug 'ternjs/tern_for_vim', {'build': 'npm install'}
  Plug 'carlitux/deoplete-ternjs'
  Plug 'zchee/deoplete-jedi', {'on_ft': 'python'}
  Plug 'davidhalter/jedi-vim', {'on_ft': 'python'}
  Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets' | Plug 'honza/vim-snippets'
" }}}

" Looks --- {{{
  Plug 'vim-airline/vim-airline'
  Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'jordwalke/flatlandia'
  Plug 'trevordmiller/nova-vim'
  Plug 'mhartington/oceanic-next'
" }}}

" Git --- {{{
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
" }}}

call plug#end()
