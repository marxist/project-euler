;; The prime factors of 13195 are 5, 7, 13 and 29.
;;
;; What is the largest prime factor of the number 600851475143 ?

(defparameter *number* 600851475143)

(defun largest-prime (num)
  (let ((div 2)
        (new 0))
    (labels ((next-prime ()
               (setf new (/ num div))
               (if (= (mod new 1) 0)
                 (setf num new)
                 (setf div (1+ div)))))
      (loop while (< div num)
            do (next-prime)))
    div))

(princ (largest-prime *number*))
