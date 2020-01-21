"vimrc:

" =========== Cursor Movement ================= {{{1

set autoindent
filetype plugin indent on
syntax on
set expandtab

set wrap lbr " prevents line breaks from interupting the middle of a word
" ensure that 2 extra lines are always shown above and below cursor to provide
" context
set scrolloff=2

" set mouse+=a
set noeol
set backspace=2

" set foldcolumn=3
" Over-write this to make custom folds

" =========== SPLITS ===================== {{{2

" speed up navigating and resizing splits:
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

" =========== General Remappings ============== {{{1
" (Plugin-specific remappings are placed under the corresponding plugin)
let mapleader=","
nnoremap <leader>TRW :TRWS<cr>
"^ trim trailing white space from lines
" (see function below)

nnoremap <leader>b   :bp<cr>
nnoremap <leader>n   :bn<cr>
"^ navigate tabs quickly

vnoremap <C-X>      "*x
vnoremap <C-C>      "*y
nnoremap <leader>yy "*yy
nnoremap <leader>p  "*p
nnoremap <leader>P  "*P
"^ copy/paste directly to/from clipboard.

" set foldnestmax=10
" set nofoldenable
" set foldlevel=2

" =========== Appearance ====================== {{{1
set ruler
set nonumber norelativenumber
set nu! rnu!
set fileencodings=en_US.UTF-8

" set foldmethod dependent on filetype. Default is manual
" set foldmethod=manual
autocmd fileType vim     setlocal foldmethod=marker foldenable
"
" colorscheme darkblue
" colorscheme delek
colorscheme dichromatic 
set hlsearch

" =========== PLUGINS ========================= {{{1

packadd minpac
call minpac#init()

" --- undotree --- {{{2
call minpac#add('mbbill/undotree')
set undofile
set undodir=~/.vim/undodir
nnoremap <leader>ut  :UndotreeToggle<cr>

" --- NERDtree --- {{{2
call minpac#add('scrooloose/nerdtree')
let g:NERDTreeDirArrows=0

nnoremap <leader>nt  :NERDTreeToggle<cr>

" --- vim-airline --- {{{2
call minpac#add('vim-airline/vim-airline')


" --- vimwiki: --- {{{2

call minpac#add('vimwiki/vimwiki')
let g:vimwiki_list    = [{'path':'~/.vim/vimwiki/'}]
let g:vimwiki_folding = 'expr'

" --- fugitive:   --- {{{2
call minpac#add('tpope/vim-fugitive')
" call minpac#add('tpope/vim-fugitive', {'type': 'opt'})
" set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P

" --- Plugins not being used (for the moment): {{{2
" call minpac#add('vim/killersheep')

" --- git-gutter: --- {{{3
" call minpac#add('airblade/vim-gitgutter', {'type': 'opt'})

" --- easy-align: --- {{{3
" call minpac#add('junegunn/vim-easy-align')

" --- calendar.vim --- {{{3
" call minpac#add('itchyny/calendar.vim')

" --- sendtoterm: --- {{{3
" call minpac#add('habamax/vim-sendtoterm')

" nmap <C-T> <Plug>(SendToTermLine)
" vmap <C-CR> <Plug>(SendToTerm)
" nmap <C-T> <Plug>(SendToTermLine)j:call search('^\S')<CR>


" =========== COMMANDS  ======================= {{{1

" --- Trim trailing white space at the end of lines: {{{2
command! -range=% TRWS let b:wv = winsaveview() |
            \ keeppattern <line1>,<line2>s/\s\+$// |
            \ call winrestview(b:wv)

" --- Source the vimrc file after saving it: {{{2
if has('autocmd') " ignore this section if your vim does not support autocommands
    augroup reload_vimrc
        autocmd!
        autocmd! BufWritePost $MYVIMRC,$MYGVIMRC nested source %
    augroup END
endif

" =========== Templace vimscript: ============= {{{1
" set list
" set listchars=tab:▸\ ,eol:¬

" make whitespace visible

" 
" " example function 
" function! Test(x,y)
"   echo "x=" a:x
"   echo "y=" a:y
"   return a:x+a:y
" endfunction
" 
" " Set the mksessions option so that session options are stored in local path (and therefore accessible from multiple machines)
" set sessionoptions=buffers,curdir,folds,tabpages

