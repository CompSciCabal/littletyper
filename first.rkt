#lang pie

(claim first
       (Pi ((E U)
            (l Nat))
           (-> (Vec E (add1 l))
               E)))

(define first
  (lambda (E l)
    (lambda (es)
      (head es))))

(first Atom 1 (vec:: 'a (vec:: 'b vecnil)))
