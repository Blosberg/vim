" vim: foldmethod=marker
" navigation and appearance {{{1 
" set ruler
" set number
" set fileencodings=en_US.UTF-8
" set foldcolumn=3
" set foldmethod=marker

set wrap lbr " prevents line breaks from interupting the middle of a word
syntax on
colorscheme darkblue
set hlsearch

" speed up navigating and resizing splits
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

nnoremap <lt> <C-W><lt>
nnoremap > <C-W>>
nnoremap - <C-W>-
nnoremap + <C-W>+

nnoremap <C-G><C-U> :GundoToggle
nnoremap <C-N><C-T> :NERDTreeToggle
set splitright
set splitbelow

set noeol
set backspace=2    

" set list
" set listchars=tab:▸\ ,eol:¬
" make whitespace visible


" Source the vimrc file after saving it
if has("autocmd")
 autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Gundo settings {{{1
set undofile 
set undodir=~/.vim/undodir
" set undolevels=1000         " How many undos
" set undoreload=10000        " number of lines to save for undo
let g:gundo_width = 60
let g:gundo_preview_height = 10
" let g:gundo_right = 1

let g:NERDTreeDirArrows=0
" ---- Folding styles {{{1
" setlocal foldmethod=expr
" setlocal foldexpr=FoldSnakemake()
" setlocal foldtext=FoldTextSnakemake()

" lightline.vim
if !has('gui_running')
  set t_Co=256
endif
set laststatus=2

" example function {{{
function! Test(x,y)
  echo "x=" a:x
  echo "y=" a:y
  return a:x+a:y
endfunction


