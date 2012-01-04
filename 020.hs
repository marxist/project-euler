factorial 1 = 1
factorial n = n * factorial (n - 1)

sumDigits num
    | num < 10 = num
    | otherwise = mod num 10 + sumDigits (div num 10)

main = do
    let result = sumDigits (factorial 100)
    print result
