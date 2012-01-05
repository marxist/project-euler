;; A Pythagorean triplet is a set of three natural numbers, a < b < c, for
;; which, a² + b² = c²
;;
;; For example, 3² + 4² = 9 + 16 = 25 = 5².
;;
;; There exists exactly one Pythagorean triplet for which a + b + c = 1000.
;; Find the product abc.
;;
;; n = 1000
;; a + b > n/2
;; a * b = kn; k ∈ N
;; a < n/3
;; b < n/2
;; c < n

(defun next-kn-a (a n)
  (let ((b (/ n a)))
    (setf b (* b (denominator b)))
    (if (> b (/ n 2))
      n
      b)))

(defun next-b (a n)
  (max (- (/ n 2) a) (next-kn-a a n)))

(defun pytriplet (n)
  (loop for a from 1 to (/ n 3)
        do (loop for b from (next-b a n) to (/ n 2)
                 while (>= b a)
                 when (= (* a b) (* n (- (+ a b) (/ n 2))))
                 do (prin1 (* a b (- n (+ a b)))))))

(pytriplet 1000)
