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
Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neoyank.vim'
Plugin 'Shougo/unite-outline'
Plugin 'Konfekt/FastFold'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'sickill/vim-pasta'
Plugin 'tomtom/tcomment_vim'
Plugin 'kshenoy/vim-signature'
Plugin 'tpope/vim-fugitive'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-markdown'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'tommcdo/vim-exchange'
Plugin 'AndrewRadev/switch.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'airblade/vim-gitgutter'
Plugin 'kana/vim-textobj-user'
Plugin 'lucapette/vim-textobj-underscore'
Plugin 'tpope/vim-eunuch'
Plugin 'junegunn/goyo.vim'
Plugin 'scrooloose/syntastic'
Plugin 'vimoutliner/vimoutliner'
Plugin 'file://Users/t/Dropbox/dotfiles/.vim/bundle/vim-snippets'

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

" Resize windows with arrows
nnoremap <up> <C-w>+
nnoremap <down> <C-w>-
nnoremap <left> <C-w><
nnoremap <right> <C-w>>

" Toggle plugins
nnoremap <leader>tm :SignatureToggle<cr>
nnoremap <leader>sw :Switch<cr>
nnoremap <leader>l :SyntasticCheck<cr>

" Edit vimrc
nnoremap <leader>ev :e ~/Dropbox/dotfiles/.vimrc<cr>

" Source vimrc
nnoremap <leader>sv :so $MYVIMRC<cr>

" Clear searches
nnoremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>

" Delete buffer
nnoremap <leader>da :bufdo silent! bdelete<cr>

" Preview buffer in Marked.app
nnoremap <leader>mp :silent !open -a Marked\ 2.app '%:p'<cr>

" Convert to markdown to html with marked (node) and save to clipboard
nnoremap <leader>mc :write ! marked \| pbcopy<cr>

" Bubble lines to top and bottom of buffer
nnoremap <leader>bk m'ddggP''
nnoremap <leader>bj m'ddGp''

" Select entire buffer
nnoremap vaa ggvGg_
nnoremap Vaa ggVG

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

" Disable unused mappings
nnoremap K <nop>
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
else
    set background=dark
    colorscheme solarized
    let g:airline_theme='solarized'
endif

" Macvim / gVim font
set guifont=Fira\ Mono:h14

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

" Emmet -------------------------------------------------------
let g:user_emmet_leader_key = '<c-e>'
let g:use_emmet_complete_tag = 1

" delimitMate -------------------------------------------------
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
let delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_balance_matchpairs = 1

" Unite -------------------------------------------------------

" Source mappings (,f = file, ,g = grep, ,b = buffer, etc)
nnoremap <C-p> :Unite -no-split -unique -buffer-name=unite buffer file file_rec/async<cr>
nnoremap <leader>f :Unite -no-split -buffer-name=files file_rec/async<cr>
nnoremap <leader>g :Unite -no-split -buffer-name=grep grep<cr>
nnoremap <leader>b :Unite -no-split -buffer-name=buffers buffer<cr>
nnoremap <leader>y :Unite -no-split -buffer-name=yanks history/yank<cr>
nnoremap <leader>o :Unite -no-split -buffer-name=outline outline<cr>
nnoremap <leader>r :UniteResume<cr>

" Use ag (silver searcher) for grep
if executable('ag')
    let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--line-numbers --nocolor --nogroup --hidden --ignore-dir={.git, .hg, .svn, .bzr, node_modules}'
    let g:unite_source_grep_recursive_opt = ''
endif

" Set mappings inside unite buffers
function! s:unite_settings() "{
    imap <buffer> <C-j> <Plug>(unite_select_next_line)
    imap <buffer> <C-k> <Plug>(unite_select_previous_line)
    nmap <buffer> <Esc> <Plug>(unite_exit)
    nmap <buffer> <C-l> <Plug>(unite_redraw)
 endfunction
autocmd FileType unite call s:unite_settings()

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

" Syntastic -----------------------------------------------------
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_html_checkers = ['validator']
let g:syntastic_html_validator_parser = 'html5'
let g:syntastic_javascript_checkers = ["jshint"]
let g:syntastic_css_checkers = ["csslint"]
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["html", "css", "scss"] }

" Airline -----------------------------------------------------
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" Polyglot syntax bundle ----------------------------------------
let g:polyglot_disabled = ['markdown']

" Markdown.vim --------------------------------------------------
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'scss', 'xml', 'python', 'sh']

" Markdown Folding
let g:markdown_fold_style = 'nested'

" git-gutter ----------------------------------------------------
let g:gitgutter_realtime = 0

" goyo.vim ------------------------------------------------------
let g:goyo_width = 80
let g:goyo_margin_top = 2
let g:goyo_margin_bottom =2
nnoremap <leader>w :Goyo<cr>

" ---------------------------------------------------------------
" COMMANDS
" ---------------------------------------------------------------

" Toggle Tmux status bar
command! TmuxStatus silent !tmux set status
nnoremap <leader>ts :TmuxStatus<cr>

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

" Set filetype for Vagrantfiles
augroup vagrant
  autocmd!
  autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END
