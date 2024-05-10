(claim even-number
  (Π ((n Nat)
      (n2 Nat))
    (= Nat n (+ n2 n2))))

(claim Even
 (-> Nat
  U))

  (define Even
   (λ (n)
    (Σ ((half Nat))
     (= Nat n (double half)))))

  (claim +two-even
   (Π ((n Nat))
    (→ (Even n)
     (Even (+ 2 n)))))

  (define +two-even
   (λ (n)
    (λ (en)
     (cons (add1 (car en)) (same (double (add1 (car en))))))))

  (define +two-even
   (λ (n)
    (λ (en)
     (cons (add1 (car en)) (cong (cdr en) (+ 2))))))
