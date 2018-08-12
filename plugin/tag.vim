" tag.vim

if exists('g:loaded_vim_tag') || &cp
  finish
endif
let g:loaded_vim_tag = 1

function! s:getCword()
  return expand("<cword>")
endfunction

function! s:makeTag(type)
  let tagName = s:getCword()
  if a:type != 'single'
    let tag = '<'.tagName.'>'.'</'.tagName.'>'
    execute 'normal! ciw'.tag
    execute 'silent! normal T>'
  else
    let tag = '<'.tagName.'/>'
    execute 'normal! ciw'.tag
    execute 'silent! normal h'
  endif
  startinsert
endfunction

inoremap <script> ,t <esc>:call <SID>makeTag("")<cr>
inoremap <script> ,st <esc>:call <SID>makeTag("single")<cr>
