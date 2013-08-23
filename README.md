# vim-latex-pdf

Inspired by [vim-instant-markdown](https://github.com/suan/vim-instant-markdown), though admittedly, not so instant.

- Just runs `pdflatex` when you write to a `.tex` file and opens the resulting PDF.
- Also, when writing to a `.cls`, finds all `.tex` files referencing that class and PDF/opens them.

## Installation

### Using [Pathogen](https://github.com/tpope/vim-pathogen)

    cd ~/.vim/bundle
    git clone https://github.com/michaelgruber/vim-latex-pdf.git
    
OR with git submodules:

    git submodule add https://github.com/michaelgruber/vim-latex-pdf.git ./.vim/bundle/vim-latex-pdf
    
## Requirements

- Needs access to the `pdflatex` command. For Mac users, you can get this by installing the [MacTeX](http://www.tug.org/mactex/) package.

## Disclaimers

- I've only tested this with **Vim 7.4a** and **Bash 3.2.48** on **OS X 10.8**.
- Will open the PDFs using the system default reader.
- It seems Adobe Reader needs to be closed in order to see the changes made.
- I use Chrome, but it opens a new tab for each save, which is annoying.
    
## License

Copyright &copy; 2013 Michael Gruber

Distributed under the same [terms](http://vimdoc.sourceforge.net/htmldoc/uganda.html#license) as Vim. See `:help license`.
