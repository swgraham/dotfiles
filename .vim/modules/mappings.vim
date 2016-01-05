" Set the local leader.
let maplocalleader = "|"

" Clears the search.
function! s:clear_search_results()
  let @/ = ""
endfunction

nnoremap <silent> <leader>/d :call <SID>clear_search_results()<CR>

" Shows the amount of matches for the previous search.
function! s:count_search_results()
  %s///gn
endfunction

nnoremap <silent> <leader>/c :call <SID>count_search_results()<CR>

" Deletes the hidden buffers.
function! s:delete_hidden_buffers()
  let tpbl=[]
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    silent execute 'bwipeout' buf
  endfor
endfunction

nnoremap <silent> <leader>bd :call <SID>delete_hidden_buffers()<CR>

" Corrects the spelling under the cursor with the first suggestion.
function! s:correct_to_first_spelling_suggestion()
  normal 1z=
endfunction

nnoremap <silent> <leader>z :call <SID>correct_to_first_spelling_suggestion()<CR>

" Trim the trailing white space from the file.
function! s:trim_trailing_whitespace()
  %s/\s\+$//e
endfunction

nnoremap <silent> <leader>cw :call <SID>trim_trailing_whitespace()<CR>

" Opens the split in a new tab. Kind like "distraction free" mode.
nnoremap <silent> <leader>wf :tab sp<CR>

" Pull from either side of a git conflict.
nnoremap <silent> <leader>gl :diffget LOCAL<CR>
nnoremap <silent> <leader>gr :diffget REMOTE<CR>

" Print out the current mappings.
function! s:show_mappings()
  let path = Dot('mappings.sh')
  exec '!' . path
endfunction

nnoremap <silent> <leader><leader> :call <SID>show_mappings()<CR>

" Easy escape.
inoremap jk <esc>

" Quick session bindings.
nnoremap <silent> <leader>sw :mksession! .quicksave.vim<CR>:echo "Session saved."<CR>
nnoremap <silent> <leader>sr :source .quicksave.vim<CR>:echo "Session loaded."<CR>


" swgraham customizations
"

" From mde
"
" Turn off auto-indent for paste
set pastetoggle=<F8>

" Cycle through the tabs
 map <C-J> :tabp<CR>
 map <C-K> :tabn<CR>

" Some sort of past thing... don't think it works
map <C-c> "+y<CR>

" Suppress all spaces at end/beginning of lines
 nmap _s :%s/\s\+$//<CR>
 nmap _S :%s/^\s\+//<CR>
 nmap _j :g/\S/,/^\s*$/join<CR>
 nmap _w :set wrap lbr tw=0 co=100<CR>
 nmap _t :tabnew<CR>
 " fix tabs
 nmap _T :%s/\t/  /g<CR>
 nmap _l :set nonu<CR>
 nmap _L :set nu<CR>
 nmap _h :highlight RedundantSpaces ctermbg=blue guibg=blue<CR>:match RedundantSpaces /\s\+$\| \+\ze\t/<CR>

" Hot Keys for using Notes Plugin
" Bundle: xolox/vim-notes
" Bundle: xolox/vim-misc
map <D-r> :tabnew<CR>:RecentNotes<CR>
map <D-d> :tabnew<CR>:e note:TODO<CR>
map <C-o> :wincmd gf<CR>
let g:notes_directories = ['~/Documents/Notes']

