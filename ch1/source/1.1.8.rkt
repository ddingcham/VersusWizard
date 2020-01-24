#lang planet neil/sicp
;We could take any large program and divide it in parts
;It is crucial that each procedure accomplishes an identifiable task that can be used as a module in defining other procedures.

;[Procedural Abstraction] At this level of abstraction, any procedure that computes the square is equally good
;  able to regard the square procedure as a "black box".
;  : We are not at the moment concrened with "how" the procedure computes its result
; *User should not need to know how the procedure is implemented in order to use it*

;[Local names] The following procedures should not be distinguishable
;  (define (square x) (* x x))
;  (define (square y) (* y y))


;[Internal definitions and block structure]
;  The only procedure that is important to users of sqrt is "sqrt"
;  Localize the subprocedures // hiding them inside sqrt
;  > sqrt could coexist with other successive approximations : each having its own private good-enough?

; [Block structure] : nesting of definitions // solution to the simplest name-packaging problem.
;   information-hiding ?

;   [vol pre Block structure]
(define (sqrt x)
  (sqrt-iter 1.0 x))
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (improve guess x)
  (average guess (/ x guess)))

;   [vol1] basic Block structure
(define (sqrt x)
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess x)
    (average guess (/ x guess)))
  (define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))
  (sqrt-iter 1.0 x))

;   [vol2] Block structure applied lexical scoping
;     [Lexical scoping] ?? visibility/boundary of nested scopes ??
;      dictates that free variables in a procedure are taken to refer to bindings made by enclosing procedure definitions;
;       They are looked up in the environment in which the procedure was defined.
;       ref : [ch3] environments and the detailed behavior of the interpreter.
(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))


