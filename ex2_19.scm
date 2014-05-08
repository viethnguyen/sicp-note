#lang scheme
(define (square-list1 x)
  (define (iter list answer)
    (if (null? list)
        answer
        (iter (cdr list)
              (cons (square (car list))
                    answer))))
  (iter x null))

(define (square-list2 x)
  (define (iter list answer)
    (if (null? list)
        answer
        (iter (cdr list)
              (cons answer
                    (square (car list))))))
  (iter x null))

(define (square x)
  (* x x))

(define 1-through-4 (list 1 2 3 4))

(square-list1 1-through-4) 
; reverse order because 