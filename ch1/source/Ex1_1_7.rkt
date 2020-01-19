#lang planet neil/sicp
;1.1.7 Square Roots by Newton's Method

;"There is an important difference between mathematical functions and computer procedures"
;-> Procedures must be effective

;who tell us how to actually find the square root of a given number.

;think why explain with this order
(define (square x)
  (* x x))

(define (abs x)
  (if (> x 0) x (- x)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)