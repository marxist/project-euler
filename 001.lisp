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
  (do ((sum 0 (+ sum multi))
       (multi 0 (+ multi (to-next-multi multi nums))))
    ((= multi limit) sum)))

(princ (sum-multiples '(3 5) 1000))
