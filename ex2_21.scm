#lang scheme

(define us-coins (list 50 25 10 5 1))

(define uk-coins (list 100 50 20 10 5 2 1 .5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? kinds-of-coins)) 0)
        (else (+ (cc (- amount (first-denomination kinds-of-coins))
                     kinds-of-coins)
                 (cc amount 
                     (except-first-denomination kinds-of-coins))))))

(define (except-first-denomination x)
  (if (null? x)
      null
      (cdr x)))

(define (first-denmination x)
  (if (null? x)
      null
      (car x)))

(define (no-more? x)
  (null? x))

(cc 100 us-coins)