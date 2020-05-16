" ---------------------------------------------------------------
" PLUGINS
" ---------------------------------------------------------------

" Load plugins
call plug#begin('~/.config/nvim/plugged')

Plug '$HOME/Repos/booberry'
Plug '$HOME/Repos/vim-statusline'
Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'Konfekt/FastFold'
Plug 'Raimondi/delimitMate'
Plug 'sickill/vim-pasta'
Plug 'kshenoy/vim-signature'
Plug 'nelstrom/vim-visual-star-search'
Plug 'tommcdo/vim-exchange'
Plug 'AndrewRadev/switch.vim'
Plug 'airblade/vim-gitgutter'
Plug 'kana/vim-textobj-user'
Plug 'lucapette/vim-textobj-underscore'
Plug 'vimoutliner/vimoutliner'
Plug 'shawncplus/phpcomplete.vim', {'for': ['php', 'html']}
Plug 'mattn/emmet-vim', {'for': ['html', 'markdown']}
Plug 'tpope/vim-markdown', {'for': ['markdown']}
Plug 'nelstrom/vim-markdown-folding', {'for': ['markdown']}
Plug 'junegunn/goyo.vim'
Plug 'prettier/vim-prettier', {'for': ['javascript', 'typescript', 'css', 'scss', 'json', 'graphql', 'vue', 'yaml', 'html']}
Plug 'sheerun/vim-polyglot'
Plug 'posva/vim-vue'
Plug 'tyru/open-browser.vim'
Plug 'chrisbra/colorizer'

call plug#end()

" ---------------------------------------------------------------
" SETTINGS
" ---------------------------------------------------------------

set encoding=utf-8
set ffs=unix,dos
set synmaxcol=2000
set hidden
set noswapfile
set nobackup
set nowritebackup
set autoread
set autowrite
set nrformats=
set clipboard=unnamed
set timeoutlen=300
set formatoptions=qrn1  " @TODO This is different than neovim defaults
set modelines=0
set nomodeline

" UI options
set signcolumn=yes
set showmatch
set mousehide
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
set ignorecase
set smartcase

" List characters
set nolist
set listchars=tab:▸\ ,eol:¬,trail:█,extends:>,precedes:<

" Session options
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

" Wildmenu
set wildignore+=node_modules

" Spelling
" TODO Do I need to change any of this for nvim?
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
nnoremap <leader>e :ALEToggle<cr>

" Edit and Source init.vim
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

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
nnoremap <F10> :HighlightGroup<cr>

" Disable unused mappings
nnoremap K <nop>
nnoremap Q <nop>
nnoremap <F1> <nop>

" ---------------------------------------------------------------
" STYLES
" ---------------------------------------------------------------

" Global color fixes
function! GlobalHighlights() abort
    hi SignColumn guibg=NONE ctermbg=NONE
    hi SignatureMarkText guibg=NONE ctermbg=NONE
    hi SignatureMarkerText guibg=NONE ctermbg=NONE
endfunction

augroup GlobalColors
    autocmd!
    autocmd ColorScheme * call GlobalHighlights()
augroup END

if (has('termguicolors'))
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

set background=dark
colorscheme booberry
if ($ITERM_PROFILE == 'booberry-light')
    set background=light
endif

" ---------------------------------------------------------------
" PLUGIN SETTINGS
" ---------------------------------------------------------------

" Prettier ----------------------------------------------------
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" netrw -------------------------------------------------------
let g:netrw_sort_by="time"
let g:netrw_sort_direction="reverse"

" open-browswer.vim -------------------------------------------
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" Denite ------------------------------------------------------
call denite#custom#option('_', {
    \ 'prompt': '>',
    \ })

nnoremap <leader>u :Denite -unique -buffer-name=unite buffer file/rec<cr>
nnoremap <leader>f :Denite -buffer-name=files file/rec<cr>
nnoremap <leader>b :Denite -buffer-name=buffers buffer<cr>
nnoremap <leader>g :Denite -buffer-name=grep grep<cr>
nnoremap <leader>q :Denite -buffer-name=quickfix quickfix<cr>
nnoremap <leader>c :Denite -buffer-name=changes change<cr>
nnoremap <leader>j :Denite -buffer-name=jumps jump<cr>
nnoremap <leader>h :Denite -buffer-name=help help<cr>
nnoremap <leader>o :Denite -buffer-name=outline outline<cr>
nnoremap <leader>t :Denite -buffer-name=tags tag<cr>

" Use ag for file_rec source
call denite#custom#var('file/rec', 'command',
	\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

" Use ag for grep source
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
        \ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Disable sorting in outline in favor of source order
call denite#custom#var('outline', 'command', ['ctags', '--sort=0'])

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

" Deoplete ----------------------------------------------------
let g:deoplete#enable_at_startup = 1

call deoplete#custom#option({
    \ 'auto_complete_delay': 200,
    \ 'smart_case': v:true,
    \ })

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction

augroup settings_deoplete
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

" UltiSnips ---------------------------------------------------
let g:UltiSnipsExpandTrigger="<c-y>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME.'/Dropbox/code/vim-snippets/']

" Ale ---------------------------------------------------------
let g:ale_linters = {
\   'html': [''],
\   'markdown': ['proselint', 'write-good'],
\   'javascript': ['eslint'],
\   'css': ['stylelint'],
\   'scss': ['stylelint'],
\}

let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''

" Emmet -------------------------------------------------------
let g:user_emmet_leader_key = '<c-e>'
let g:use_emmet_complete_tag = 1

" delimitMate -------------------------------------------------
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
let delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_balance_matchpairs = 1

" Polyglot syntax bundle ----------------------------------------
let g:polyglot_disabled = ['markdown', 'coffee-script', 'jsx']

" Markdown.vim --------------------------------------------------
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'scss', 'xml', 'python', 'sh', 'c']

" Markdown Folding
let g:markdown_fold_style = 'nested'

" git-gutter ----------------------------------------------------
let g:gitgutter_realtime = 0

" goyo.vim ------------------------------------------------------
let g:goyo_width = 80
let g:goyo_margin_top = 2
let g:goyo_margin_bottom =2
nnoremap <leader>z :Goyo<cr>
nnoremap <leader>w :echoerr "DEPRECATED! Use <leader>z"<cr>

" gist.vim ------------------------------------------------------
let g:gist_post_private = 1
let g:gist_show_privates = 1

" ---------------------------------------------------------------
" COMMANDS
" ---------------------------------------------------------------

" Toggle Tmux status bar
command! TmuxStatus silent !tmux set status
nnoremap <leader>ts :TmuxStatus<cr>

" Open Finder here
command! Finder silent !open .

" Show highlight group
command! HighlightGroup call SynGroup()
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

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

" Highlight @ & # tags in vimoutliner
function! HighlightVimoutlinerTags() abort
    syn match outlTags '_tag_\w*' contained
    syn match outlTags '\s#\w*' contained
    syn match outlTags '_ilink_\s*\(.\{-}:\s\)\?.*' contained
    syn match outlTags '\s@\w*' contained
endfunction

augroup filetype_vimoutliner
    autocmd!
    autocmd BufRead,BufNewFile *.otl call HighlightVimoutlinerTags()
augroup END

" Set filetype for Vagrantfiles
augroup vagrant
  autocmd!
  autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

augroup filetype_vue
    autocmd!
    autocmd FileType vue syntax sync fromstart
augroup END

augroup filetype_markdown
    autocmd!
    autocmd FileType markdown :ALEDisableBuffer
augroup END

augroup highlight_todos_everywhere
    autocmd!
    autocmd Syntax * match Todo /\ctodo\|fixme/
augroup END
