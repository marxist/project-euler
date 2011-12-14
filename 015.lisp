;; Starting in the top left corner of a 2×2 grid, there are 6 routes (without
;; backtracking) to the bottom right corner.
;;
;; + → +———+
;; |   ↓   |
;; +———+ → +
;; |   |   ↓
;; +———+———+
;;
;; How many routes are there through a 20×20 grid?

(defparameter *A* 20)
(defparameter *B* 20)

;; factorial
(defun n! (n)
  (if (> n 1)
    (* n (n! (1- n)))
    1))

(defun routes (x y)
  (/ (n! (+ x y)) (* (n! x) (n! y))))   ; binomial coefficient

(princ (routes *A* *B*))
