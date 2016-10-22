"   __    _    __
"  /  \ _|_ _.  / _.  _| / _   ._     o ._ _  ._ _
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
  nmap <leader>w :w!<cr>
  nmap <leader>q :q<cr>

  " :SW sudo saves the file (useful for handling the permission-denied error)
  command SW w !sudo tee % > /dev/null

  " I make this mistake way too often
  command W w
  command Q q

  " highlight current line
  set cursorline

  " OS Clipboard
  set clipboard=unnamed,unnamedplus

  " keep undo history
  set undofile
  set undodir="$HOME/.local/share/nvim/site/undo"
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

  " Ignore compiled files
  set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

  " Always show current position
  set ruler

  " Height of the command bar
  set cmdheight=2

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
  set termguicolors
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1

  " Set utf8 as standard encoding and en_US as the standard language
  set encoding=utf8

  " Use Unix as the standard file type
  set ffs=unix,dos,mac

" }}}

" Text, tab and indent related --- {{{
  " Use spaces instead of tabs
  set expandtab

  " Be smart when using tabs ;)
  set smarttab

  " 1 tab == 4 spaces
  set shiftwidth=2
  set tabstop=2

  " Linebreak on 500 characters
  set lbr
  set tw=500

  set ai "Auto indent
  set si "Smart indent
  set wrap "Wrap lines
" }}}

" Visual mode related --- {{{
  " Visual mode pressing * or # searches for the current selection
  " Super useful! From an idea by Michael Naumann
  vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
  vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

  " Disable highlight when <leader><cr> is pressed
  map <silent> <leader><cr> :noh<cr>

  " Smart way to move between windows
  map <C-j> <C-W>j
  map <C-k> <C-W>k
  map <C-h> <C-W>h
  map <C-l> <C-W>l

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

  if has("mac") || has("macunix")
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
  endif

  " Delete trailing white space on save, useful for Python and CoffeeScript ;)
  func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
  endfunc
  autocmd BufWrite *.py :call DeleteTrailingWS()
  autocmd BufWrite *.coffee :call DeleteTrailingWS()

  " Reselect after indent
  vnoremap > >gv
  vnoremap < <gv
" }}}

" Ag searching and cope displaying --- {{{
  " Requires ag.vim - it's much better than vimgrep/grep
  " When you press gv you Ag after the selected text
  vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

  " Open Ag and put the cursor in the right position
  map <leader>g :Ag

  " When you press <leader>r you can search and replace the selected text
  vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

  " Do :help cope if you are unsure what cope is. It's super useful!
  "
  " When you search with Ag, display your results in cope by doing:
  "   <leader>cc
  "
  " To go to the next search result do:
  "   <leader>n
  "
  " To go to the previous search results do:
  "   <leader>p
  "
  map <leader>cc :botright cope<cr>
  map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
  map <leader>n :cn<cr>
  map <leader>p :cp<cr>
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
  set background=dark
  colorscheme OceanicNext
  let g:airline_theme='flatlandia'
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
" }}}

" Neomake --- {{{
  let g:neomake_javascript_enabled_makers = ['eslint']
  " auto run neomake once the file is saved
  autocmd BufWritePost,BufEnter * Neomake
" }}}

" Deoplete --- {{{
  let g:deoplete#enable_at_startup = 1
" }}}

" NERDTree --- {{{
  " Show NERDTree if we open empty vim
  function OpenNERD ()
    if argc() == 0 && !exists("s:std_in")
      NERDTree
    elseif argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in")
      exe 'NERDTree' argv()[0]
      wincmd p
      ene
    endif
  endfunction

  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * :call OpenNERD()

  " toggle NERDTree on <c-e>
  map <c-e> :NERDTreeToggle<cr>

  " close NERDTree once a file is selected
  let g:NERDTreeQuitOnOpen = 1
" }}}
"
" Unite --- {{{
  nmap <c-P> :Unite<cr>
  nmap <c-p> :Unite buffer<cr>
" }}}

" Tabs --- {{{
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
