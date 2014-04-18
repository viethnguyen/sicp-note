(define (double x)
  (* x 2))
(define (halve x)
  (/ x 2))
(define (even? x)
  (= (remainder x 2) 0))
(define (fast-mult a b)
  (fast-mult-iter a b 0))
(define (fast-mult-iter a b c)
  (format #t "~% a = ~S, b = ~S, c = ~S" a b c)
  (cond ((= b 0) c)
	((even? b) (fast-mult-iter (double a) (halve b) c))
	(else (fast-mult-iter a (- b 1) (+ c a)))))
(fast-mult 2 4)