;; By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
;; that the 6th prime is 13.
;;
;; What is the 10 001st prime number?

(defvar *primes* '(2))
(defvar *primes-tail* *primes*)

(defun add-prime (p)
  (setf (cdr *primes-tail*) (cons p nil))
  (setf *primes-tail* (cdr *primes-tail*)))

(defun divisible? (num div-list)
  (let ((lim (sqrt num)))
    (loop for div in div-list while (< div lim)
          do (when (zerop (mod num div))
               (return t)))))

(defun prime-search (start end)
  (let ((num-list (loop for num from start to end by 2 collect num)))
    (loop for num in num-list
          do (unless (or (eq num nil) (divisible? num *primes*))
               (add-prime num)))))

(defun prime-search-interval (interval limit)
  (let ((start 3))
    (loop for i from 0 while (< (length *primes*) limit)
          do (prime-search
               (+ start (* i interval))
               (+ start (* (1+ i) interval))))))

(time (prime-search-interval 1000 10001))
(print (nth 10000 *primes*))
