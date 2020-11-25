#lang racket

; testing random for making holes

(define (test-func) 
    (for ([i 5])
        (displayln (random 4))))

(test-func)


(define testlist 
    '((4 0 0 0)
      (0 1 0 0)
      (0 2 1 0)
      (1 0 0 0)))

(list? testlist)
(first testlist)
(length testlist)
(list-ref (list-ref testlist 0) 0)
(println testlist)
(list-set testlist 1 (list-set (list-ref testlist 0) 0 1))

(for/list ([i '(1 2 3)]
    [j "abc"]
    #:when (odd? i)
    [k #(#t #f)])
(list i j k))

(define (set-cell lst idx val)
  (cond ((null? lst) '())
        ((zero? idx) (cons val (cdr lst)))
        (else (cons (car lst)
                    (set-cell (cdr lst) (sub1 idx) val)))))

(define (trimlist sl)
  (let ((num 0) (ss "") )
    (set! num (length sl))
    (for ((i num))
         (println i)
         (set! ss (list-ref sl i))
         (println ss)
         (set! ss (string-trim ss))
         (println ss)
         (set! sl (list-set sl i ss )) )
     sl ))

(trimlist (list " a" "b " " c "))