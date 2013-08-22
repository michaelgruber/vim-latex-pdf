autocmd BufWritePost *.tex call CreatePdf()

fu CreatePdf()
    silent !pdflatex -output-directory=%:p:h %:p
    silent execute '!open ' . '%:p:r' . '.pdf'
endfu
