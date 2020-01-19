#lang planet neil/sicp
;exercise 1.3
(define (square x)
  (* x x))

(define (small x y)
  (if (< x y) x y))

(define (smallest x y z)
  (small (small x y) z))

(define (sumOfMaximumTwo x y z)
  (- (+ (square x) (square y) (square z))
     (square(smallest x y z))))

(sumOfMaximumTwo 2 1 2)