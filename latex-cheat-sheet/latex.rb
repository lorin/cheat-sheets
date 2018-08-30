cheatsheet do
    title 'latex'
    docset_file_name 'latex'
    keyword 'latex'
    category do
        id 'Citations & References'
        entry do
            name 'Cite a paper'
            command '\cite{entryname}'
        end
        entry do
            name 'Add a bibliography'
            notes <<-'END'
            If the file is called refs.bib:

            ```
            ...
            \bibliographystyle{IEEEtran}
            \bibliography{refs}
            \end{document}
            ```
            END
        end
        entry do
            name 'Reference another section'
            notes <<-'END'
            ```
            \section{Introduction} \label{introduction}
            ...
            \section{Later}
            As mentioned in section \ref{introduction}
            ```
            END
        end
    end
    category do
        id 'Figures'
        entry do
            name 'Column width sized figure'
            notes <<-'END'
            ```
            \begin{figure}[tbp]
            \includegraphics[width=\columnwidth]{img/myimage}
            \caption{My image}
            \label{fig-myimage}
            \end{figure}
            ```
            END
        end
    end
    category do
        id 'Formatting'
        entry do
            name 'Italics'
            command '\textit{text goes here}'
        end
        entry do
            name 'Footnote'
            command '\footnote{text goes here}'
        end
        entry do
            name 'Unordered list'
            notes <<-'END'
            ```
            \begin{itemize}
                \item Foo
                \item Bar
                \item Baz
                \item Quux
            \end{itemize}
            ```
            END
        end
    end
    category do
        id 'TeX Live'
        entry do
            name 'Binary location'
            notes <<-'END'
            ```
            /usr/local/texlive/2016basic/bin/x86_64-darwin
            ```
            END
        end
        entry do
            name 'Install a package'
            notes <<-'END'
            ```
            tlmgr install algorithmic
            ```
            END
        end
    end
    category do
        id 'Building'
        entry do
            name 'Simplest appraoch'
            notes <<-'END'
            ```
            pdflatex file.tex
            bibtex file
            pdflatex file.tex
            pdflatex file.tex
            ```
            END
        end
        entry do
            name 'LaTeX-Mk'
            notes <<-'END'
            Install LaTeX-Mk:

            ```
            brew install latex-mk
            ```

            Set up a makefile like this:

            ```
            NAME=filename  # without tex extension
            BIBTEXSRCS=refs.bib

            USE_PDFLATEX=1
            VIEWPDF=open

            include /usr/local/share/latex-mk/latex.gmk
            ```
            END
        end
    end
end
