#lang racket

; testing random for making holes

(define (test-func) 
    (for ([i 4])
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
(list-set testlist 0 (list-set (list-ref testlist 0) 0 0))