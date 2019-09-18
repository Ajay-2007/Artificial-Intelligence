%is_integer(-10).
is_integer(0).
is_integer(X):-is_integer(Y), X is Y+1.


/*
[trace]  ?- is_integer(2).
   Call: (8) is_integer(2) ? creep
   Call: (9) is_integer(_1156) ? creep
   Exit: (9) is_integer(0) ? creep
   Call: (9) 2 is 0+1 ? creep
   Fail: (9) 2 is 0+1 ? creep
   Redo: (9) is_integer(_1156) ? creep
   Call: (10) is_integer(_1156) ? creep
   Exit: (10) is_integer(0) ? creep
   Call: (10) _1162 is 0+1 ? creep
   Exit: (10) 1 is 0+1 ? creep
   Exit: (9) is_integer(1) ? creep
   Call: (9) 2 is 1+1 ? creep
   Exit: (9) 2 is 1+1 ? creep
   Exit: (8) is_integer(2) ? creep
true .
*/
