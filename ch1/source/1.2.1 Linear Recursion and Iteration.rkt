#lang planet neil/sicp

; [1.2.1 Linear Recursion and Iteration]
;    > [see also]
;    >> https://blog.fupfin.com/?p=150
;    >> [Tail Call Optimization] https://stackoverflow.com/questions/310974/what-is-tail-call-optimization


; n! = .... = n(n-1)!

(define (recursion-factorial n)
  (if (= n 1)
      1
      (* n (recursion-factorial (- n 1)))))


(define (iteration-factorial n)
  (define (fact-iter product counter)
    (if (> counter n)
        product
        (fact-iter (* counter product)
                   (+ counter 1))))
  (fact-iter 1 1))

(recursion-factorial 5)
(iteration-factorial 5)


; **In "Shapes" of the two processes, we find that they evolve quite differently**
;   > Both compute the same mathematical function on the **same domain**
;   > Each requires a number of steps proportinoal to n to compute n!
;   > Both processes even carry out the same sequence of **multiplications**, obtaining the same sequence of **partial products**

;  * recursion-factorial
;    > reveals a shape of expansion followed by contraction.
;    * The 'expansion' occurs as the process builds up a chain of **deferred operations**.
;      > in this case, a chain of multiplications
;    * The 'contraction' occurs as the operations are acutally performed.
;    * This Type of process, **characterized by a chain of deferred operations, is called a "recursive process"**.
;    * **linear recursive process**
;      > Carrying out this process requires that the interpreter keep track of the operations to be performed later on
;        >> length of the chain of deferred multiplications
;        >> amount of information needed to keep track of it, grows linearly with n, just like the number of steps.

;  * iteration-factorial
;    > does not grow and shrink.
;      >> At each step, all we need to keep track of, for any n, // product, counter, max-count (changed with n)
;    * **Iterative process**
;    * In general, an iterative process is one whose state can be summarized by a fixed number of 'state variables'
;      > fixed rule that describes how the state variables should be updated as the process moves from state to state
;      > and condition that process should terminate
;    * **linear iterative process**
;      > the number of steps required grows linearly with n


; **Contrast between the two processes** : program variables
;  > who maintain some information to execute the process
;  > negotiating the chain of deferred operations
;  > **the longer the chain, the more information must be maintained.**

;  * iterative process
;    > the program variables provide complete description of the state of the process at any point.
;    > to supply the interpreter with the values of the three program variables.
;  * recursive process : additional "hidden information"
;    > it is maintained by the interpreter and not contained in the program variables


; **Don't confuse "recursive process" with "recursive procedure"**
;  > see also : https://vtorosyan.github.io/recursive-procedure-vs-process/
;  > Recursive procedure doesn’t necessarily result to recursive process.
;  > see also : tail recursion optimization

;  * procedure as recursive
;    > syntactic fact -> procedure itself (either directly or indirectly)
;
;  * process as recursive
;    > about how the "process evolves" not about the syntax of how a procedure is written.

;  * see "iteration-factorial"
;    * recursive procedure but really iterative process. (fact-iter)
;      > Its state is captured completely by its three state variables
;      > interpreter need keep track of **only three variables in order to execute the process**

;  * special iteration constructs with tail-recursive
;    ```
;    Some common languages(Ada, Pascal, C) are designed in such a way 
;    that the interpretation of any recursive procedure consumes an amount of memory that grows with the number of procedure calls
;    **even when the process described is, in principle, iterative**
;    ( these language can describe iterative processes only by resorting to sepcial-purpose : "looping constructs") : do, until, for, while ...
;    ```
;    > The implementation of Scheme we shall consider in ch5 does not share this defect.
;    > It will execute an iterative process in constant space, even if the iterative process is described by a recursive procedure
;    called **tail-recursive** : special iteration constructs are useful only as syntactic sugar.