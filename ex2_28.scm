#lang scheme
(list 'a 'b 'c)
(list (list 'george))
(cdr '((x1 x2) (y1 y2)))
(cadr '((x1 x2) (y1 y2)))


(define (atom? x)
  (not (pair? x)))

(define (memq item x)
  (cond ((null? x) '())
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))

(car '(a short list))
(atom? (car '(a short list)))
(memq 'red '((red shoes) (blue socks)))
(memq 'red '(red shoes blue socks))

