call plug#begin(expand('$HOME/.local/share/nvim/site/plugged'))

" Syntax --- {{{
  Plug 'moll/vim-node'
  Plug 'othree/yajs.vim' | Plug 'othree/es.next.syntax.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'sgur/vim-editorconfig'
  Plug 'valloric/MatchTagAlways', {'on_ft': 'html'}
  Plug 'dag/vim-fish'
  Plug 'chrisbra/Colorizer'
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
  Plug 'lambdalisue/suda.vim'
" }}}

" Autocomplete {{{
  Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
  Plug 'Shougo/neoinclude.vim'
  Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets' | Plug 'honza/vim-snippets'
" }}}

" Looks --- {{{
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'liuchengxu/space-vim-dark'
" }}}

" Git --- {{{
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
" }}}

call plug#end()
