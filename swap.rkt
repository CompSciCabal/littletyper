#lang pie

(claim elim-Pair
  (Pi ((A U)
	     (D U)
			 (X U))
    (-> (Pair A D) (-> A D X) X)))

(define elim-Pair
  (lambda (A D X)
	  (lambda (p f)
		  (f (car p) (cdr p)))))

(claim swap (-> (Pair Nat Atom) (Pair Atom Nat)))

(define swap
	(lambda (p)
		(elim-Pair
			Nat Atom
			(Pair Atom Nat)
			p
			(lambda (a d)
				(cons d a)))))

(swap (cons 1 'foo))
