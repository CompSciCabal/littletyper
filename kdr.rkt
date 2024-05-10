#lang pie

(claim kdr (-> (Pair Nat Nat) Nat))

(define kdr
	(lambda (p)
		(elim-Pair
			Nat Nat
			Nat
			p
			(lambda (a d)
				d))))
