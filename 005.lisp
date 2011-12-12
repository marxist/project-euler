;; 2520 is the smallest number that can be divided by each of the numbers from 1
;; to 10 without any remainder.
;;
;; What is the smallest positive number that is evenly divisible by all of the
;; numbers from 1 to 20?

(defparameter *start* 1)
(defparameter *end* 20)

(defun divisible-from-to (start end)
  (let ((result 1))
    (loop for fct from start to end
          do (setf result (* result (denominator (/ result fct)))))
    result))

(princ (divisible-from-to *start* *end*))
