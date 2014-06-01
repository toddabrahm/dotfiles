" ---------------------------------------------------------------
" BUNDLES
" ---------------------------------------------------------------

" Reset needed for Vundle
set nocompatible
filetype off

" Setup Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'editorconfig/editorconfig-vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'
Bundle 'kien/ctrlp.vim'
Bundle 'Shougo/neocomplete.vim'
Bundle 'Shougo/neosnippet.vim'
Bundle 'mattn/emmet-vim'
Bundle 'rking/ag.vim'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-tbone'
Bundle 'tpope/vim-abolish'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-surround'
Bundle 'Raimondi/delimitMate'
Bundle 'sickill/vim-pasta'
Bundle 'tomtom/tcomment_vim'
Bundle 'kshenoy/vim-signature'
Bundle 'sjl/gundo.vim'
Bundle 'gregsexton/gitv'
Bundle 'tpope/vim-fugitive'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'myhere/vim-nodejs-complete'
Bundle 'wookiehangover/jshint.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'othree/html5.vim'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-haml'
Bundle 'groenewege/vim-less'
Bundle 'kchmck/vim-coffee-script'
Bundle 'juvenn/mustache.vim'
Bundle 'guileen/vim-node'
Bundle 'nelstrom/vim-markdown-folding'
Bundle 'davidoc/taskpaper.vim'
Bundle 'file://Users/t/Dropbox/dotfiles/.vim/bundle/vim-snippets'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'chriskempson/base16-vim'
Bundle 'xolox/vim-misc'
Bundle 'vimoutliner/vimoutliner'
Bundle 'fisadev/vim-ctrlp-cmdpalette'
Bundle 'tommcdo/vim-exchange'
Bundle 'lord-garbage/tslime.vim'
Bundle 'tpope/vim-vinegar'
Bundle 'airblade/vim-gitgutter'
Bundle 'coderifous/textobj-word-column.vim'
Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-function'
Bundle 'kana/vim-textobj-fold'
Bundle 'kana/vim-textobj-indent'
Bundle 'lucapette/vim-textobj-underscore'
Bundle 'thinca/vim-textobj-function-javascript'
Bundle 'sheerun/vim-polyglot'
Bundle 'AndrewRadev/switch.vim'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'StanAngeloff/php.vim'
Bundle 'henrik/vim-reveal-in-finder'
Bundle 'nelstrom/vim-qargs'
Bundle 'gcmt/wildfire.vim'
Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'tpope/vim-eunuch'

" ---------------------------------------------------------------
" SETTINGS
" ---------------------------------------------------------------

set encoding=utf-8
set ffs=unix,dos
syntax on
filetype plugin indent on
set synmaxcol=800
set hidden
set noswapfile
set nobackup
set nowritebackup
set virtualedit=all
set autoread
set autowrite
set nrformats=
set clipboard=unnamed
set history=200

" Gui options
set showmatch
set showcmd
set ruler
set number
set guioptions=agi
set mousehide
set laststatus=2
set scrolloff=5
set showmode
set splitbelow
set splitright

" Indenting
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

" Line wrapping
set wrap
set linebreak

" Folding
set foldmethod=manual
set foldlevelstart=99

" No bells
set noerrorbells
set visualbell
set t_vb=

" Search
set incsearch
set ignorecase
set smartcase
set hlsearch

" Misc options
set nolist
set listchars=tab:▸\ ,eol:¬,trail:█,extends:>,precedes:<
set timeoutlen=300
set formatoptions=qrn1
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help
set cpoptions+=$
set backspace=indent,eol,start

" Wildmenu
set wildmenu
set wildignore+=node_modules

" Spelling
set dictionary=/usr/share/dict/words
set spelllang=en_us
set spellfile=~/.vim/custom-dictionary.en.utf-8.add,~/.vim-local-dictionary.en.utf-8.add
nnoremap zG 2zg

" ---------------------------------------------------------------
" MAPPINGS
" ---------------------------------------------------------------

