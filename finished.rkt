#lang racket

; a board class

(define soduku% (class object%
                 (init size)
                 (define dim size)
                 (define board (make-vector size (make-vector size -1)))          
                 (define isFinished "unknown")
                 (define cols (apply vector-map vector (vector->list board)))
                 (super-new)
                 ; methods
                 (define/public (get-dim)
                   dim)
                 (define/public (get-board)
                   board)
                 (define/public (get-cols)
                   cols)
                 (define/public (get-cell row col)
                   (vector-ref (vector-ref board row) col))
                  
                 (define/public (valid-cols)
                   (let ([valid #t])
                   (for ([col cols])
                     #:break (not valid)
                     (set! valid (and valid (equal? (vector-sort col <) (range dim)))))
                   valid))
                 
                 (define/public (valid-rows)
                   (let ([valid #t])
                   (for ([row board])
                     #:break (not valid)
                     (set! valid (and valid (equal? (vector-sort row <) (range dim)))))
                   valid))

                 (define/public (finished)
                   (if (equal? isFinished "unknown") (and (send this valid-cols) (send this valid-rows)) isFinished))))

                   
                


  

(define b (new soduku% [size 4]))
(send b valid-cols)
(send b finished)

                 