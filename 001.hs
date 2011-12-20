start = 1
end = 1000
result = sum [ x | x <- [start..end-1], mod x 3 == 0 || mod x 5 == 0 ]

main = do
    print result
