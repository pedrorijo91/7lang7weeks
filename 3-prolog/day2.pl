% Exercise 1

rev([], []).
rev([Head | Tail], Res) :- rev(Tail, Inv), append(Inv, [Head], Res).

% Exercise 2

min(A,B,B) :- B < A.
min(A,B,A) :- A < B.

min_lst([X], X).
min_lst([Head | Tail], Res) :-  min_lst(Tail, M), min(Head, M, Res).

% Exercise 3

sort_lst([X], [X]).

sort_lst(List, [Min|Res]) :-
  min_lst(List, Min),
  delete(List, Min, Recursion),
  sort_lst(Recursion, Res).
