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
Bundle 'spf13/PIV'
Bundle 'zef/vim-cycle'
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

" Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

" Line wrapping
set wrap
set linebreak
set nolist
set textwidth=80
set timeoutlen=300

" Folding
set foldmethod=manual
let g:DisableAutoPHPFolding = 1

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
set formatoptions=qrn1
set wildmenu
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help
set cpoptions+=$
set backspace=indent,eol,start
set listchars=tab:▸\ ,eol:¬,trail:█,extends:>,precedes:<
set spelllang=en_us

" Ignore
set wildignore+=node_modules

" ---------------------------------------------------------------
" MAPPINGS
" ---------------------------------------------------------------

let mapleader=","
map <leader>h <C-w>h
map <leader>l <C-w>l
map <leader>j <C-w>j
map <leader>k <C-w>k
noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>
nmap <leader>ts :set list!<CR>
nmap <leader>ev :e $MYVIMRC
map <leader>jsh :JSHintToggle<CR>
nnoremap <leader>gu :GundoToggle<CR>
nnoremap <leader>s :set spell!<CR>
nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>
nnoremap <leader>zz e:let &scrolloff=999-&scrolloff<CR>
map <leader>da :bufdo silent! bdelete<CR>
nnoremap <leader>tm :SignatureToggle<CR>
nnoremap <leader>bk m'ddggP''
nnoremap <leader>bj m'ddGp''
nmap <F5> :redraw!<CR>
call togglebg#map("<F6>")

" ---------------------------------------------------------------
" STYLES
" ---------------------------------------------------------------

set t_Co=256
set term=screen-256color
if $ITERM_PROFILE == "Solarized Dark"
    set background=dark
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
    set background=light
    colorscheme solarized
    let g:airline_theme='solarized'
endif
if has("gui_running")
    set guifont=Inconsolata-dz\ for\ Powerline:h18
endif

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

" Fugitive git ------------------------------------------------
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Ctrl-P ------------------------------------------------------
let g:ctrlp_cmd = 'CtrlP'
nmap <leader>be :CtrlPBuffer<CR>
nmap <leader>mru :CtrlPMRU<CR>
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
nmap <leader>fr :%! ~/bin/formd -r<CR>
nmap <leader>fi :%! ~/bin/formd -i<CR>

" Tagbar ------------------------------------------------------
let g:tagbar_ctags_bin='/usr/local/bin/ctags'  " Proper Ctags locations
let g:tagbar_width=26                          " Default is 40, seems too wide
nnoremap <silent> <leader>tb :TagbarToggle<CR>

" Gist.vim ----------------------------------------------------
let g:gist_post_private = 1
let g:gist_show_privates = 1
let g:gist_clip_command = 'pbcopy'

" delimitMate -------------------------------------------------
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_jump_expansion = 1

" neocomplete -------------------------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
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

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: "\<TAB>"
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" Markdown.vim --------------------------------------------------
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'scss', 'xml', 'php', 'python', 'sh']

" ---------------------------------------------------------------
" AUTOCOMMANDS & FUNCTIONS
" ---------------------------------------------------------------

" Reset .scss files to only the scss filetype
au BufRead,BufWinEnter,BufNewFile *.scss	set filetype=scss

" Textwidth for text file types
au FileType text,gitcommit,markdown setlocal tw=66
au BufRead,BufNewFile *.txt,*.md,*.markdown,*.readme setlocal tw=66

" vim-node (dict)
au FileType javascript set dictionary+=$HOME/.vim/dict/node.dict

" Save & load view automatically to save folds
autocmd BufWinLeave *.* mkview!
autocmd BufWinEnter *.* silent loadview

" Turn spelling on when entering a text/markdown buffer
autocmd BufRead,BufNewFile *.txt,*.md,*.markdown,*.readme setlocal spell spelllang=en_us

" Filetype comment strings
autocmd FileType scss set commentstring=//\ %s

"Show highlighting groups for current word
nmap <c-s-k> :call <sid>synstack()<cr>
function! <sid>synstack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synidattr(v:val, "name")')
endfunc

"Change fold styling in VimOutliner files
au BufRead,BufWinEnter,BufNewFile *.otl call OutlineStyle()
function! OutlineStyle()
    hi Folded guibg=NONE ctermbg=NONE guifg=NONE ctermfg=NONE cterm=NONE
    hi LineNr guibg=NONE ctermbg=NONE
endfunc

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

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#b58900 ctermbg=136
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#cb4b16 ctermbg=166
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#859900 ctermbg=64
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#d33682 ctermbg=125
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#6c71c4 ctermbg=61
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#268bd2 ctermbg=33

" Jumping to tags.
nnoremap <c-]> <c-]>mzzvzz15<c-e>`z:Pulse<cr>
nnoremap <c-\> <c-w>v<c-]>mzzMzvzz15<c-e>`z:Pulse<cr>
