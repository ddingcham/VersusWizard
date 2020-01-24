#lang planet neil/sicp

; should debug

; recursive procedure : recursive process
(define (recursive_plus a b)
  (if (= a 0)
      b
      (inc (recursive_plus (dec a) b))))

(recursive_plus 4 5)

; recursive procedure : iterative process : tail-recursion
(define (iterative_plus a b)
  (if (= a 0)
      b
      (iterative_plus (dec a) (inc b))))

(iterative_plus 4 5)