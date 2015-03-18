-module (day2).
-export ([find/2]).
-export ([shop/1]).
-export ([ticTacToe/1]).
-export ([checkNoMoreMoves/1]).
-export ([winner/1]).

find(Lst, Keyword) -> [{Key, Desc} || {Key,Desc} <- Lst, Key == Keyword].
%test with day2:find([{erlang, "a functional language"}, {ruby, "an OO language"}],ruby).

shop(Lst) -> [{Item, Quant * Price} || {Item, Quant, Price} <- Lst].
%test with day2:shop([{"Banana", 3, 1.5}, {"Apple", 2, 1}, {"Coffe", 10, 15}]).

ticTacToe(Tab) ->
  [A, B, C,
  D, E, F,
  G, H, I] = Tab,
  WinningChanges = [[A,B,C],[D,E,F],[G,H,I],[A,D,G],[B,E,H],[C,F,I],[A,E,I],[G,E,C]],
  {ExistsWinner, Winner} = winner(WinningChanges),
  if
    ExistsWinner -> Winner;
    true -> Res = checkNoMoreMoves(Tab),
            if
              Res -> cat;
              true -> no_winner_yet
            end
  end.

checkNoMoreMoves(Tab) -> lists:all(fun(X) -> X /= '*' end,Tab).

winner([]) -> {false, "NO WINNER"};
winner([[E,E,E]|T]) -> if
                          E /= '*' -> {true, E};
                          true -> winner(T)
                       end;
winner([_|T]) -> winner(T).
%test with day2:ticTacToe(['X','X','O','O','O','X','X','O','X']) == cat.
%test with day2:ticTacToe(['*','*','*','*','*','*','X','X','X']) == 'X'.
%tes with day2:ticTacToe(['*','*','*','*','*','*','*','*','*']) == no_winner_yet.
