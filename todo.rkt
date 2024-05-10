#lang pie

(claim peas
       (Pi ((n Nat))
           (Vec Atom n)))

(define peas
  (lambda (n)
    (ind-Nat n
             (lambda (k)
               (Vec Atom k))
             vecnil
             (lambda (n-1 peas-of-n-1)
               (vec:: 'pea peas-of-n-1)))))

(peas 3)
