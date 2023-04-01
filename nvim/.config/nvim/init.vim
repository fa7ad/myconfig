"   __    _    __
" /  \ _|_ _.  / _.  _| / _   ._     o ._ _  ._ _
" | (|/  | (_| / (_| (_|  _>   | | \/ | | | | | (_
"  \__

" General --- {{{
  " Sets how many lines of history VIM has to remember
  set history=500

  " Enable filetype plugins
  filetype plugin indent on

  " Set to auto read when a file is changed from the outside
  set autoread

  " With a map leader it's possible to do extra key combinations
  let mapleader = ","
  let g:mapleader = ","

  " remap : to ;
  " nnoremap : ;
  nnoremap ; :

  " Fast saving
  nmap <leader>w :w<cr>
  nmap <leader>q :q<cr>

  " :SW sudo saves the file (useful for handling the permission-denied error)
  command SW w suda://%
  nmap <leader>W :SW<cr>

  " I make this mistake way too often
  command W w
  command Q q

  " highlight current line
  set cursorline

  " OS Clipboard
  set clipboard=unnamed,unnamedplus

  " Enable mouse support
  set mousef
  set mouse=a

  " keep undo history
  set undofile
  set undodir="$HOME/.local/share/nvim/site/undo"

  " Path to python3
  let g:python3_host_prog="/opt/homebrew/bin/python3"
  " }}}
" vim-plug --- {{{
  if (!filereadable(expand("$HOME/.local/share/nvim/site/autoload/plug.vim")) && executable("curl"))
    call system(expand("curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"))
  else
    call system("echo curl is required for vim-plug")
  endif
" }}}

" Plugins --- {{{
  source ~/.config/nvim/plugins.vim
" }}}

" VIM user interface --- {{{
  " Set 5 lines to the cursor - when moving vertically using j/k
  set so=5

  " Avoid garbled characters in Chinese language windows OS
  let $LANG='en'
  set langmenu=en

  " Turn on the WiLd menu
  set wildmenu
  set wildmode=list:longest,full

  " Ignore compiled files
  set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

  " Always show current position
  set ruler

  " Height of the command bar
  set cmdheight=1

  " A buffer becomes hidden when it is abandoned
  set hid

  " Configure backspace so it acts as it should act
  set backspace=eol,start,indent
  set whichwrap+=<,>,h,l

  " When searching try to be smart about cases
  set ignorecase
  set smartcase

  " Highlight search results
  set hlsearch

  " Makes search act like search in modern browsers
  set incsearch

  " Don't redraw while executing macros (good performance config)
  set lazyredraw

  " For regular expressions turn magic on
  set magic

  " Show matching brackets when text indicator is over them
  set showmatch

  " How many tenths of a second to blink when matching brackets
  set mat=5

  " No annoying sound on errors
  set noerrorbells
  set novisualbell
  set t_vb=
  set tm=500

  " remove gutter
  set foldcolumn=0

  " show line numbers
  set relativenumber
  set number

  " show whitespace
  set lcs+=space:·
" }}}

" Colors and Fonts --- {{{
  " Enable syntax highlighting
  syntax enable

  " Enable 256 colors
  set t_Co=256
  if has('termguicolors')
    set termguicolors
  endif
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1

  " Set utf8 as standard encoding and en_US as the standard language
  set encoding=utf8

  " Use Unix as the standard file type
  set ffs=unix,dos,mac

  " Show line at 80 columns
  set colorcolumn=80,120
" }}}

" Text, tab and indent related --- {{{
  " Use spaces instead of tabs
  " Be smart when using tabs ;)
  set expandtab
  set smarttab

  " 1 tab == 2 spaces
  set shiftwidth=2
  set tabstop=2

  " Linebreak on 500 characters
  set lbr
  set tw=500

  " Auto indent, Smart indent, Wrap lines
  set ai
  set si
  " set wrap
  set nowrap
" }}}

" Visual mode related --- {{{
  " Visual mode pressing * or # searches for the current selection
  " Super useful! From an idea by Michael Naumann
  vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
  vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

  " Disable highlight when <leader><cr> is pressed
  map <silent> <leader><cr> :noh<cr>

  " Smart way to move between windows
  " map <C-j> <C-W>j
  " map <C-k> <C-W>k
  " map <C-h> <C-W>h
  " map <C-l> <C-W>l

  " Close the current buffer
  map <leader>bd :Bclose<cr>:tabclose<cr>gT

  " Close all the buffers
  map <leader>ba :bufdo bd<cr>

  map <leader>l :bnext<cr>
  map <leader>h :bprevious<cr>

  " Useful mappings for managing tabs
  map <leader>tn :tabnew<cr>
  map <leader>to :tabonly<cr>
  map <leader>tc :tabclose<cr>
  map <leader>tm :tabmove
  map <leader>t<leader> :tabnext

  " Let 'tl' toggle between this and the last accessed tab
  let g:lasttab = 1
  nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
  au TabLeave * let g:lasttab = tabpagenr()


  " Opens a new tab with the current buffer's path
  " Super useful when editing files in the same directory
  map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

  " Switch CWD to the directory of the open buffer
  map <leader>cd :cd %:p:h<cr>:pwd<cr>

  " Specify the behavior when switching between buffers
  try
    set switchbuf=useopen,usetab,newtab
    set stal=2
  catch
  endtry

  " Return to last edit position when opening files (You want this!)
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" }}}


