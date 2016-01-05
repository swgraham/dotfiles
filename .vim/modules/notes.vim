" Hot Keys for using Notes Plugin
" Bundle: xolox/vim-notes
" Bundle: xolox/vim-misc
map <D-r> :tabnew<CR>:RecentNotes<CR>
map <D-d> :tabnew<CR>:e note:TODO<CR>
map <C-o> :wincmd gf<CR>

let g:notes_directories = ['~/Documents/Notes']

