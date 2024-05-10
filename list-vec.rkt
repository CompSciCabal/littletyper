#lang pie

(claim mot-replicate
  (-> U Nat
    U))

(define mot-replicate
  (lambda (E)
    (lambda (l)
      (Vec E l))))

(claim step-replicate
  (Pi ((E U)
       (e E)
       (l-1 Nat))
    (-> (mot-replicate E l-1)
      (mot-replicate E (add1 l-1)))))

(claim list->vec
       (Pi ((E U))
           (-> (List E)
               (Sigma ((l Nat))
                      (Vec E l)))))

(claim step-list->vec
       (Pi ((E U))
           (-> E (List E) (Sigma ((l Nat))
                                 (Vec E l))
               (Sigma ((l Nat))
                      (Vec E l)))))

(define step-list->vec
  (lambda (E)
    (lambda (e es list->vec-es)
      (cons (add1 (car list->vec-es))
            (vec:: e (cdr list->vec-es))))))


(define list->vec
  (lambda (E)
    (lambda (es)
      (rec-List es
                (the (Pair Nat (Vec E 0)) (cons 0 vecnil))
                (step-list->vec E)))))


