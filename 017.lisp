;; If the numbers 1 to 5 are written out in words one, two, three, four, five,
;; then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
;;
;; If all the numbers from 1 to 1000 (one thousand) inclusive were written out
;; in words, how many letters would be used?
;;
;; NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and
;; forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20
;; letters. The use of "and" when writing out numbers is in compliance with
;; British usage.

(defun rm-digits (num n)
  (setf n (expt 10 n))
  (/ (- num (mod num n)) n))

(defun num->word (num)
  (cond ((< num 0)
         (cond ((= num -2) "twen")
               ((= num -3) "thir")
               ((= num -4) "for")
               ((= num -5) "fif")
               ((= num -6) "six")
               ((= num -7) "seven")
               ((= num -8) "eigh")
               ((= num -9) "nine")))
        ((< num 10)
         (cond ((= num 1) "one")
               ((= num 2) "two")
               ((= num 3) "three")
               ((= num 4) "four")
               ((= num 5) "five")
               ((= num 6) "six")
               ((= num 7) "seven")
               ((= num 8) "eight")
               ((= num 9) "nine")))
        ((< num 20)
         (cond ((= num 10) "ten")
               ((= num 11) "eleven")
               ((= num 12) "twelve")
               ((= num 14) "fourteen")
               (t (concatenate 'string (num->word (* -1 (mod num 10)))
                                       "teen"))))
        ((< num 100)
         (concatenate 'string (num->word (* -1 (rm-digits num 1)))
                              "ty"
                              (unless (= (mod num 10) 0)
                                (concatenate 'string "-"
                                (num->word (mod num 10))))))
        ((< num 1000)
         (concatenate 'string (num->word (rm-digits num 2))
                              " hundred"
                              (unless (= (mod num 100) 0)
                                (concatenate 'string " and "
                                (num->word (mod num 100))))))
        ((< num 1000000)
         (concatenate 'string (num->word (rm-digits num 3))
                              " thousand "
                              (num->word (mod num 1000))))))

;; TODO: process repeated words once and multiply length
(defun num-letter-sum (nums)
  (reduce #'+ (loop for num from 1 to nums
                    collect (length (remove #\-
                                    (remove #\Space (num->word num)))))))

(princ (num-letter-sum 1000))
