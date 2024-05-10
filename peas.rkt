#lang pie

(claim peas
       (Pi ((l Nat))
           (Vec Atom l)))

(claim peas-step
       (Pi ((l Nat)
            (v (Vec Atom l)))
           (Vec Atom (add1 l))))

(define peas-step
  (lambda (l v)
    (vec:: 'pea v)))

;(define peas
;  (lambda (l)
;    (rec-Nat
;      l
;      vecnil
;      peas-step)))

(peas-step 1 (peas-step 0 vecnil))
