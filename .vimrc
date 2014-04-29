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
Bundle 'jpalardy/vim-slime'
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
set number relativenumber
set guioptions=agi
set mousehide
set laststatus=2
set scrolloff=5
set showmode
set splitbelow

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
set textwidth=80

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
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <up> <C-w>+
nnoremap <down> <C-w>-
nnoremap <left> <C-w><
nnoremap <right> <C-w>>
nnoremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>
nnoremap <leader>ev :e ~/Dropbox/dotfiles/.vimrc<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>
nnoremap <leader>jsh :JSHintToggle<cr>
nnoremap <leader>gu :GundoToggle<cr>
nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>
nnoremap <leader>zz e:let &scrolloff=999-&scrolloff<cr>
nnoremap <leader>da :bufdo silent! bdelete<cr>
nnoremap <leader>tm :SignatureToggle<cr>
nnoremap <leader>sw :Switch<cr>
nnoremap <leader>bk m'ddggP''
nnoremap <leader>bj m'ddGp''
nnoremap vaa ggvGg_
nnoremap Vaa ggVG
nnoremap <silent> K <Plug>DashSearch
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
vnoremap <leader>` <esc>`>o<esc>I```<esc>`<O<esc>I```

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
elseif $ITERM_PROFILE == "Monokai Soda"
    set background=dark
    colorscheme Monokai
    let g:airline_theme='dark'
elseif $ITERM_PROFILE == "Jellybeans"
    set background=dark
    colorscheme jellybeans
    let g:airline_theme='jellybeans'
elseif $ITERM_PROFILE == "Tomorrow Night Eighties"
    set background=dark
    colorscheme Tomorrow-Night-Eighties
    let g:airline_theme='tomorrow'
elseif $ITERM_PROFILE == "Base16 Greenscreen Dark"
    set background=dark
    colorscheme base16-greenscreen
    let g:airline_theme='base16'
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

" Formd -------------------------------------------------------
nnoremap <leader>fr :%! ~/bin/formd -r<cr>
nnoremap <leader>fi :%! ~/bin/formd -i<cr>

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
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist'
    \ }
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <silent> <cr> <C-r>=<SID>my_cr_function()<cr>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<cr>"
endfunction
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#force_overwrite_completefunc = 1

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

" vim-slime -----------------------------------------------------
let g:slime_target = "tmux"

" tmux-complete.vim ---------------------------------------------
let g:tmuxcomplete#trigger = ''

" ---------------------------------------------------------------
" AUTOCOMMANDS & FUNCTIONS
" ---------------------------------------------------------------

" Reset .scss files to only the scss filetype
au BufRead,BufNewFile *.scss set filetype=scss

" Textwidth for text file types
au FileType text,gitcommit,markdown setlocal tw=66
au BufRead,BufNewFile *.txt,*.md,*.markdown,*.readme setlocal tw=66

" Open VimOutliner files mostly collapsed
au BufRead,BufNewFile *.otl set foldlevel=1

" vim-node (dict)
au FileType javascript set dictionary+=$HOME/.vim/dict/node.dict

" Turn spelling on when entering a text/markdown buffer
au BufRead,BufNewFile *.txt,*.md,*.markdown,*.readme setlocal spell spelllang=en_us

" Filetype comment strings
au FileType scss set commentstring=//\ %s

" Show highlighting groups for current word
nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

" Highlight Word https://github.com/sjl/dotfiles/blob/master/vim/vimrc
function! HiInterestingWord(n) "
    normal! mz
    normal! "zyiw
    let mid = 86750 + a:n
    silent! call matchdelete(mid)
    let pat = '\V\<' . escape(@z, '\') . '\>'
    call matchadd("InterestingWord" . a:n, pat, 1, mid)
    normal! `z
endfunction "

nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

hi def InterestingWord1 guifg=#fdf6e3 ctermfg=15 guibg=#cb4b16 ctermbg=9
hi def InterestingWord2 guifg=#fdf6e3 ctermfg=15 guibg=#859900 ctermbg=2
hi def InterestingWord3 guifg=#fdf6e3 ctermfg=15 guibg=#2aa198 ctermbg=6
hi def InterestingWord4 guifg=#fdf6e3 ctermfg=15 guibg=#268bd2 ctermbg=4
hi def InterestingWord5 guifg=#fdf6e3 ctermfg=15 guibg=#d33682 ctermbg=5
hi def InterestingWord6 guifg=#fdf6e3 ctermfg=15 guibg=#6c71c4 ctermbg=13
