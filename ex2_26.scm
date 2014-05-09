#lang scheme

;; Not working ... 
(define my-tree (cons (list 1 2) (list 3 4)))

(define (fringe x)
  (define nil '())
  (if (null? x)
      nil
      (let ((first (car x)))
        (if (atom? x) 
            (cons first (fringe (cdr x)))
            (append (fringe first) (fringe (cdr x)))))))



(define (atom? x)
  (not (pair? x)))

(fringe (list 3))