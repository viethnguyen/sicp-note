#lang scheme
(define (reverse x)
  (if (null? x)
      x
      (append (reverse (cdr x)) (list (car x)))))

(define squares (list 1 4 9 16 25))

(reverse squares)