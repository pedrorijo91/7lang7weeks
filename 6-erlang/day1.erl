-module (day1).
-export ([n_words/1]).
-export ([count_ten/0]).
-export ([match/1]).

n_words(Str) -> counter(string:tokens(Str," ")).

counter([]) -> 0;
counter([_ | Tail]) -> 1 + counter(Tail).
%test with day1:n_words(""). == 0
%test with day1:n_words("its her puppy"). == 3

count_ten() -> count(1,10).

count(N, N) -> io:fwrite("N: ~s~n", [integer_to_list(N)]);
count(N, L) -> io:fwrite("N: ~s~n", [integer_to_list(N)]), count(N+1, L).
%test with count_ten().

match({error, Message}) -> io:fwrite("error: ~s~n", [Message]);
match(success) -> io:fwrite("Success !~n").
%test with match({error, "Erroring"}).
%test with match(success).