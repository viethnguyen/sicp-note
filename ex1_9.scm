(define (inc x)
  (+ x 1))
(define (dec x)
  (- x 1))

(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))
;; ==> recursive process, because of series of deferred inc operation

(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))
;; ==> iterative process, because the process does not grow and shrink