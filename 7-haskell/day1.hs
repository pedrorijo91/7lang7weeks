module Main where
	allEven :: [Integer] -> [Integer]
	allEven [] = []
	allEven (h:t) = if even h then h:allEven t else allEven t

	otherEven :: [Integer] -> [Integer]
	otherEven [] = []
	otherEven (lst) = [x | x <- lst, rem x 2 == 0]

	rev :: [Integer] -> [Integer]
	rev [] = []
	rev (h:t) = rev(t) ++ [h]

	colors = ["black", "white", "blue", "yellow", "red"]
	allColors = [(a,b) | a <- colors, b <- colors, a < b]

	table = [(x, y, x * y) | x <- [1..12], y <- [1..12]]

	mapColors = ["red", "green", "blue"]
	mapSolver = [ (("Tennesee", tColor), ("Mississippi", mColor), ("Alabama", aColor), ("Georgia", gColor), ("Florida", fColor)) |
                  tColor <- mapColors, mColor <- mapColors, aColor <- mapColors, gColor <- mapColors, fColor <- mapColors,
                  mColor /= tColor, mColor /= aColor,
                  aColor /= tColor, aColor /= gColor, aColor /= fColor,
                  gColor /= fColor, gColor /= tColor ]