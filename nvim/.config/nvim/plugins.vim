call plug#begin(expand('$HOME/.local/share/nvim/site/plugged'))

" Syntax --- {{{
  Plug 'sheerun/vim-polyglot'
  Plug 'sgur/vim-editorconfig'
  Plug 'valloric/MatchTagAlways', {'on_ft': 'html'}
  " Plug 'dag/vim-fish'
  " Plug 'chrisbra/Colorizer'
  Plug 'amiralies/vim-rescript'
  " Plug 'GutenYe/json5.vim'
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
  Plug 'Shougo/denite.nvim'
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'mhinz/vim-sayonara', {'on' : 'Sayonara'}
  Plug 'lambdalisue/suda.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }
" }}}

" Autocomplete {{{
  Plug 'Shougo/neoinclude.vim'
  Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets' | Plug 'honza/vim-snippets'
  Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
  Plug 'dense-analysis/ale'
" }}}

" Looks --- {{{
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  " Plug 'joshdick/onedark.vim'
  Plug 'sainnhe/edge'
" }}}

" Git --- {{{
  Plug 'airblade/vim-gitgutter'
" }}}

call plug#end()
