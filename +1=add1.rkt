#lang pie

(claim + (-> Nat Nat Nat))

(define +
  (lambda (n j)
    (iter-Nat n
      j
      (lambda (n-1)
        (add1 n-1)))))

(claim +1=add1
       (Pi ((n Nat))
           (= Nat (+ 1 n) (add1 n))))

(define +1=add1
  (lambda (n)
    (same (add1 n))))
