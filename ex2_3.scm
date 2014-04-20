#lang scheme 

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z) 
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(display (car (cons 1 2)))

(display (cdr (cons 3 4)))

;; verify 
;;(car (cons x y))
;; = ((lambda (m) (m x y)) (lambda (p q) p))
;; = ((lambda ( p q ) p) x y)
;; = p