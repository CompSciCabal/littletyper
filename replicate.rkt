#lang pie

(claim mot-list->vec
       (Pi ((E U))
           (-> (List E)
               U)))

(define mot-list->vec
       (lambda (E es)
         (Vec E (length E es))))

(claim step-list->vec
       (Pi ((E U)
            (e E)
            (es-tail (List E)))
           (-> (mot-list->vec E es-tail)
               (mot-list->vec E (:: e es-tail)))))

(define step-list->vec
  (lambda (E e es-tail)
    (lambda (ves-tail)
      (vec:: e ves-tail))))

(claim list->vec
       (Pi ((E U)
            (es (List E)))
           (Vec E (length E es))))

(define list->vec
  (lambda (E es)
    (ind-List es
              (mot-list->vec E)
              vecnil
              (step-list->vec E))))
