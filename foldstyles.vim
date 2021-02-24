" set foldcolumn=2
" set foldexpr=FoldPythonFuncdefs()
" set foldtext=FoldTextGeneric()
" setlocal foldmethod=expr
" setlocal foldexpr=MarkdownFolds()

function! FoldVimwiki() "{{{1
  let thisline = getline(v:lnum)
  if match(thisline, '^=.*=') >= 0
    return ">1"
  elseif match( thisline, '^ *\* ') >=0
    return ">2"
  else
    return "="
  endif
endfunction

function! FoldPythonFuncdefs() "{{{1
  let thisline = getline(v:lnum)
  if match(thisline, '^def .*:') >= 0
    return ">1"
  elseif match(thisline, '^class .*:$') >= 0
    return ">1"
  else
    return "="
  endif
endfunction

function! FoldPythonMain() "{{{1
  let thisline = getline(v:lnum)
  if match(thisline, '^# *--- *\w\+') >= 0
    return ">1"
  elseif match(thisline, '^## *--- *\w\+') >= 0
    return ">2"
  elseif match(thisline, '^### *--- *\w\+') >= 0
    return ">3"
  elseif match(thisline, '^#\s*===') >= 0
    return ">0"
  elseif match( thisline, '^def .*') >=0
    return ">1"
  elseif match( thisline, '^#===') >=0
    return ">0"
  elseif match( thisline, '^\s+def .*') >=0
    return ">2"
  else
    return "="
  endif
endfunction

function! FoldSnakemake() "{{{1
  let thisline = getline(v:lnum)
  if match(thisline, '^rule .*:') >= 0
    return ">1"
  elseif match(thisline, '^# *--- \w\+') >= 0
    return ">1"
  elseif match(thisline, '^## *--- \w\+') >= 0
    return ">2"
  elseif match(thisline, '^### *--- \w\+') >= 0
    return ">3"
  elseif match(thisline, '^#$') >= 0
    return ">0"
  elseif match(thisline, '^#===') >= 0
    return ">0"
  else
    return "="
  endif
endfunction

function! FoldRmarkdown() "{{{1
  let thisline = getline(v:lnum)
  if match(thisline, 'title:') >= 0
    return ">1"
  elseif match(thisline, '^```{r .*}') >= 0
    return ">1"
  else
    return "="
  endif
endfunction

function! FoldR() "{{{1
  let thisline = getline(v:lnum)
  if match(thisline, '\w\+ *<- *function(') >= 0
    return ">1"
  elseif match(thisline, '^# *--- *\w\+') >= 0
    return ">1"
  elseif match(thisline, '^### .*') >= 0
    return ">2"
  elseif match(thisline, '^#### .*') >= 0
    return ">3"
  elseif match(thisline, '^##### .*') >= 0
    return ">4"
  else
    return "="
  endif
endfunction

function! FoldJson() "{{{1
  let thisline = getline(v:lnum)
  if thisline == 1
    return 0
  elseif match(thisline, '^\s*"\w\+":\s*{') >= 0
    return foldlevel(thisline-1) + 1
  elseif match(thisline, '^\s*}\s*,\s*$') >= 0
    return foldlevel(thisline-1) - 1
  else
    return "="
  endif
endfunction

function! FoldShell() "{{{1
  let thisline = getline(v:lnum)
  if match(thisline, '^## .*') >= 0
    return ">1"
  elseif match(thisline, '^### .*') >= 0
    return ">2"
  elseif match(thisline, '^#### .*') >= 0
    return ">3"
  elseif match(thisline, '^##### .*') >= 0
    return ">4"
  elseif match(thisline, '^#===*') >= 0
    return ">0"
  elseif match( thisline, '^\s+def .*') >=0
    return ">2"
  else
    return "="
  endif
endfunction


" function! FoldTextGeneric()
"   let foldsize = (v:foldend-v:foldstart)
"   return getline(v:foldstart).' ('.foldsize.' Lines Folded)'
" endfunction
" set foldmethod=expr
" set foldexpr=FoldSnakemake()
