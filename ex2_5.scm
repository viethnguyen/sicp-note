#lang scheme

; Church numerals 

(define zero (lambda (f) (lambda (x) x)))

(define (1+ n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;(1+ zero)
;-> (lambda (f) (lambda (x) (f ((zero f) x))))
;-> (lambda (f) (lambda (x) (f (((lambda (f2) (lambda (x2) x2)) f) x))))
;-> (lambda (f) (lambda (x) (f ((lambda (x2) x2) x))))
;-> (lambda (f) (lambda (x) (f x)))

(define one (lambda (f) (lambda (x) (f x))))

;(1+ one)
; -> (lambda (f) (lambda (x) (f ((one f) x))))
; -> (lambda (f) (lambda (x) (f (lambda (x) (f x)) x)))
; -> (lambda (f) (lambda (x) (f (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define (add  a b)
  (lambda (f)
    (lambda (x)
      ((a f) ((b f) x)))))

(define (square x)
  (* x x))

(((add two zero) square) 2)