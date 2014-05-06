#lang scheme

(define (make-center-percent c p)
  (center-width c  (* c p)))

(define (percent x)
  (/ (width x)
     (center x)))
   
(define (center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

    
(define (make-interval a b) (cons a b))

(define (lower-bound x) (car x))

(define (upper-bound x) (cdr x))

(define (print-interval name i)
  (newline)
  (display name)
  (display ": [")
  (display (lower-bound i))
  (display ",")
  (display (upper-bound i))
  (display "]"))

(define x (make-center-percent 8 0.1))

(print-interval "x" x)

(newline)
(display (percent x))