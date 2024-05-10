#lang pie

(claim first-of-two
       (Pi ((E U))
            (-> (Vec E 2)
                E)))

(define first-of-two
  (lambda (E)
    (lambda (es)
      (head es))))

(first-of-two Atom (vec:: 'y (vec:: 'x vecnil)))
