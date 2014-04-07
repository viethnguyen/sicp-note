;recursive version
(define (fast-exp-rec b n)
  (format #t "~% b = ~S, n = ~S" b n)
  (cond ((= n 0) 1)
	((even? n) (square (fast-exp-rec b (/ n 2))))
	(else (* b (fast-exp-rec b (- n 1))))))

;iterative version
(define (fast-exp b n)
  (fast-exp-iter b n 1))
(define (even? n)
  (= (remainder n 2) 0))
(define (fast-exp-iter b n a)
  (format #t "~%b = ~S, n = ~S, a = ~S" b n a)
  (cond ((= n 0) a)
	((even? n) (fast-exp-iter (* b b) (/ n 2) a))
	(else (fast-exp-iter b (- n 1) (* a b)))))
(fast-exp 2 10)


