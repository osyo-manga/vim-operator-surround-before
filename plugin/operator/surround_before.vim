scriptencoding utf-8
if exists('g:loaded_surround_before')
  finish
endif
let g:loaded_surround_before = 1

let s:save_cpo = &cpo
set cpo&vim


call operator#user#define('surround-append-after-getchar', 'operator#surround_before#append')

nmap <Plug>(operator-surround-append-before-getchar) :call operator#surround_before#getchar("\<Plug>(operator-surround-append-after-getchar)")<CR>


let &cpo = s:save_cpo
unlet s:save_cpo
