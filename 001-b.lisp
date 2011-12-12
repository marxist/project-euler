;; If we list all the natural numbers below 10 that are multiples of 3 or 5, we
;; get 3, 5, 6 and 9. The sum of these multiples is 23.
;;
;; Find the sum of all the multiples of 3 or 5 below 1000.

(defun to-next-multi (start nums)
  (car (sort (mapcar (lambda (num)
                       (- num (mod start num)))
                     nums)
             #'<)))

(defun sum-multiples (nums limit)
  (let ((sum 0)
        (multi 0))
    (loop for n from 0
          do (setf multi (+ multi (to-next-multi multi nums)))
          while (< multi limit)
          do (setf sum (+ sum multi)))
    sum))

(princ (sum-multiples '(3 5) 1000))
