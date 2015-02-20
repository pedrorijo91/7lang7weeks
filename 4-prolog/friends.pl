likes(wa, c).
likes(g, c).
likes(we, s).

friend(X, Y) :- \+(X = Y), likes(X, Z), likes(Y, Z).
