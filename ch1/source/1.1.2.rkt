#lang planet neil/sicp

;abs
;|r| = r if r > 0
;      0 if r == 0
;      -r if r < 0
; (cond (<p1> <e1>)
;       (<pn> <en>))
(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))
(define (abs-edge-first x)
  (cond ((< x 0) (- x))
        (else x)))
; (if <predicate> <consequent> <alternative>)
; predicate evaluates true -> consequent / otherwise alternative
(define (abs-if x)
  (if (< x 0)
      (- x)
      x))

(abs -2)
(abs-edge-first -2)
(abs-if -2)

