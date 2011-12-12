;; If we list all the natural numbers below 10 that are multiples of 3 or 5, we
;; get 3, 5, 6 and 9. The sum of these multiples is 23.
;;
;; Find the sum of all the multiples of 3 or 5 below 1000.

(defun sum-of-multi (nums limit)
  (let ((multiples nil))
    (mapcar (lambda (num)
              (mapcar (lambda (multi)
                        (unless (member multi multiples)
                          (push multi multiples)))
                      (loop for multi from num below limit by num
                            collect multi)))
            nums)
    (apply #'+ multiples)))

(princ (sum-of-multi '(3 5) 1000))
