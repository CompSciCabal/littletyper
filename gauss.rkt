#lang pie

(claim + (-> Nat Nat Nat))

(define +
	(lambda (n j)
		(iter-Nat n
			j
			(lambda (n-1)
				(add1 n-1)))))


(claim gauss (-> Nat Nat))

(define gauss
  (lambda (n)
	  (rec-Nat n
		  zero
			(lambda (n-1 gauss-n-1)
			  (+ (add1 n-1) gauss-n-1)))))

(gauss 10000)
