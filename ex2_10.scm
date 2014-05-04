#lang scheme


(define (intmul x y)
  (define (endpoint-sign i)
    (cond ((and (>= (upper-bound i) 0)
                (>= (lower-bound i) 0))
           1)
          ((and (< (upper-bound i) 0)
                (< (lower-bound i) 0))
           -1)
          (else 0)))
  
  (let ((es-x (endpoint-sign x))
        (es-y (endpoint-sign y))
        (x-up (upper-bound x))
        (x-lo (lower-bound x))
        (y-up (upper-bound y))
        (y-lo (lower-bound y))
        )
    (cond ((> es-x 0)
           (cond ((> es-y 0) 
                  (make-interval (* x-lo y-lo) (* x-up y-up))) 
                 ((< es-y 0) 
                  (make-interval (* x-up y-lo) (* x-lo y-up))) 
                 (else 
                  (make-interval (* x-up y-lo) (* x-up y-up))))) 
          
          ((< es-x 0) ;; both x endpoints are -ve 
           (cond ((> es-y 0) 
                  (make-interval (* x-lo y-up) (* x-up y-lo))) 
                 ((< es-y 0) 
                  (make-interval (* x-up y-up) (* x-lo y-lo))) 
                 (else 
                  (make-interval (* x-lo y-up) (* x-up y-lo))))) 
          
          (else  ;; x spans 0 
           (cond ((> es-y 0) 
                  (make-interval (* x-lo y-up) (* x-up y-up))) 
                 ((< es-y 0) 
                  (make-interval (* x-up y-lo) (* x-lo y-lo))) 
                 (else 
                  ;; Both x and y span 0 ... need to check values 
                  (make-interval (min (* x-lo y-up) (* x-up y-lo)) 
                                 (max (* x-lo y-lo) (* x-up y-up))))))))) 

    
    
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

