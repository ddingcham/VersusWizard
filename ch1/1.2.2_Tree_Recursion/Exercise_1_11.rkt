#lang planet neil/sicp

; A function f is defined by the rule that
; f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3.


; Write a procedure that computes f by means of a recursive process.
(define (recursive-f n)
  (if (< n 3)
      n
      (+ (recursive-f (- n 1))
         (* 2 (recursive-f (- n 2)))
         (* 3 (recursive-f (- n 3))))))

(recursive-f 1)
(recursive-f 2)
(recursive-f 3)
(recursive-f 4)
(recursive-f 5)


; Write a procedure that computes f by means of an iterative process.
;(define (iterative-f n)
  ;(if (< n 3)