#lang pie

(claim first-of-one
       (Pi ((E U))
            (-> (Vec E 1)
                E)))

(define first-of-one
  (lambda (E)
    (lambda (es)
      (head es))))

(first-of-one Atom (vec:: 'x vecnil))

(vec:: 5 vecnil)
