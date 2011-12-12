;; The sum of the squares of the first ten natural numbers is,
;; 1² + 2² + ... + 10² = 385
;;
;; The square of the sum of the first ten natural numbers is,
;; (1 + 2 + ... + 10)² = 55² = 3025
;;
;; Hence the difference between the sum of the squares of the first ten natural
;; numbers and the square of the sum is 3025 − 385 = 2640.
;;
;; Find the difference between the sum of the squares of the first one hundred
;; natural numbers and the square of the sum.

(defparameter *nums* 100)

(defun sum->square (nums)
  (let ((sum (/ (* nums (1+ nums)) 2)))         ; sum of sequential numbers
    (* sum sum)))

(defun squares->sum (nums)
  (/ (* nums (1+ nums) (1+ (* nums 2))) 6))     ; sum of sequential squares

(princ (- (sum->square *nums*) (squares->sum *nums*)))
