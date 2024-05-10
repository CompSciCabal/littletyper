#lang pie

(claim rest
       (Pi ((E U)
            (l Nat))
           (-> (Vec E (add1 l))
               (Vec E l))))

(define rest
  (lambda (E l)
    (lambda (es)
      (tail es))))

(rest Atom 1 (vec:: 'a (vec:: 'b vecnil)))
