#lang racket
(require math/array)
; a board class

(define soduku% (class object%
                  (init size)
                  (define dim size)
                  ; grid size = square root of dimension
                  (define grid (sqrt size))
                  (define board (array->mutable-array (index-array (make-vector 2 size))))
                  (define isValid "unknown")
                  (super-new)
                   ;methods
                  (define/public (get-dim)
                    dim)
                  
                  (define/public (get-board)
                    board)
                                      
                  (define/public (get-cell row col)
                    (array-ref board (vector row col)))
                  
                  (define/public (set-cell row col val)
                    (array-set! board (vector row col) val))
                  
                  (define/public (valid lines)
                    (let ([valid #t])
                    (for ([row lines])
                     #:break (not valid)
                      (set! valid (and valid (equal? (vector-sort (list->vector (array->list row)) <) (range dim)))))
                     valid))

                  (define/public (valid-board)
                    (define cols (sequence->list (in-array-axis board 1)))
                    (define rows (sequence->list (in-array-axis board)))
                    (if (equal? isValid "unknown") (and (send this valid rows) (send this valid cols)) isValid))))

                   
            
                   
                


  

(define b (new soduku% [size 4]))
(send b get-board)
(send b get-cell 2 2)
(send b set-cell 2 2 -1)
(send b get-cell 2 2)
(send b get-board)

(send b valid-board)
