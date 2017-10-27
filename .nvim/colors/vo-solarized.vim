"these lines are suggested to be at the top of every colorscheme
hi clear
if exists("syntax_on")
  syntax reset
endif

runtime plugged/vim-colors-solarized/colors/solarized.vim

let g:colors_name = "vo-solarized"

if &background == "light"
    hi Normal ctermbg=15 ctermfg=10
    hi OL1 ctermfg=10
    hi OL2 ctermfg=10
    hi OL3 ctermfg=10
    hi OL4 ctermfg=10
    hi OL5 ctermfg=10
    hi OL6 ctermfg=10
    hi OL7 ctermfg=10
    hi OL8 ctermfg=10
    hi OL9 ctermfg=10
    hi Folded guifg=NONE guibg=NONE cterm=NONE ctermfg=10 ctermbg=NONE
    hi FoldColumn guifg=NONE guibg=NONE  ctermfg=10 ctermbg=NONE
else
    hi Folded guifg=NONE guibg=NONE cterm=NONE ctermfg=14 ctermbg=NONE
    hi FoldColumn guifg=NONE guibg=NONE  ctermfg=14 ctermbg=NONE
endif

hi spellErr gui=bold,underline guifg=red cterm=bold,underline ctermfg=1
hi BadWord  gui=bold,underline guifg=red cterm=bold,underline ctermfg=1
hi LineNr guibg=NONE ctermbg=NONE
hi! link SignColumn LineNr
syn match outlTags '_tag_\w*' contained
syn match outlTags '\s#\w*' contained
syn match outlTags '_ilink_\s*\(.\{-}:\s\)\?.*' contained
syn match outlTags '\s@\w*' contained
hi outlTags ctermfg=5 cterm=bold
