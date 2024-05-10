#lang pie

(define also-rec-Nat
  (lambda (X)
    (lambda (target base step)
      (ind-Nat
        target
        (lambda (n) X)
        base
        step))))

(claim mot-last
       (Pi ((E U)
            (k Nat))
           (-> (Vec E (add1 k))
               E)))

(define mot-last
  (lambda (E)
    (lambda (k)
      (-> (Vec E (add1 k))
          E))))
