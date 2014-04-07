(load-option 'format)
(define count 0)
(define (cube x) (* x x x))
(define (p x)
  (set! count (+ count 1))
  (format #t "~%p ~S" x)
  (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (set! count 0)
   (if (not (> (abs angle) 0.1))
	  angle
	  (p (sine (/ angle 3.0)))))
       
(sine 12.15)

