-- Starting with the number 1 and moving to the right in a clockwise direction a
-- 5 by 5 spiral is formed as follows:
--
-- 21 22 23 24 25
-- 20  7  8  9 10
-- 19  6  1  2 11
-- 18  5  4  3 12
-- 17 16 15 14 13
--
-- It can be verified that the sum of the numbers on the diagonals is 101.
--
-- What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral
-- formed in the same way?

sumOddSquares :: (Integral a) => a -> a
sumOddSquares n = (n * (2 * n - 1) * (2 * n + 1)) `div` 3

sumIntegers :: (Integral a) => a -> a
sumIntegers n = (n * (n + 1)) `div` 2

sumDiagonalSpiral :: (Integral a) => a -> a
sumDiagonalSpiral 1 = 1
sumDiagonalSpiral n = 1 + 4 * ((sumOddSquares n) - 1) - 12 * (sumIntegers (n - 1))

sideToDiagonal :: (Integral a) => a -> a
sideToDiagonal side = (side + 1) `div` 2

main = do
    let result = sumDiagonalSpiral (sideToDiagonal 1001)
    print result

