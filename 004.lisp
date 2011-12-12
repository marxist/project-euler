;; A palindromic number reads the same both ways. The largest palindrome made
;; from the product of two 2-digit numbers is 9009 = 91 × 99.
;;
;; Find the largest palindrome made from the product of two 3-digit numbers.

(defparameter *digits* 3)
(defparameter *start* (expt 10 (1- *digits*)))
(defparameter *end* (1- (expt 10 *digits*)))

(defun palindrome? (num)
  (setf num (prin1-to-string num))
  (equal num (reverse num)))

(defun products (start end)
  (let ((top 0))
    (labels ((check (fct)
               (when (and (> fct top) (palindrome? fct))
                 (setf top fct))))
      (loop for n1 from start to end
            do (loop for n2 from n1 to end
                     do (check (* n1 n2)))))
    top))

(princ (products *start* *end*))
