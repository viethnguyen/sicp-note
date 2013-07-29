(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
		 x)))
(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2 ))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (sqrt x)
  (sqrt-iter 1.0 x))

;when Alyssa attempts to use new-if to compute square roots, an error is reported: Aborting! maximum recursion depth exceeded
;reason: try to expand the sqrt-iter:
;((cond ((good-enough? guess x) guess)
;       (else (sqrt-iter (improve guess x)
;			x))))
; can you see it? 
; new-if will cause an infinite loop by repeatedly calling itself, even when the guess is good enough.
; if is a special form, it evaluates its then-clause part only if the predicate is true, and its else-clause part only if the predicate is false