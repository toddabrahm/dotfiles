let g:colors_name="vo-solarized"

hi OL1 ctermfg=14
hi OL2 ctermfg=12
hi OL3 ctermfg=11
hi OL4 ctermfg=10
hi OL5 ctermfg=10
hi OL6 ctermfg=10
hi OL7 ctermfg=10
hi OL8 ctermfg=10
hi OL9 ctermfg=10

" colors for tags
hi outlTags guifg=darkred ctermfg=5

" color for body text
hi BT1 guifg=#585858 ctermfg=10
hi BT2 guifg=#585858 ctermfg=10
hi BT3 guifg=#585858 ctermfg=10
hi BT4 guifg=#585858 ctermfg=10
hi BT5 guifg=#585858 ctermfg=10
hi BT6 guifg=#585858 ctermfg=10
hi BT7 guifg=#585858 ctermfg=10
hi BT8 guifg=#585858 ctermfg=10
hi BT9 guifg=#585858 ctermfg=10

" color for pre-formatted text
hi PT1 guifg=#585858 ctermfg=10
hi PT2 guifg=#585858 ctermfg=10
hi PT3 guifg=#585858 ctermfg=10
hi PT4 guifg=#585858 ctermfg=10
hi PT5 guifg=#585858 ctermfg=10
hi PT6 guifg=#585858 ctermfg=10
hi PT7 guifg=#585858 ctermfg=10
hi PT8 guifg=#585858 ctermfg=10
hi PT9 guifg=#585858 ctermfg=10

" color for tables
hi TA1 guifg=#585858 ctermfg=10
hi TA2 guifg=#585858 ctermfg=10
hi TA3 guifg=#585858 ctermfg=10
hi TA4 guifg=#585858 ctermfg=10
hi TA5 guifg=#585858 ctermfg=10
hi TA6 guifg=#585858 ctermfg=10
hi TA7 guifg=#585858 ctermfg=10
hi TA8 guifg=#585858 ctermfg=10
hi TA9 guifg=#585858 ctermfg=10

" color for user text (wrapping)
hi UT1 guifg=#585858 ctermfg=10
hi UT2 guifg=#585858 ctermfg=10
hi UT3 guifg=#585858 ctermfg=10
hi UT4 guifg=#585858 ctermfg=10
hi UT5 guifg=#585858 ctermfg=10
hi UT6 guifg=#585858 ctermfg=10
hi UT7 guifg=#585858 ctermfg=10
hi UT8 guifg=#585858 ctermfg=10
hi UT9 guifg=#585858 ctermfg=10

" color for user text (non-wrapping)
hi UB1 guifg=#585858 ctermfg=10
hi UB2 guifg=#585858 ctermfg=10
hi UB3 guifg=#585858 ctermfg=10
hi UB4 guifg=#585858 ctermfg=10
hi UB5 guifg=#585858 ctermfg=10
hi UB6 guifg=#585858 ctermfg=10
hi UB7 guifg=#585858 ctermfg=10
hi UB8 guifg=#585858 ctermfg=10
hi UB9 guifg=#585858 ctermfg=10

" colors for folded sections
hi Folded guifg=NONE guibg=NONE cterm=NONE ctermfg=14 ctermbg=NONE
hi FoldColumn guifg=NONE guibg=NONE  ctermfg=10 ctermbg=NONE

" colors for experimental spelling error highlighting
" this only works for spellfix.vim with will be cease to exist soon
hi spellErr gui=underline guifg=red	cterm=underline ctermfg=1
hi BadWord gui=underline guifg=red cterm=underline ctermfg=1

hi LineNr guibg=NONE ctermbg=NONE
hi! link SignColumn LineNr

syn match outlTags '_tag_\w*' contained
syn match outlTags '\s#\w*' contained
syn match outlTags '_ilink_\s*\(.\{-}:\s\)\?.*' contained
syn match outlTags '\s@\w*' contained
