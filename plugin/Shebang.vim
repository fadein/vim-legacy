function! <SID>Shebang(...)
	if a:0 == 0
        let shebang = '#!/bin/sh'
    else
        let path = system('which ' . a:000[0])
        if !v:shell_error
            "path has a null char at the end of it, this
            "trims it off
            let path = path[:-2]
            let shebang = '#!' . path
            for a in a:000[1:]
                let shebang .= ' ' . a
            endfor
        else
            echoerr "Command not found: " . a:000[0]
            return
        endif
    endif

	"save cursor position
	let save_pos = getpos('.')

    if getline(1) =~ '^#!'
        "replace an already existing shebang line
        call setline(1, shebang)
    else
        "otherwise, add it to the top and replace the cursor
        "one line lower than we found it
        call append(0, shebang)
        let save_pos[1] += 1
    endif

	"make this file executable
	call system('chmod +x -- ' . shellescape(expand('%')))

	"restore cursor positon
	call setpos('.', save_pos)
endfunction

command! -nargs=* -bar Shebang call <SID>Shebang(<f-args>)
