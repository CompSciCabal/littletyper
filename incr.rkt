#lang pie

(claim + (-> Nat Nat Nat))

(define +
  (lambda (n j)
    (iter-Nat n
      j
      (lambda (n-1)
        (add1 n-1)))))

(claim incr
       (-> Nat Nat))

(define incr
  (lambda (n)
    (iter-Nat n
              1
              (+ 1))))

(claim base-incr=add1
       (= Nat (incr zero) (add1 zero)))

(define base-incr=add1
  (same (add1 zero)))

(claim mot-incr=add1
       (Pi ((n-1 Nat))
           U))

(define mot-incr=add1
  (lambda [n-1]
    (= Nat (incr n-1) (add1 n-1))))

(claim step-incr=add1
       (Pi ((n-1 Nat))
           (-> (mot-incr=add1 n-1)
               (mot-incr=add1 (add1 n-1)))))

(define step-incr=add1
  (lambda [n-1]
    (lambda (x)
      ;(cong x (lambda (y) (add1 y)))
      (cong x (+ 1))
      ;(cong x add1)
      )))


(claim incr=add1
       (Pi ((n Nat))
           (= Nat (incr n) (add1 n))))

(define incr=add1
  (lambda (n)
    (ind-Nat
      n
      mot-incr=add1
      base-incr=add1
      step-incr=add1)))

;(base-incr=add1)
;(incr=add1 4)
