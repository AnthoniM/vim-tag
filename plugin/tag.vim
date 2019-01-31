" tag.vim

if exists('g:loaded_vim_tag') || &cp
  finish
endif
let g:loaded_vim_tag = 1

function! s:getCword()
  echom expand("<cfile>")
  return expand("<cfile>")
endfunction

function! s:makeTag(type)
  let tagName = s:getCword()
  let line = getline('.')
  let cursor = getcurpos()
  let row = cursor[1]
  let column = cursor[2]
  let left = line[:column-1]
  let right = line[column:]
  let left = substitute(left, tagName."$", "", "")
  if a:type != 'single'
    let left .= '<'.tagName.'>'
    let right = '</'.tagName.'>'.right
  else
    let left .= '<'.tagName.'/>'
  endif
  call setline(row, left.right) 
  call cursor(row, len(left)+1)
  startinsert
endfunction

inoremap <script> ,t <esc>:call <SID>makeTag("")<cr>
inoremap <script> ,st <esc>:call <SID>makeTag("single")<cr>
