#lang pie

(claim foo
  (Pi ((A U)) Nat))

(define foo
  (lambda (X) zero))

(foo Nat)
