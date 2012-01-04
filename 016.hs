-- 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
--
-- What is the sum of the digits of the number 2^1000?

sumDigits 0 = 0
sumDigits n = mod n 10 + sumDigits (div n 10)

main = do
    let result = sumDigits (2 ^ 1000)
    print result
