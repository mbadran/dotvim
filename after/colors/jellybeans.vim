if has("gui_running") || &t_Co == 88 || &t_Co == 256
	let s:low_color = 0
else
	let s:low_color = 1
endif

" Color approximation functions by Henry So, Jr. and David Liang {{{
" Added to jellybeans.vim by Daniel Herbert

" returns an approximate grey index for the given grey level
fun! s:grey_number(x)
	if &t_Co == 88
		if a:x < 23
			return 0
		elseif a:x < 69
			return 1
		elseif a:x < 103
			return 2
		elseif a:x < 127
			return 3
		elseif a:x < 150
			return 4
		elseif a:x < 173
			return 5
		elseif a:x < 196
			return 6
		elseif a:x < 219
			return 7
		elseif a:x < 243
			return 8
		else
			return 9
		endif
	else
		if a:x < 14
			return 0
		else
			let l:n = (a:x - 8) / 10
			let l:m = (a:x - 8) % 10
			if l:m < 5
				return l:n
			else
				return l:n + 1
			endif
		endif
	endif
endfun

" returns the actual grey level represented by the grey index
fun! s:grey_level(n)
	if &t_Co == 88
		if a:n == 0
			return 0
		elseif a:n == 1
			return 46
		elseif a:n == 2
			return 92
		elseif a:n == 3
			return 115
		elseif a:n == 4
			return 139
		elseif a:n == 5
			return 162
		elseif a:n == 6
			return 185
		elseif a:n == 7
			return 208
		elseif a:n == 8
			return 231
		else
			return 255
		endif
	else
		if a:n == 0
			return 0
		else
			return 8 + (a:n * 10)
		endif
	endif
endfun

" returns the palette index for the given grey index
fun! s:grey_color(n)
	if &t_Co == 88
		if a:n == 0
			return 16
		elseif a:n == 9
			return 79
		else
			return 79 + a:n
		endif
	else
		if a:n == 0
			return 16
		elseif a:n == 25
			return 231
		else
			return 231 + a:n
		endif
	endif
endfun

" returns an approximate color index for the given color level
fun! s:rgb_number(x)
	if &t_Co == 88
		if a:x < 69
			return 0
		elseif a:x < 172
			return 1
		elseif a:x < 230
			return 2
		else
			return 3
		endif
	else
		if a:x < 75
			return 0
		else
			let l:n = (a:x - 55) / 40
			let l:m = (a:x - 55) % 40
			if l:m < 20
				return l:n
			else
				return l:n + 1
			endif
		endif
	endif
endfun

" returns the actual color level for the given color index
fun! s:rgb_level(n)
	if &t_Co == 88
		if a:n == 0
			return 0
		elseif a:n == 1
			return 139
		elseif a:n == 2
			return 205
		else
			return 255
		endif
	else
		if a:n == 0
			return 0
		else
			return 55 + (a:n * 40)
		endif
	endif
endfun

" returns the palette index for the given R/G/B color indices
fun! s:rgb_color(x, y, z)
	if &t_Co == 88
		return 16 + (a:x * 16) + (a:y * 4) + a:z
	else
		return 16 + (a:x * 36) + (a:y * 6) + a:z
	endif
endfun

" returns the palette index to approximate the given R/G/B color levels
fun! s:color(r, g, b)
	" get the closest grey
	let l:gx = s:grey_number(a:r)
	let l:gy = s:grey_number(a:g)
	let l:gz = s:grey_number(a:b)

	" get the closest color
	let l:x = s:rgb_number(a:r)
	let l:y = s:rgb_number(a:g)
	let l:z = s:rgb_number(a:b)

	if l:gx == l:gy && l:gy == l:gz
		" there are two possibilities
		let l:dgr = s:grey_level(l:gx) - a:r
		let l:dgg = s:grey_level(l:gy) - a:g
		let l:dgb = s:grey_level(l:gz) - a:b
		let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
		let l:dr = s:rgb_level(l:gx) - a:r
		let l:dg = s:rgb_level(l:gy) - a:g
		let l:db = s:rgb_level(l:gz) - a:b
		let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
		if l:dgrey < l:drgb
			" use the grey
			return s:grey_color(l:gx)
		else
			" use the color
			return s:rgb_color(l:x, l:y, l:z)
		endif
	else
		" only one possibility
		return s:rgb_color(l:x, l:y, l:z)
	endif
endfun

" returns the palette index to approximate the 'rrggbb' hex string
fun! s:rgb(rgb)
	let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
	let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
	let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0
	return s:color(l:r, l:g, l:b)
endfun

" sets the highlighting for the given group
fun! s:X(group, fg, bg, attr, lcfg, lcbg)
	if s:low_color
		let l:fge = empty(a:lcfg)
		let l:bge = empty(a:lcbg)

		if !l:fge && !l:bge
			exec "hi ".a:group." ctermfg=".a:lcfg." ctermbg=".a:lcbg
		elseif !l:fge && l:bge
			exec "hi ".a:group." ctermfg=".a:lcfg." ctermbg=NONE"
		elseif l:fge && !l:bge
			exec "hi ".a:group." ctermfg=NONE ctermbg=".a:lcbg
		endif
	else
		let l:fge = empty(a:fg)
		let l:bge = empty(a:bg)

		if !l:fge && !l:bge
			exec "hi ".a:group." guifg=#".a:fg." guibg=#".a:bg." ctermfg=".s:rgb(a:fg)." ctermbg=".s:rgb(a:bg)
		elseif !l:fge && l:bge
			exec "hi ".a:group." guifg=#".a:fg." guibg=NONE ctermfg=".s:rgb(a:fg)
		elseif l:fge && !l:bge
			exec "hi ".a:group." guifg=NONE guibg=#".a:bg." ctermbg=".s:rgb(a:bg)
		endif
	endif

	if a:attr == ""
		exec "hi ".a:group." gui=none cterm=none"
	else
		if a:attr == 'italic'
			exec "hi ".a:group." gui=".a:attr." cterm=none"
		else
			exec "hi ".a:group." gui=".a:attr." cterm=".a:attr
		endif
	endif
endfun
" }}}

call s:X("Todo","993333","","","","")

call s:X("StatusLine","a0a0a0","384048","italic","","")
call s:X("StatusLineNC","151515","384048","italic","","")
call s:X("VertSplit","181818","384048","italic","","")

call s:X("Folded","e8e8d3","151515","italic","black","")
call s:X("FoldColumn","a0a8b0","384048","","","")
call s:X("SignColumn","384048","151515","","","")

call s:X("Function","bb7d7c","","","Pink","")

call s:X("NonText","151515","151515","","","")

call s:X("SpecialKey","151515","151515","","","")

" TODO: diff colours are too dark, change to ligher versions
call s:X("DiffChange","000000","10aaaa","","Black","DarkMagenta")
