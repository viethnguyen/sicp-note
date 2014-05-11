#lang scheme
;; ex 2_27.scm
(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch m) (car m))
(define (right-branch m) (car (cdr m)))
(define (branch-length b) (car b))
(define (branch-structure b) (car (cdr b)))
(define (is-mobile? s) (pair? s))


(define (branch-weight branch)
  (let ((s (branch-structure branch)))
    (if (is-mobile? s)
        (total-weight s)
        s)))

(define (total-weight m)
  (+ (branch-weight (left-branch m))
     (branch-weight (right-branch m))))

 ;; A test mobile: 
 ;; Level 
 ;; ----- 
 ;; 3                   4  |    8                                      
 ;;              +---------+--------+ 2                        
 ;; 2         3  |  9                                        
 ;;        +-----+----+ 1                                    
 ;; 1    1 | 2                                       
 ;;    +---+---+                             
 ;;    2       1                             
  
 (define level-1-mobile (make-mobile (make-branch 1 2) 
                                     (make-branch 2 1))) 
 (define level-2-mobile (make-mobile (make-branch 3 level-1-mobile) 
                                     (make-branch 9 1))) 
 (define level-3-mobile (make-mobile (make-branch 4 level-2-mobile) 
                                     (make-branch 8 2))) 
  
 (total-weight level-1-mobile) 
 (total-weight level-2-mobile) 
 (total-weight level-3-mobile) 

(define (is-balanced? m)
  (let ((left (left-branch m))
        (right (right-branch m)))
    (and (= (branch-torque left)
            (branch-torque right))
         (branch-balaned? left)
         (branch-balaned? right))))

(define (branch-torque branch)
  (* (branch-weight branch)
     (branch-length branch)))

(define (branch-balaned? branch)
  (let ((s (branch-structure branch)))
    (if (structure-is-mobile? s)
        (is-balanced? s)
        true)))

