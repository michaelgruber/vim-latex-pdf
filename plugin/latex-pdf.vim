autocmd BufWritePost *.tex call CreatePdfFromTex(expand('%:p'))
autocmd BufWritePost *.cls call CheckForUseOfClassInAllTex(expand('%:t:r'))


fu CreatePdfFromTex(absoluteTexPath)
    let directory        = fnamemodify(a:absoluteTexPath, ':p:h')
    let withoutExtension = fnamemodify(a:absoluteTexPath, ':p:r')

    silent execute '!pdflatex -output-directory=' . directory . ' ' . a:absoluteTexPath
    silent execute '!open ' . withoutExtension . '.pdf'
endfu

fu CheckForUseOfClassInAllTex(className)
    let allTexPaths = split(globpath('%:p:h', '**/*.tex'), '\n')

    for texPath in allTexPaths
        let searchFor    = "documentclass.*{" . a:className . "}"
        let searchedFile = EscapeSpaces(texPath)

        redir => searchResult
            silent execute '!grep -q "' . searchFor . '" ' . searchedFile
        redir end

        if match(searchResult, 'shell returned 1') < 0
            call CreatePdfFromTex(searchedFile)
        endif
    endfor
endfu

fu EscapeSpaces(string)
    return substitute(a:string, ' ', '\\ ', 'g')
endfu
