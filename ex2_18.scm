#lang scheme
(define (square-list x)
  (if (null? x)
      x
      (cons (square (car x))
            (square-list (cdr x)))))

(define (square x)
  (* x x))

(define 1-through-4 (list 1 2 3 4))

(square-list 1-through-4)