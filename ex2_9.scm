#lang scheme

(define (intmul x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                 (max p1 p2 p3 p4))))

(define (intdiv x y)
  (if (>= 0 (* (upper-bound y) (lower-bound y)))
      (error "Division error (interval spans 0)" y)
      ((intmul x 
               (make-interval (/ 1 (upper-bound y))
                              (/ 1 (lower-bound y)))))))

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

(define i (make-interval 2 7))
(define j (make-interval 3 4))
(define k (make-interval -1 2))

(print-interval "i" i)
(print-interval "j" j)
(print-interval "k" k)
(print-interval "i/k" (intdiv i k)) 
                  
