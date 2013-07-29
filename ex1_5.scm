(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))
(test 0 (p))
; applicative-order evaluation: evaluate the arguments and then apply
; normal-order evaluation: fully expand and then reduce
; in this example, if the interpreter is applicative-order evaluation, it will evaluate (p) immediately, so it falls into infinite loop. 
; if the interpreter is normal-order evaluation, it will simply return 0, as the condition is true, so (p) is not evaluated.