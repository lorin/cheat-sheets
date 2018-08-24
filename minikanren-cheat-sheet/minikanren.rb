cheatsheet do
    title 'minikanren'
    docset_file_name 'minikanren'
    keyword 'minikanren'
    category do
        id 'Racket'
        entry do
            name 'Install package via Dr. Racket'
            notes <<-'END'
            ```
            File -> Install Package... -> faster-minikanren
            ```
            END
        end
        entry do
            name 'Import statements'
            notes <<-'END'
            ```racket
            #lang racket
            (require minikanren)
            (require minikanren/numbers) ; only if you need numbers
            
            ```
            END
        end
        entry do
            name 'Helpers from Reasoned Schemer that aren\'t included'
            notes <<-'END'
            ```racket
            (define nullo
              (lambda (x) (== '() x)))

            (define caro
              (lambda (p a)
                (fresh (d)
                       (== (cons a d) p))))

            (define cdro
              (lambda (p d)
                (fresh (a)
                       (== (cons a d) p))))
              
            (define eq-caro
              (lambda (l x)
                (caro l x)))

            (define succeed (== #f #f))
             
            (define fail (== #f #t))

            (define membero
              (lambda (x l)
                (conde
                 ((nullo l) fail)
                 ((eq-caro l x) succeed)
                 (succeed 
                  (fresh (d)
                         (cdro l d)
                         (membero x d))))))
            ```
            END
        end
        entry do
            name 'Math stuff'
            notes <<-'END'
            ```racket
            ; + -> pluso
            ; * -> *o
            
            ; Example:
            ; a,b,c,d -> 1000*a + 100b + 10c + d
            (define from-digits 
              (lambda (a b c d abcd)
                (let ((ten (build-num 10))
                      (hundred (build-num 100))
                      (thousand (build-num 1000)))
                  (fresh (a000 b00 c0 ab00 cd)
                    (*o thousand a a000)
                    (*o hundred b b00)
                    (*o ten c c0)
                    (pluso a000 b00 ab00)
                    (pluso c0 d cd)
                    (pluso ab00 cd abcd)))))
            ```
            END
        end
    end
end
