# Structure and Interpretation of Computer Programs

## 1.2.2 Tree Recursion

#### Another common pattern of computation is called "tree recursion".

### Fibonacci numbers  
```
Fib(n) = 0                       if n = 0
         1                       if n = 1
         Fib(n - 1) + Fib(n - 2) otherwise
```

* definition into a recursive procedure with recursive process  
  ```
  (define (fib n)
    (cond ((= n 0) 0)
          ((= n 1) 1)
          (else (+ (fib (- n 1))
                   (fib (- n 2))))))
  ```
  > the evolved process looks like a tree (split into two at each level / except at the bottom)  
  > It is terrible way to compute Fibonacci numbers because it does so much redundant computation
  
* golden ratio  
  > see also : [general term for the Fibonacci sequence](https://www.quora.com/What-is-the-general-term-for-the-Fibonacci-sequence)  
  ```
  𝜙 = (1+√5) / 2
  // 𝜙 ^ 2 = 𝜙 + 1
  ```
  
* definition into a recursive procedure with iterative process  
  > repeatedly like  a = a + b then b = a
  ```
  (define (fib n)
    (fib-iter 1 0 n))
    
  (define (fib-iter a b count)
    (if (= count 0)
        b
        (fib-iter (+ a b) a (- count 1))))
  ```
  * linear iteration  
  * no tree-recursive  
  
 * When we consider processes that operate on hierarchically structured data "rather than numbers"  
   we will find that tree recursion is a natural and powerful tool.  
   But even in numerical operations, **tree-recursive processes can be useful in helping us to understand and design programs**  
   
