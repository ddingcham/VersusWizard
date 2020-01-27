#lang planet neil/sicp
; Example: Counting change
; How many different ways can we make change of $ 1.00,
; given half-dollars, quarters, dimes, nickels, and pennies?

; More generally, any given amount of money
; > This problem has a simple solution as a recursive procedure

; The number of ways to change amount 'a' using 'n' kinds of coins equals
;  * the number of ways to change amount 'a' using all but the first kind of coin
;    > do not use any of the first kind of coin

;  plus

;  * the number of ways to change amount 'a' - 'd' using all n kinds of coins
;    > where 'd' is the denomination of the first kind of coin
;    > do use any of the first kind of coin

;  * Therefore, the total number of ways to make change for some amount
;    is equal to the number of ways to make change for the amount without using
;    any of the first kind of coin, plus the number of ways to make change assuming
;    that we do use the first kind of coin
;    **But the latter number is equal to the number of ways to make change for the amount
;      that remains after using a coin of the first kind**



; Consider the reduction rule carefully,
; and convince yourself that we can use it describe an algorithm
; if we specify the following degenerate cases.

; * a == 0 -> 1 way
; * a < 0  -> 0 ways
; * n == 0 -> 0 ways

(define (count-change amount)
  (cc amount 5))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
; 1: cent, 5 : nickel, 10 : dime, 25 : quarter, 50 : half-dollars
; Here we are thinking of the coins as arranged in order from largest to smallest,
; but any order would do as well
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(count-change 100)
        