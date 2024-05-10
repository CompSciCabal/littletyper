#lang pie

(claim + (-> Nat Nat Nat))

(define +
  (lambda (n j)
    (iter-Nat n
      j
      (lambda (n-1)
        (add1 n-1)))))


(claim twice (-> Nat Nat))

(define twice
  (lambda (n)
    (+ n n)))


(claim double (-> Nat Nat))

(define double
  (lambda (n)
    (iter-Nat n
      0
      (+ 2))))


(claim mot-twice=double
  (-> Nat U))

(define mot-twice=double
  (lambda (k)
    (= Nat
      (twice k)
      (double k))))

(claim mot-step-twice=double
  (-> Nat Nat
    U))

;(= Nat
;      (add1 (add1 (+ n-1 n-1)))
;      (add1 (add1 (double n-1))))

;(= Nat
;      (+ n-1 n-1)
;      (double n-1))

;(cong twice=double-n-1 (+ 2))

(define mot-step-twice=double
   (lambda (n-1)
    (lambda (k)
     (= Nat
      (add1 k)
      (add1 (add1 (double n-1)))))))

(claim add1+=+add1
       (Pi ((n Nat)
            (j Nat))
           (= Nat
              (add1 (+ n j))
              (+ n (add1 j)))))

(claim mot-add1+=+add1
       (-> Nat Nat U))

(define mot-add1+=+add1
  (lambda (j k)
    (= Nat
       (add1 (+ k j))
       (+ k (add1 j)))))

(claim step-add1+=+add1
       (Pi ((j Nat)
            (n-1 Nat))
           (-> (mot-add1+=+add1 j n-1)
               (mot-add1+=+add1 j (add1 n-1)))))

(define step-add1+=+add1
  (lambda (j n-1)
    (lambda (add1+=+add1-n-1)
      (cong add1+=+add1-n-1 (+ 1)))))

(define add1+=+add1
  (lambda (n j)
    (ind-Nat n
             (mot-add1+=+add1 j)
             (same (add1 j))
             (step-add1+=+add1 j))))

(claim step-twice=double
  (Pi ((n-1 Nat))
       (-> (mot-twice=double n-1)
         (mot-twice=double (add1 n-1)))))

; twice=double-n-1 is...
;(= Nat (twice n-1) (double n-1))

;(= Nat
;  (+ n-1 n-1)
;  (iter-Nat n-1 0 (+ 2)))

;(= Nat
;  (iter-Nat n-1 n-1 (lambda (n-2) (add1 n-2)))
;  (iter-Nat n-1 0   (+ 2)))

;(= Nat
;  (iter-Nat n-1 n-1 (lambda (n-2) (add1 n-2)))
;  (iter-Nat n-1 0   (lambda (n-2) (iter-Nat 2 n-2 (lambda (n-3) (add1 n-3)))))

;(= Nat
;  (iter-Nat n-1 n-1 (lambda (n-2) (add1 n-2)))
;  (iter-Nat n-1 0   (lambda (n-2) (add1 (add1 n-2)))))


; step should return...
;(= Nat (twice (add1 n-1)) (double (add1 n-1)))

;(= Nat
;  (iter-Nat (add1 n-1) (add1 n-1) (lambda (k) (add1 k)))
;  (iter-Nat (add1 n-1) 0          (lambda (k) (add1 (add1 k)))))

;(= Nat
;  (add1 (+ n-1 (add1 n-1))
;  (add1 (add1 (iter-Nat n-1 0          (lambda (k) (add1 (add1 k)))))

;(= Nat
;  (add1 (add1 (+ n-1 n-1)))
;  (add1 (add1 (iter-Nat n-1 0          (lambda (k) (add1 (add1 k)))))


(define step-twice=double
  (lambda (n-1)
    (lambda (twice=double-n-1)
      (replace (add1+=+add1 n-1 n-1)
        (mot-step-twice=double n-1)
        (cong twice=double-n-1 (+ 2))))))

(claim twice=double
       (Pi ((n Nat))
            (= Nat (twice n) (double n))))

(define twice=double
  (lambda (n)
    (ind-Nat n
      mot-twice=double
      (same 0)
      step-twice=double)))

(twice=double 17)
