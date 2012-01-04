-- n! means n × (n − 1) × ... × 3 × 2 × 1
--
-- For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
-- and the sum of the digits in the number 10! is
-- 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
--
-- Find the sum of the digits in the number 100!

factorial 1 = 1
factorial n = n * factorial (n - 1)

sumDigits num
    | num < 10 = num
    | otherwise = mod num 10 + sumDigits (div num 10)

main = do
    let result = sumDigits (factorial 100)
    print result
