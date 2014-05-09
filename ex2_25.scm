#lang scheme

(define (deep-reverse x)
  (cond ((null? x) null)
        ((atom? x) x)
        (else (append (deep-reverse (cdr x)) (list (deep-reverse(car x)))))))

(define (countatoms x)
  (cond ((null? x) 0)
        ((atom? x) 1)
        (else (+ (countatoms (car x))
                 (countatoms (cdr x))))))

(define (atom? x)
  (not (pair? x)))

(define x (cons (list 1 2 ) (list 3 4)))

(countatoms x)
  
(deep-reverse x)