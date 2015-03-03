-module (day2).
-export ([find/2]).
-export ([shop/1]).

find(Lst, Keyword) -> [{Key, Desc} || {Key,Desc} <- Lst, Key == Keyword].
%test with day2:find([{erlang, "a functional language"}, {ruby, "an OO language"}],ruby).

shop(Lst) -> [{Item, Quant * Price} || {Item, Quant, Price} <- Lst].
%test with day2:shop([{"Banana", 3, 1.5}, {"Apple", 2, 1}, {"Coffe", 10, 15}]).
