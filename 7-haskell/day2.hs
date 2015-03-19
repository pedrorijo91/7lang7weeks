module Main where

	import Data.List (sort)
	import Data.List (sortBy)

	mySort (lst) = sort lst
	-- mySort [1,2,4,3,0]
	
	mySortBy (f) (lst) = sortBy f lst
	-- mySortBy (flip compare) [1,2,4,3,0]

	every3 x = [x, (x + 3) ..]
	every5 x = [x, (x + 5) ..]
	every8 x y = zipWith (+) (every3 x) (every5 y)

	half = (/ 2)
	newLine = (++ "\n")
