#lang scheme

;; Not working ... 
(define my-tree (cons (list 1 2) (list 3 4)))

(define (fringe tree)
  (define nil '())
  (define (build-fringe x result)
    (cond ((null? x) result)
          ((not (pair? x)) (cons x result))
          (else (build-fringe (car x)
                              (build-fringe (cdr x) result)))))
  (build-fringe tree nil))

(fringe my-tree)