" Status line --- {{{
  " Always show the status line
  set laststatus=2

  " Editing mappings --- {{{
  " Remap VIM 0 to first non-blank character
  map 0 ^

  " Move a line of text using ALT+[jk] or Command+[jk] on mac
  nmap <M-j> mz:m+<cr>`z
  nmap <M-k> mz:m-2<cr>`z
  vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
  vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

  " Delete trailing white space on save, useful for Python and CoffeeScript ;)
  func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
  endfunc
  autocmd BufWrite *.py :call DeleteTrailingWS()
  autocmd BufWrite *.js :call DeleteTrailingWS()

  " Reselect after indent
  vnoremap > >gv
  vnoremap < <gv
" }}}

" Spell checking --- {{{
  " Pressing ,ss will toggle and untoggle spell checking
  map <leader>ss :setlocal spell!<cr>

  " Shortcuts using <leader>
  map <leader>sn ]s
  map <leader>sp [s
  map <leader>sa zg
  map <leader>s? z=
" }}}

" Vim-Polyglot --- {{{
  let g:javascript_plugin_jsdoc = 1
  let g:vim_markdown_folding_disabled = 1
  let g:vim_markdown_conceal = 0
  let g:vim_markdown_conceal_code_blocks = 0
  let g:tex_conceal = ""
  let g:vim_markdown_math = 1
" }}}

" Misc --- {{{
  " Remove the Windows ^M - when the encodings gets messed up
  noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

  " Quickly open a buffer for scribble
  map <leader>n :e ~/buffer<cr>

  " Quickly open a markdown buffer for scribble
  map <leader>x :e ~/buffer.md<cr>

  " Toggle paste mode on and off
  map <leader>pp :setlocal paste!<cr>
" }}}

" Helper functions --- {{{
  function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
  endfunction

  function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
      call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
      call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
  endfunction

  " Don't close window, when deleting a buffer
  command! Bclose call <SID>BufcloseCloseIt()
  function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
      buffer #
    else
      bnext
    endif

    if bufnr("%") == l:currentBufNum
      new
    endif

    if buflisted(l:currentBufNum)
      execute("bdelete! ".l:currentBufNum)
    endif
  endfunction
" }}}

" Color Scheme --- {{{
  let g:edge_style = 'aura'
  let g:edge_enable_italic = 1
  let g:edge_disable_italic_comment = 1

  colorscheme edge
  let g:airline_theme='edge'
  " let g:colorizer_auto_color = 1

  " set background=dark
  hi Normal guibg=none ctermbg=none
  hi Comment guifg=#5C6370 ctermfg=59 cterm=italic
" }}}

" IndentLine {{{
  let g:indentLine_char='▏'
  let g:indentLine_first_char='▏'
  " let g:indentLine_showFirstIndentLevel = 1
  " let g:indentLine_setColors = 0
" }}}

" Airline --- {{{
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#disable_rtp_load = 0
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#show_tab_nr = 1
  let g:airline#extensions#tabline#buffer_idx_mode = 1
  let g:airline#extensions#branch#format = 2
  let g:airline#extensions#branch#enabled = 1
  let g:airline#extensions#hunks#enabled = 0
  let g:airline#extensions#ale#enabled = 1
  let g:airline_highlighting_cache = 1
" }}}

" RLS --- {{{
  let g:LanguageClient_serverCommands = {
    \ 'reason': ['/usr/local/bin/reason-language-server'],
    \ }
" }}}

" Plugin key-mappings.
" Neosnippet --- {{{
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)
  nmap <C-k>     <Plug>(neosnippet_expand_target)

  " SuperTab like snippets behavior.
  imap <expr><TAB>
  \ pumvisible() ? "\<C-n>" :
  \ neosnippet#expandable_or_jumpable() ?
  \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  " smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  "   \"\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" }}}

" NERDTree --- {{{
  " toggle NERDTree on <C-E>
  map <C-E> :NERDTreeToggle<cr>

  " close NERDTree once a file is selected
  let g:NERDTreeQuitOnOpen = 1
" }}}
"
" Unite --- {{{
  nmap <c-P> :Denite<cr>
  nmap <c-p> :Denite buffer<cr>

  autocmd FileType denite call s:denite_my_settings()
  function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
    \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d
    \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
    \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q
    \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
    \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space>
    \ denite#do_map('toggle_select').'j'
  endfunction
" }}}

" Tabs --- {{{
  nmap <C-W> :Sayonara<cr>
  nmap <leader>t :term<cr>
  nmap <leader>, :bnext<CR>
  tmap <leader>, <C-\><C-n>:bnext<cr>
  nmap <leader>. :bprevious<CR>
  tmap <leader>. <C-\><C-n>:bprevious<CR>
  tmap <leader>1  <C-\><C-n><Plug>AirlineSelectTab1
  tmap <leader>2  <C-\><C-n><Plug>AirlineSelectTab2
  tmap <leader>3  <C-\><C-n><Plug>AirlineSelectTab3
  tmap <leader>4  <C-\><C-n><Plug>AirlineSelectTab4
  tmap <leader>5  <C-\><C-n><Plug>AirlineSelectTab5
  tmap <leader>6  <C-\><C-n><Plug>AirlineSelectTab6
  tmap <leader>7  <C-\><C-n><Plug>AirlineSelectTab7
  tmap <leader>8  <C-\><C-n><Plug>AirlineSelectTab8
  tmap <leader>9  <C-\><C-n><Plug>AirlineSelectTab9
  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9
" }}}

" LangaugeClient --- {{{
  nnoremap <silent> gd :call LanguageClient#textDocument_definition()<cr>
  nnoremap <silent> gf :call LanguageClient#textDocument_formatting()<cr>
  nnoremap <silent> <cr> :call LanguageClient#textDocument_hover()<cr>
" }}}
"
" ALE --- {{{
  let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'rescript': ['refmt'],
  \   'javascript': ['eslint', 'prettier'],
  \}

  let g:ale_disable_lsp = 1
" }}}
