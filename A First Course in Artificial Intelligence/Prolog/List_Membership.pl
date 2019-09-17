Member(X,  [X | _ ]).

member(X, [_ | T]):-member(X, T).

/*
ऀ[trace]  ?- member(3, [1, 2, 3, 4]).
   Call: (8) member(3, [1, 2, 3, 4]) ? creep
   Call: (9) member(3, [2, 3, 4]) ? creep
   Call: (10) member(3, [3, 4]) ? creep
   Exit: (10) member(3, [3, 4]) ? creep
   Exit: (9) member(3, [2, 3, 4]) ? creep
   Exit: (8) member(3, [1, 2, 3, 4]) ? creep
true .
*/
