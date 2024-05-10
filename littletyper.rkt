#lang pie

'atom

Atom

;Pair

(Pair Atom (Pair Atom Atom))

U

;(Pair U U)

;'at0m

;(cons 'ratatouille 'baguette)

; resume at ch 1 frame 47

zero

26

(add1 zero)

(claim one Nat)
(define one (add1 zero))

; Resume at frame 107

; Resume at frame 2.32

(which-Nat zero 'naught (lambda (x) 'more))

(claim gauss (-> Nat Nat))

(claim Pear U)

(define Pear (Pair Nat Nat))

Pear

(claim Pear-maker U)
(define Pear-maker (-> Nat Nat Pear))

(claim elim-Pear (-> Pear Pear-maker Pear))
(define elim-Pear (lambda (pear maker) (maker (car pear) (cdr pear))))

(claim pearwise-addition (-> Pear Pear Pear))
(define pearwise-addition
  (lambda (a b)
    (elim-Pear a (lambda (aa ad)
      (elim-Pear b (lambda (ba bd) (cons (+ aa ba) (+ ad bd))))))))

(pearwise-addition (cons 3 8) (cons 7 6))

; Resume at ch3
