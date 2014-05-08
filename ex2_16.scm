#lang scheme
(define (last x)
  (if (null? (cdr x))
      x
      (last (cdr x))))

(define squares (list 1 4 9 16 25))

(last squares)