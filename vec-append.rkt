#lang pie

(claim + (-> Nat Nat Nat))

  (define +
   (λ (n j)
    (iter-Nat n
     j
     (λ (n-1)
      (add1 n-1)))))


  (claim mot-vec-append
   (Π ((E U)
       (j Nat)
       (k Nat))
    (-> (Vec E k)
     U)))

  (define mot-vec-append
   (λ (E j k)
    (λ (es)
     (Vec E (+ k j)))))

  (claim step-vec-append
   (Π ((E U)
       (j Nat)
       (k Nat)
       (e E)
       (es (Vec E k)))
    (→ (mot-vec-append E j k es)
     (mot-vec-append E j (add1 k) (vec:: e es)))))

  (define step-vec-append
   (λ (E j k e es)
    (λ (vec-append-es)
     (vec:: e vec-append-es))))


  (claim vec-append
   (Π ((E U)
        (l Nat)
        (j Nat))
    (→ (Vec E l) (Vec E j)
     (Vec E (+ l j)))))

  (define vec-append
   (λ (E l j)
    (λ (es end)
     (ind-Vec l es
      (mot-vec-append E j)
      end
      (step-vec-append E j)))))

  (claim mot-vec->list
   (Π ((E U)
       (l Nat))
    (→ (Vec E l)
     U)))

  (define mot-vec->list
   (λ (E l)
    (λ (es)
     (List E))))

  (claim step-vec->list
   (Π ((E U)
       (k Nat)
       (e E)
       (es (Vec E k)))
    (→ (mot-vec->list E k es)
     (mot-vec->list E (add1 k) (vec:: e es)))))

  (define step-vec->list
   (λ (E k e es)
    (λ (vec->list-es)
     (:: e vec->list-es))))


  (claim vec->list
   (Π ((E U)
       (l Nat))
    (→ (Vec E l)
     (List E))))

  (define vec->list
   (λ (E l)
    (λ (es)
     (ind-Vec l es
      (mot-vec->list E)
      nil
      (step-vec->list E)))))

;(claim vec=list
;       (Pi ((E U)
;            (es (List E)))
;           (= (List E)
;              es
;              (list->vec E (vec->list E l es)))))
