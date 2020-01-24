#lang planet neil/sicp

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) 0)
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10)
(A 2 4)
(A 3 3)

(define (f n) (A 0 n))
; 2n
(define (g n) (A 1 n))
; 2^n
(define (h n) (A 2 n))
; 2^2^2... => 2^(h(n-1))
(define (k n) (* 5 n n))
; 5n^2

; see also : http://mathworld.wolfram.com/AckermannFunction.html

; see also : primitive recursive functions & total recursive functions
;   > https://math.stackexchange.com/questions/96483/ackermann-function-primitive-recursive


; primitive recursive are a subset of total recursive functions.
; * Partial recursive functions 
;   > an algorithm which only works on some inputs

; * Total recursive functions 
;   > an algorithm which works on all inputs
;   > **but can take an arbitrarily long time to compute**

; * Primitive recursive functions
;   > an algorithm that completes in a knowable time
;   > ("not too long" for some theoretic definition of long)
;   * a primitive recursive function can be computed
;     by a sequence of elementary computations
;     > where there is a way to bound the running time at every step.
;   * only form of primitive recursion
;     > where a function calls itself on a smaller argument
;   * primitive recursions can be reduced to only giving definitions
;     * f(0) : not involving f
;     * f(n+1) : as a function of f(n)

; Ackermann function is not in primitive recursive form.
;  > The definition of the "Ackermann function" contains the
;  > clause A(m + 1, n + 1) = A(m, A(m + 1, n)
;  > The "next" value of the function (going from n to n + 1)
;  > depends on calls with larger parameters (starting with A(m + 1, n))
