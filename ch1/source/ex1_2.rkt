#lang planet neil/sicp
;Exercise 1.2
;http://ice-web.cc.gatech.edu/ce21/1/static/audio/static/pythonds/BasicDS/InfixPrefixandPostfixExpressions.html

(define (following-expression)
  (/ (+ 5
        (+ 4
           (- 2
              (- 3
                 (+ 6
                    (/ 4 5)))))
     (* 3
        (* (- 6 2)
           (- 2 7))))))

(following-expression)