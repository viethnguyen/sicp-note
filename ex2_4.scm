#lang scheme

(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

(define (cons x y)
  (* (expt 2 x)
     (expt 3 y)))

(define (car z)
  (if (= (modulo z 2) 1)
      0
      (+ 1 (car (/ z 2)))))

(define (cdr z)
  (if (= (modulo z 3) 0)
      (+ 1 (cdr (/ z 3)))
      0))

(car (cons 2 4))

(cdr (cons 10 11))
