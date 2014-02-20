scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim


let s:block = ""
function! operator#surround_before#getchar(map)
	echo "Input block:"
	let char = getchar()
	let s:block = type(char) == type(0) ? nr2char(char) : char
	if s:block == "\<C-c>" || s:block == "\<Esc>"
		let s:block = ""
	endif
	call feedkeys(a:map)
endfunction


function! operator#surround_before#append(motion_wise, ...)
	if s:block == ""
		call feedkeys(":call operator#surround#append(" . string(a:motion_wise) . ")\<CR>")
	else
		call feedkeys(":call operator#surround#append(" . string(a:motion_wise) . ")\<CR>" . s:block)
	endif
	let s:block = ""
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
