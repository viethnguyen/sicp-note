#lang scheme

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment s) (car s))

(define (end-segment s) (cdr s))

(define (make-point x y)
  (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (midpoint-segment s)
  (make-point (/ (+ (x-point (start-segment s))
                      (x-point (end-segment s))) 2)
              (/ (+ (y-point (start-segment s))
                      (y-point (end-segment s))) 2)))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;; Test 
(define p1 (make-point 0 0))
(define p2 (make-point 5 5))
(define seg (make-segment p1 p2))
(print-point (midpoint-segment seg))
