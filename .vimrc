" ---------------------------------------------------------------
" BUNDLES
" ---------------------------------------------------------------

" Reset needed for Vundle
set nocompatible
filetype off

" Setup Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Plugin 'gmarik/vundle'

" Load plugins
Plugin 'editorconfig/editorconfig-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet.vim'
Plugin 'mattn/emmet-vim'
Plugin 'rking/ag.vim'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-tbone'
Plugin 'tpope/vim-abolish'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'sickill/vim-pasta'
Plugin 'tomtom/tcomment_vim'
Plugin 'kshenoy/vim-signature'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'wookiehangover/jshint.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'juvenn/mustache.vim'
Plugin 'guileen/vim-node'
Plugin 'myhere/vim-nodejs-complete'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'file://Users/t/Dropbox/dotfiles/.vim/bundle/vim-snippets'
Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'xolox/vim-misc'
Plugin 'vimoutliner/vimoutliner'
Plugin 'tommcdo/vim-exchange'
Plugin 'lord-garbage/tslime.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'airblade/vim-gitgutter'
Plugin 'coderifous/textobj-word-column.vim'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-function'
Plugin 'kana/vim-textobj-fold'
Plugin 'kana/vim-textobj-indent'
Plugin 'lucapette/vim-textobj-underscore'
Plugin 'thinca/vim-textobj-function-javascript'
Plugin 'AndrewRadev/switch.vim'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'nelstrom/vim-qargs'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'tpope/vim-eunuch'
Plugin 'junegunn/goyo.vim'
Plugin 'davidbeckingsale/writegood.vim'
Plugin 'tpope/vim-characterize'
Plugin 'scrooloose/syntastic'

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
set autoread
set autowrite
set nrformats=
set clipboard=unnamed
set history=200
set timeoutlen=300
set formatoptions=qrn1
set backspace=indent,eol,start

" UI options
set guioptions=agi
set ruler
set number
set showmatch
set showcmd
set mousehide
set laststatus=2
set scrolloff=5
set showmode
set splitbelow
set splitright
set virtualedit=all
set shortmess+=I

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
set gdefault

" List characters
set nolist
set listchars=tab:▸\ ,eol:¬,trail:█,extends:>,precedes:<
set cpoptions+=$

" Session options
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

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

" Swap real line movement with display line movement
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Migrate window navigation back to default mapping
nnoremap <leader>h :echoerr "No! use C-w"<cr>
nnoremap <leader>l :echoerr "No! use C-w"<cr>
nnoremap <leader>j :echoerr "No! use C-w"<cr>
nnoremap <leader>k :echoerr "No! use C-w"<cr>

" Resize windows with arrows
nnoremap <up> <C-w>+
nnoremap <down> <C-w>-
nnoremap <left> <C-w><
nnoremap <right> <C-w>>

" Toggle plugins
nnoremap <leader>jsh :JSHintToggle<cr>
nnoremap <leader>gu :GundoToggle<cr>
nnoremap <leader>tm :SignatureToggle<cr>
nnoremap <leader>sw :Switch<cr>

" Edit vimrc
nnoremap <leader>ev :e ~/Dropbox/dotfiles/.vimrc<cr>

" Source vimrc
nnoremap <leader>sv :so $MYVIMRC<cr>

" Clear searches
nnoremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>

" Delete buffer
nnoremap <leader>da :bufdo silent! bdelete<cr>

" Preview buffer in Marked.app
nnoremap <leader>mp :silent !open -a Marked.app '%:p'<cr>

" Convert to markdown to html with marked (node) and save to clipboard
nnoremap <leader>mc :write ! marked \| pbcopy<cr>

" Bubble lines to top and bottom of buffer
nnoremap <leader>bk m'ddggP''
nnoremap <leader>bj m'ddGp''

" Select entire buffer
nnoremap vaa ggvGg_
nnoremap Vaa ggVG

" Use Dash.app for man search
nmap <silent> K <Plug>DashSearch

" Expand %% to path of active buffer in ex mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Wrap visual selection with backticks for fenced code block
vnoremap <leader>` <esc>`>o<esc>I```<esc>`<O<esc>I```

" Clear search matches when redrawing
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Preserve flags when repeating :s
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Make Y consistent with C & D, yy already yanks entire line
nnoremap Y y$

" Enable undo for <C-U>
inoremap <C-U> <C-G>u<C-u>

" Show highlighting groups for current word
nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

" Keep cursor in place when joining lines
nnoremap J mzJ`z

" Disable unused mappings
nnoremap Q <nop>
nnoremap <F1> <nop>

" ---------------------------------------------------------------
" STYLES
" ---------------------------------------------------------------

" Terminal colors
set t_Co=256
set term=screen-256color

" Set colors according to current iTerm 2 profile
if $ITERM_PROFILE == 'Solarized Light'
    set background=light
    colorscheme solarized
    let g:airline_theme='solarized'
elseif $ITERM_PROFILE == "Writing"
    set background=light
    colorscheme writing
    let g:airline_theme='monochrome'
elseif $ITERM_PROFILE == 'Basic'
    set background=light
    colorscheme base16-google
    let g:airline_theme='understated'
elseif $ITERM_PROFILE == 'Flat Dark'
    set background=dark
    colorscheme base16-flat
    let g:airline_theme='base16'
elseif $ITERM_PROFILE == 'Flat Light'
    set background=light
    colorscheme base16-flat
    let g:airline_theme='base16'
else
    set background=dark
    colorscheme solarized
    let g:airline_theme='solarized'
endif

" Macvim / gVim font
set guifont=Fira\ Mono:h18

" Global colorscheme fixes
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
augroup settings_neocomplete
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

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

" goyo.vim ------------------------------------------------------
let g:goyo_width = 65
let g:goyo_margin_top = 2
let g:goyo_margin_bottom =2
nnoremap <leader>w :Goyo<cr>
function! Goyo_before()
    WritegoodEnable
    silent !tmux set status off
endfunction
function! Goyo_after()
    silent !tmux set status on
endfunction
let g:goyo_callbacks = [function('Goyo_before'), function('Goyo_after')]

" Syntastic------------------------------------------------------
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_html_checkers = ['w3']
let g:syntastic_javascript_checkers = ["jshint"]
let g:syntastic_css_checkers = ["csslint"]

" ---------------------------------------------------------------
" COMMANDS
" ---------------------------------------------------------------

" Toggle Tmux status bar
command! TmuxStatus silent !tmux set status

" Open Finder Here
command! Finder silent !open .

" ---------------------------------------------------------------
" AUTOCOMMANDS
" ---------------------------------------------------------------

" Set comment string for Sass files
augroup filetype_scss
    autocmd!
    autocmd FileType scss set commentstring=//\ %s
augroup END

" Turn on spellchecking in text files
augroup filetype_text
    autocmd!
    autocmd BufRead,BufNewFile *.txt,*.md,*.markdown,*.readme setlocal spell spelllang=en_us
augroup END

" Turn on spellchecking and set hard width for Git commits
augroup filetype_gitcommit
    autocmd!
    autocmd FileType gitcommit setlocal tw=66
    autocmd FileType gitcommit setlocal spell spelllang=en_us
augroup END

" Set initial foldlevel for Vimoutliner files
augroup filetype_vimoutliner
    autocmd!
    autocmd BufRead,BufNewFile *.otl set foldlevel=1
augroup END

" Add node dict for JS files
augroup filetype_js
    autocmd!
    autocmd FileType javascript set dictionary+=$HOME/.vim/dict/node.dict
augroup END
