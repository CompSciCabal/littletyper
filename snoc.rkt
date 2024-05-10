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
    (lambda (es e)
      (rec-List es
                (:: e nil)
                (step-append E)))))

(snoc Atom (:: 'a (:: 'b nil)) 'c)
