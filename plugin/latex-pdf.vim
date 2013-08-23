autocmd BufWritePost *.tex call CreatePdf(expand('%:p'))
autocmd BufWritePost *.cls call CheckClassUse(expand('%:t:r'))

fu CreatePdf(path)
    silent execute '!pdflatex -output-directory=' . fnamemodify(a:path, ':p:h') . ' ' . a:path
    silent execute '!open ' . fnamemodify(a:path, ':p:r') . '.pdf'
endfu

fu CheckClassUse(className)
    let texPaths = split(globpath('%:p:h', '**/*.tex'), '\n')

    for path in texPaths
        let find = "documentclass.*{" . a:className . "}"
        let path = EscapePath(path)

        redir => result
            silent execute '!grep -q "' . find . '" ' . path
        redir end

        if match(result, 'shell returned 1') < 0
            call CreatePdf(path)
        endif
    endfor
endfu

fu EscapePath(string)
    return substitute(a:string, ' ', '\\ ', 'g')
endfu
