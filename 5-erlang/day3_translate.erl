-module(day3_translate).
-export([loop/0, translate/2]).

loop() ->
  receive
    {From, "casa" } ->
      From ! "house" ,
      loop();
    {From, "blanca" } ->
      From ! "white" ,
      loop();
    {From, _} ->
      From ! "I don't understand." ,
      loop()
      %exit({From, not_understood, received_at, erlang:time()})
end.

translate(To, Word) ->
  To ! {self(), Word},
  receive
    Translation -> Translation
end.

