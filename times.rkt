#lang pie

(claim + (-> Nat Nat Nat))

(claim step-+ (-> Nat Nat))

(define step-+
  (lambda (n-1)
		(add1 n-1)))

(define +
	(lambda (n j)
		(iter-Nat n
			j
			step-+)))


(claim * (-> Nat Nat Nat))

(define *
	(lambda (n j)
		(rec-Nat n
			0
			(lambda (n-1 *n-1)
				(+ *n-1 j)))))

((* 2) 3)
