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
(square-list2 1-through-4)
; square-list1 reverses order because of the reverse cons operation
; square-list2 fixed that order but cons will make a list of two elements: a list and a normal element