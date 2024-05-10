#lang pie

(claim + (-> Nat Nat Nat))

(define +
	(lambda (n j)
		(iter-Nat n
			j
			(lambda (n-1)
				(add1 n-1)))))

(+ 2 3)
