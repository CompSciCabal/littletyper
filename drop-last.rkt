#lang pie

(claim base-drop-last
       (Pi ((E U))
           (-> (Vec E (add1 zero))
               (Vec E zero))))

(define base-drop-last
  (lambda (E)
    (lambda (es)
      vecnil)))

(claim mot-drop-last
       (-> U Nat
           U))

(define mot-drop-last
  (lambda (E)
    (lambda (k)
      (-> (Vec E (add1 k))
          (Vec E k)))))

(claim step-drop-last
       (Pi ((E U)
            (l-1 Nat))
           (-> (mot-drop-last E l-1)
               (mot-drop-last E (add1 l-1)))))

(define step-drop-last
  (lambda (E l)
    (lambda (f-1)
      (lambda (es)
        (vec:: (head es) (f-1 (tail es)))))))

(claim drop-last
       (Pi ((E U)
            (k Nat))
           (-> (Vec E (add1 k))
               (Vec E k))))

(define drop-last
  (lambda (E l)
    (lambda (es)
      ((ind-Nat
         l
         (mot-drop-last E)
         (base-drop-last E)
         (step-drop-last E))
       es))))

(drop-last Atom 2 (vec:: 'a (vec:: 'b (vec:: 'c vecnil))))
