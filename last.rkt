#lang pie


(claim mot-last
       (-> U Nat
           U))

(define mot-last
  (lambda (E)
    (lambda (k)
      (-> (Vec E (add1 k))
          E))))

(claim step-last
       (Pi ((E U)
            (l-1 Nat))
           (-> (-> (Vec E (add1 l-1))
                   E)
               (-> (Vec E (add1 (add1 l-1)))
                   E))))

(define step-last
  (lambda (E l-1)
    (lambda (f-1)
      (lambda (es)
        (f-1 (tail es))))))

(claim base-last
       (Pi ((E U))
           (-> (Vec E (add1 zero))
               E)))

(define base-last
  (lambda (E es)
    (head es)))

(claim last
       (Pi ((E U)
            (k Nat))
           (-> (Vec E (add1 k))
               E)))

(define last
  (lambda (E k es)
    ((ind-Nat
       k
       (mot-last E)
       (base-last E)
       (step-last E)) es)))


(last Atom 1 (vec:: 'a (vec:: 'b vecnil)))
