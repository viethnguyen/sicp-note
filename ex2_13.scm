#lang scheme

(define (intmul x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                 (max p1 p2 p3 p4))))

(define (intdiv x y)
  (if (<= (* (upper-bound y) (lower-bound y)) 0)
      (error "Division error (interval spans 0)" y)
      (intmul x 
               (make-interval (/ 1 (upper-bound y))
                              (/ 1 (lower-bound y))))))

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

(define (print-center-percent name i)
  (newline)
  (display name)
  (display ": ")
  (display (center i))
  (display ",")
  (display (percent i)))
  
(define A (make-center-percent 8 0.001))
(define B (make-center-percent 15 0.001))
(print-interval "A/A" (intdiv A A))
(print-interval "A/B" (intdiv A B))
(newline)
(print-center-percent "A/A" (intdiv A A))
(newline)
(print-center-percent "A/B" (intdiv A B))