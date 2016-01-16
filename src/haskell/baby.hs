doubleMe x = x + x
doubleUs x y = x * 2 + y * 2
doubleSmallNumber x = if x > 100
                        then x
                        else x*2
doubleSmallNumber' x = (if x > 100 then x else x*2) + 1
myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

listf ((:) 1 [])  = 3

data Hoge = H { getInt::Int }
hoge :: Hoge -> String
hoge (H _) = "hoge"

patf :: String -> Int 
patf ("fujisaki") = 1