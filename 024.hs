-- A permutation is an ordered arrangement of objects. For example, 3124 is one
-- possible permutation of the digits 1, 2, 3 and 4. If all of the permutations
-- are listed numerically or alphabetically, we call it lexicographic order. The
-- lexicographic permutations of 0, 1 and 2 are:
--
-- 012   021   102   120   201   210
--
-- What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4,
-- 5, 6, 7, 8 and 9?

factorial 1 = 1
factorial n = n * factorial (n - 1)

delete index list = sublist1 ++ sublist2
    where (sublist1,_:sublist2) = splitAt index list

nth_perm nums n
    | len == 1 = nums
    | max < len = []
    | otherwise = head:(nth_perm subnums subn)
    where len = length nums
          max = factorial len
          interval = div max len
          index = div (n - 1) interval
          head = nums !! index
          subnums = delete index nums
          subn = n - interval * index

toNum nums = sum [ (nums !! index) * (multis !! index) | index <- [0..(len - 1)] ]
    where len = length nums
          multis = [ 10 ^ p | p <- [(len - 1),(len - 2)..0] ]

main = do
    let result = toNum (nth_perm [0..9] 1000000)
    print result

