#lang racket


;brute force sudoku solver
(define (SolveSudoku sentboard)
  (let ((arb 0))
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
                        ;;; [else (displayln "SOLUTION:")
                        ;;;       (for ((rowline nextbd)) 
                        ;;;         (println rowline))]
                              ;(exit) can be added here to stop at first solution.
                             ))))
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
                     ;return board
                     (set! sentboard newbd)
                     (next newbd)))) 
          (next bd)))))
    sentboard)

(define board                   
    '((4 0 0 0)
      (0 1 0 0)
      (0 2 1 0)
      (1 0 0 0)))


(define (replace-at positions orig-list val)
    (let ((row 0) (col 0))
    (for ([i (length positions)])
        (set! row (list-ref (list-ref positions i) 0))
        (set! col (list-ref (list-ref positions i) 1))
        ;;; (println (list row col))
        (set! orig-list (list-set orig-list row (list-set (list-ref orig-list row) col val)))
    ) orig-list))

;;; (define testboard                   
;;;     '((4 3 2 1)
;;;       (2 1 4 3)
;;;       (3 2 1 4)
;;;       (1 4 3 2)))

;n = number of random positions to find
;mx = max value for random in our case for 4x4 == 4
(define (random-pos n mx)
    (for/list ((i n))
        (append (list (random mx)(random mx)))))


;Find solved board
(define solved (SolveSudoku board))
(println "solved board ")
(println solved)

;Randomly take out holes
(define replace (random-pos 3 4))
(println "random positions for holes ")
(println replace)
(define random-holes (replace-at replace solved 0))
(println "solved board with holes taken out")
(println random-holes)

;Composition of holes and solved board
(define holes-and-solved (list random-holes solved))
(println "holes board and solved board composition")
(println holes-and-solved)