
(claim mot-list->vec->list=
       (Π ((E U)
              (-> (List E)
                 U))))

(define mot-list->vec->list=
  (λ (E)
     (λ (es)
        (= (List E) es
           (vec->list E (length E es) (list->vec E es))))))

(claim cons-x
       (Π ((E U))
       (-> E (List E)
           (List E))))

(define cons-x
  (λ (E)
     (λ (e es) (:: e es))))

(claim step-list->vec->list=
       (Π ((E U)
           (e E)
           (es (List E)))
          (-> (mot-list->vec->list E es)
                (mot-list->vec->list E (:: e es)))))

(define step-list->vec->list=
  (λ (E e es)
     (λ (lvl=es)
        (cong lvl=es (cons-x E e)))))


(claim list->vec->list=
       (Π ((E U)
              (es (List E)))
          (= (List E)
             es
             (vec->list E (length E es) (list->vec E es))))


(define list->vec->list=
  (λ (E es)
     (ind-List es
               (mot-list->vec->list= E)
               (same nil)
               (step-list->vec->list= E))))


(claim equal-lengths
  (Π ((E U)
         (l1 (List E))
         (l2 (List E)))

     (-> (= (List E) l1 l2)
         (= Nat (length E l1) (length E l2)))))

(define equal-lengths
  (λ (E)
     (λ (l1 l2 l1=l2)
        (cong l1=l2 (length E)))))


