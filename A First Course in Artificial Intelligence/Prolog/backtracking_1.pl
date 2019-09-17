% defining rule
possible_pair(X, Y):- boy(X), girl(Y).
% these are the facts
boy(john).
boy(harry).
girl(alisa).
girl(miri).

/*
܀[trace]  ?- possible_pair(X,Y).
   Call: (8) possible_pair(_2438, _2440) ? creep
   Call: (9) boy(_2438) ? creep
   Exit: (9) boy(john) ? creep
   Call: (9) girl(_2440) ? creep
   Exit: (9) girl(alisa) ? creep
   Exit: (8) possible_pair(john, alisa) ? creep
X = john,
Y = alisa ;
   Redo: (9) girl(_2440) ? creep
   Exit: (9) girl(miri) ? creep
   Exit: (8) possible_pair(john, miri) ? creep
X = john,
Y = miri ;
   Redo: (9) boy(_2438) ? creep
   Exit: (9) boy(harry) ? creep
   Call: (9) girl(_2440) ? creep
   Exit: (9) girl(alisa) ? creep
   Exit: (8) possible_pair(harry, alisa) ? creep
X = harry,
Y = alisa ;
   Redo: (9) girl(_2440) ? creep
   Exit: (9) girl(miri) ? creep
   Exit: (8) possible_pair(harry, miri) ? creep
X = harry,
Y = miri.

*/
