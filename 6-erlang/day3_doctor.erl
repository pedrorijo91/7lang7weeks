-module(day3_doctor).

-export([loop/0, doc_doc/0]).

loop() ->
  process_flag(trap_exit, true),
  receive
    new ->    % Create a new translator and watch for it to die.
      register(translator, spawn_link(fun day3_translate:loop/0)),
      io:format("Creating a new translator...~n"),
      loop();

    {'EXIT', From, Reason} ->   % The translator died. Restart it with info.
      io:format("The translator ~p died with reason ~p.", [From, Reason]),
      io:format("Restarting it...~n"),
      self() ! new,
      loop();

    Command ->    % Our doctor was given a bad command! Make him exit.
      io:format("The translator received unknow command '~p'.~n", [Command]),
      loop()
      %exit({doctor_loop, bad_doctor_order, received_at, erlang:time()})
    end.


doc_doc() ->    % Supervisor for the doctor of the translator.
  process_flag(trap_exit, true),
  receive
    new ->    % Create a new doctor.
      register(doctor, spawn_link(fun day3_doctor:loop/0)),
      io:format("Creating a new doctor...~n"),
      doctor ! new,
      doc_doc();

    {'EXIT', From, Reason} ->   % Our doctor died. Restart him with info.
      io:format("The doctor ~p died with reason ~p.", [From, Reason]),
      io:format("Restarting it...~n"),
      self() ! new,
      doc_doc()
    end.

% c(day3_translate).
% c(day3_doctor).
% DocDoc = spawn(fun day3_doctor:doc_doc/0).
% DocDoc ! new.
% day3_translate:translate(translator, "casa").
% day3_translate:translate(translator, "random").
% doctor ! random.