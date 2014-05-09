#lang scheme

(define (mapcar f x)
  (if (null? x)
      null
      (cons (f (car x))
            (mapcar f (cdr x)))))

(define (square x)
  (* x x))

(define 1-through-4 (list 1 2 3 4))

(mapcar square 1-through-4)