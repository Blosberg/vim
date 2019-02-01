" Bren Osbergs vimrc file (copied from Lana) 

" =========== navigation +appearance ===== {{{1
" set ruler
" set number
set fileencodings=en_US.UTF-8

set foldcolumn=3
set foldmethod=marker

let mapleader=","
nnoremap <leader>TRW :TRWS<cr>
nnoremap <leader>b   :bp<cr>
nnoremap <leader>n   :bn<cr>

nnoremap <leader>ut  :UndotreeToggle<cr>
nnoremap <leader>nt  :NERDTreeToggle<cr>
nnoremap <leader>cy  :Calendar -view=year -split=vertical -width=27<cr>
nnoremap <leader>cm  :Calendar -view=month<cr>



" set foldnestmax=10
" set nofoldenable
" set foldlevel=2

set wrap lbr " prevents line breaks from interupting the middle of a word
syntax on
colorscheme darkblue
set hlsearch

" The next 2 lines are the Default settings
" set nocompatible
filetype plugin indent on

" ensure that 2 extra lines are always shown above and below cursor to provide
" context
set scrolloff=2

" =========== SPLITS ===================== {{{1

" speed up navigating and resizing splits
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

nnoremap <lt> <C-W><lt>
nnoremap > <C-W>>
nnoremap - <C-W>-
nnoremap + <C-W>+

set splitright
set splitbelow

set noeol
set backspace=2


" =========== PLUGINS ==================== {{{1

packadd minpac
call minpac#init()

" --- undotree --- {{{2
call minpac#add('mbbill/undotree')
set undofile
set undodir=~/.vim/undodir

" --- NERDtree --- {{{2
call minpac#add('scrooloose/nerdtree')
let g:NERDTreeDirArrows=0

" --- lightline.vim --- {{{2
call minpac#add('itchyny/lightline.vim')
if !has('gui_running')
  set t_Co=256
endif
set laststatus=2

" --- calendar.vim --- {{{2
call minpac#add('itchyny/calendar.vim')

" --- vimwiki: --- {{{2
call minpac#add('vimwiki/vimwiki')
let g:vimwiki_list = [{'path':'~/.vim/vimwiki/'}]

" --- git-gutter: --- {{{2
call minpac#add('airblade/vim-gitgutter', {'type': 'opt'})


" =========== COMMANDS  ================== {{{1

" Command to trim trailing white space at the end of lines
command! -range=% TRWS let b:wv = winsaveview() |
            \ keeppattern <line1>,<line2>s/\s\+$// |
            \ call winrestview(b:wv)

" =========== MAPPINGS  ================== {{{1

" set list
" set listchars=tab:▸\ ,eol:¬

" make whitespace visible


" Source the vimrc file after saving it
if has("autocmd")
 autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
endif

" example function 
function! Test(x,y)
  echo "x=" a:x
  echo "y=" a:y
  return a:x+a:y
endfunction

" Set the mksessions option so that session options are stored in local path (and therefore accessible from multiple machines)
set sessionoptions=buffers,curdir,folds,tabpages

