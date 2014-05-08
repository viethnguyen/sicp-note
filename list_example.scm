#lang scheme

(define (nth n x)
  (if (= n 0)
      (car x)
      (nth (- n 1 )(cdr x))))

(define squares (list 1 4 9 16 25))

(nth 3 squares)

(define (length x)
  (if (null? x)
      0
      (+ 1 (length (cdr x)))))

(define (length2 x)
  (define (length-iter a count)
    (if (null? a)
        count 
        (length-iter (cdr a) (+ 1 count))))
  (length-iter x 0))

(define odds (list 1 3 5 7 9))

(length odds)

(length2 odds)

(define (append x y)
  (if (null? x)
      y
      (cons (car x) (append (cdr x) y))))

(append squares odds)