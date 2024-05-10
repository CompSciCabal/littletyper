#lang pie

(claim step-append
       (Pi ((E U))
           (-> E (List E) (List E)
               (List E))))

(define step-append
  (lambda (E)
    (lambda (e es appendes)
      (:: e appendes))))

(claim snoc
       (Pi ((E U))
           (-> (List E) E
               (List E))))

(define snoc
  (lambda (E)
    (lambda (start e)
      (rec-List start
                (:: e nil)
                (step-append E)))))

(claim step-concat
       (Pi ((E U))
           (-> E (List E) (List E)
               (List E))))

(define step-concat
  (lambda (E)
    (lambda (e es appendes)
      (snoc E appendes e))))

(claim concat
       (Pi ((E U))
           (-> (List E) (List E)
               (List E))))

(define concat
  (lambda (E)
    (lambda (start end)
      (rec-List end
                start
                (step-concat E)))))

(concat Atom (:: 'a (:: 'b nil)) (:: 'c (:: 'd nil)))
