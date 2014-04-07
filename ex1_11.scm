;recursive
(define (f n)
  (cond ((< n 3) n)
	(else (+ (f (- n 1))
		 ((f (- n 2 )))
		 ((f (- n 3 )))))))
;iterative
(define (f n)
  (f-iter 3 2 1 n))
(define (f-iter a b c count)
  (if (= count 1)
      c
      (f-iter (+ a 
		 (* 2 b)
		 (* 3 c)) 
	      a
	      b
	      (- count 1))))
(f 2)