let mapleader=","
let maplocalleader = "\\"
" migrate window navigation back to default mapping
nnoremap <leader>h :echoerr "No! use C-w"<cr>
nnoremap <leader>l :echoerr "No! use C-w"<cr>
nnoremap <leader>j :echoerr "No! use C-w"<cr>
nnoremap <leader>k :echoerr "No! use C-w"<cr>
" resize windows with arrows
nnoremap <up> <C-w>+
nnoremap <down> <C-w>-
nnoremap <left> <C-w><
nnoremap <right> <C-w>>
" toggle plugins
nnoremap <leader>jsh :JSHintToggle<cr>
nnoremap <leader>gu :GundoToggle<cr>
nnoremap <leader>tm :SignatureToggle<cr>
nnoremap <leader>sw :Switch<cr>
" edit vimrc
nnoremap <leader>ev :e ~/Dropbox/dotfiles/.vimrc<cr>
" source vimrc
nnoremap <leader>sv :so $MYVIMRC<cr>
" clear searches
nnoremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>
" delete buffer
nnoremap <leader>da :bufdo silent! bdelete<cr>
" preview buffer in Marked.app
nnoremap <leader>mp :silent !open -a Marked.app '%:p'<cr>
" convert to markdown to html with marked (node) and save to clipboard
nnoremap <leader>mc :write ! marked \| pbcopy<cr>
" bubble lines to top and bottom of buffer
nnoremap <leader>bk m'ddggP''
nnoremap <leader>bj m'ddGp''
" select entire buffer
nnoremap vaa ggvGg_
nnoremap Vaa ggVG
" use Dash.app for man search
nmap <silent> K <Plug>DashSearch
" expand %% to path of active buffer in ex mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" wrap visual selection with backticks for fenced code block
vnoremap <leader>` <esc>`>o<esc>I```<esc>`<O<esc>I```
" clear search matches when redrawing
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
" preserve flags when repeating :s
nnoremap & :&&<CR>
xnoremap & :&&<CR>
" make Y consistent with C & D, yy already yanks entire line
nnoremap Y y$

" ---------------------------------------------------------------
" STYLES
" ---------------------------------------------------------------

set t_Co=256
set term=screen-256color
if $ITERM_PROFILE == "Solarized Light"
    set background=light
    colorscheme solarized
    let g:airline_theme='solarized'
elseif $ITERM_PROFILE == "Github"
    set background=light
    colorscheme github
    let g:airline_theme='light'
else
    set background=dark
    colorscheme solarized
    let g:airline_theme='solarized'
endif
if has("gui_running")
    set guifont=Inconsolata-dz\ for\ Powerline:h18
endif
hi SignColumn ctermbg=NONE

" ---------------------------------------------------------------
" PLUGINS
" ---------------------------------------------------------------

" Matchit.vim -------------------------------------------------
" Load matchit.vim if newer version isn't installed
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Airline -----------------------------------------------------
let g:airline#extensions#whitespace#enabled = 0
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_fugitive_prefix = ''
let g:airline_readonly_symbol = '⭤'
let g:airline_linecolumn_prefix = ''

" Ctrl-P ------------------------------------------------------
let g:ctrlp_cmd = 'CtrlP'
nnoremap <C-p>m :CtrlPMRU<cr>
nnoremap <C-p>b :CtrlPBuffer<cr>
nnoremap <C-p>t :CtrlPTag<cr>
let g:ctrlp_open_multiple_files = 'i'
let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }
func! MyCtrlPMappings()
    nnoremap <buffer> <silent> <c-@> :call <sid>DeleteBuffer()<cr>
endfunc
func! s:DeleteBuffer()
    exec "bd" fnamemodify(getline('.')[2:], ':p')
    exec "norm \<F5>"
endfunc

" Emmet -------------------------------------------------------
let g:user_emmet_leader_key = '<c-e>'
let g:use_emmet_complete_tag = 1

" Tagbar ------------------------------------------------------
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_width=26
nnoremap <silent> <leader>tb :TagbarToggle<cr>

" Gist.vim ----------------------------------------------------
let g:gist_post_private = 1
let g:gist_show_privates = 1
let g:gist_clip_command = 'pbcopy'

" delimitMate -------------------------------------------------
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
let delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_balance_matchpairs = 1

" neocomplete -------------------------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist'
    \ }
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<cr>"
endfunction
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <silent> <cr> <C-r>=<SID>my_cr_function()<cr>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()
aug settings_neocomplete
    au!
    au FileType css setlocal omnifunc=csscomplete#CompleteCSS
    au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    au FileType python setlocal omnifunc=pythoncomplete#Complete
    au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
aug END

" Neosnippet --------------------------------------------------
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
let g:neosnippet#disable_runtime_snippets = { '_' : 1, }

" Markdown.vim --------------------------------------------------
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'scss', 'xml', 'python', 'sh']

" Markdown Folding
let g:markdown_fold_style = 'nested'

" tslime.vim ----------------------------------------------------
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuVars

" tmux-complete.vim ---------------------------------------------
let g:tmuxcomplete#trigger = ''

" git-gutter ----------------------------------------------------
let g:gitgutter_realtime = 0

" splitjoin.vim -------------------------------------------------
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

" ---------------------------------------------------------------
" AUTOCOMMANDS & FUNCTIONS
" ---------------------------------------------------------------

aug filetype_scss
    au!
    au FileType scss set commentstring=//\ %s
aug END

aug filetype_text
    au!
    au BufRead,BufNewFile *.txt,*.md,*.markdown,*.readme setlocal spell spelllang=en_us
aug END

aug filetype_gitcommit
    au!
    au FileType gitcommit setlocal tw=66
    au FileType gitcommit setlocal spell spelllang=en_us
aug END

aug filetype_vimoutliner
    au!
    au BufRead,BufNewFile *.otl set foldlevel=1
aug END

aug filetype_js
    au!
    au FileType javascript set dictionary+=$HOME/.vim/dict/node.dict
aug END

" Show highlighting groups for current word
nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>
