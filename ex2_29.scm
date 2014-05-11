#lang scheme

(define (atom? x)
  (not (pair? x)))

(define (equal? x y)
  (cond ((and (atom? x)
              (atom? y)
              (eq? x y))
         true)
        ((and (not (atom? x))
              (not (atom? y))
              (equal? (car x) (car y))
              (equal? (cdr x) (cdr y)))
         true)
        (else false)))

(equal? '(this is a list) '(this is a list))
         