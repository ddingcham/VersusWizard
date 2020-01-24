#lang planet neil/sicp
;exercise 1.5
;applicative-order evaluation : arg-value first -> ex : sicp
;  -> roop infinitely
;normal-order evaluation : procedure first -> ex : haskell
;see also : short-circuit evaluation, lazy-evaluation
;see also : https://courses.cs.washington.edu/courses/cse505/99au/functional/applicative-normal.pdf

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))