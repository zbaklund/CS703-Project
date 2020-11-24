#lang racket


;brute force sudoku solver
(define (SolveSudoku sentboard)

  (define (subgrid brd r c)                     ; subfn to get subgrid:
    ;(define L '((0 1 2)(3 4 5)(6 7 8)))
    (define L '((0 1)(2 3)))
    (define-values (rr cc)
      (values (flatten(filter (lambda(x)(member r x)) L))   ; get the row set
              (flatten(filter (lambda(x)(member c x)) L)))) ; get the column set
    (for*/list ((i rr)(j cc))          ; get list of numbers in these rows & columns
      (list-ref (list-ref brd i) j)))

  ; start with sentboard and first row and column: 
  (let loop ((bd sentboard) (r 0) (c 0))
    (let ((next (lambda (nextbd)                     ; subfn to go to next column/row:
                  ;(cond [(< c 8)  (loop nextbd r (add1 c) )]
                  (cond [(< c 3) (loop nextbd r (add1 c) )]
                        ;[(< r 8)  (loop nextbd (add1 r) 0 )]
                        [(< r 3) (loop nextbd (add1 r) 0 )]
                        [else (displayln "SOLUTION:")
                              (for ((rowline nextbd)) 
                                (println rowline))
                              ;(exit) can be added here to stop at first solution.
                             ]))))
                        ;;; [else (call-with-output-file )
                        ;;;     ]
      (if (= 0 
             (list-ref (list-ref bd r) c))     ; cell value: if 0, try numbers 1-9:  
          (begin (for ((i (range 1 5)));(range 1 10)))
                   (when(not(or    ; number should not be in row/column/subgrid:
                             (member i (list-ref bd r))               ; row
                             (member i (map (lambda(x)(list-ref x c)) bd)) ; column
                             (member i (subgrid bd r c))))            ; subgrid
                     (define newbd              ; put number i at this site:
                       (list-set bd r
                                 (list-set (list-ref bd r) c i)))
                     (next newbd)))) 
          (next bd)))))

(define board                   
;;;   '((0 0 3 0 2 0 6 0 0)
;;;     (9 0 0 3 0 5 0 0 1)
;;;     (0 0 1 8 0 6 4 0 0)
;;;     (0 0 8 1 0 2 9 0 0)
;;;     (7 0 0 0 0 0 0 0 8)
;;;     (0 0 6 7 0 8 2 0 0)
;;;     (0 0 2 6 0 9 5 0 0)
;;;     (8 0 0 2 0 3 0 0 9)
;;;     (0 0 5 0 1 0 3 0 0)))
    '((4 0 0 0)
      (0 1 0 0)
      (0 2 1 0)
      (1 0 0 0)))

;;; (SolveSudoku board)
(apply SolveSudoku (list board))
(define fromboard (apply SolveSudoku (list board)))
(index* fromboard )