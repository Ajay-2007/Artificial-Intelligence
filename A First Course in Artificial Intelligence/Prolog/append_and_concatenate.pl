append([], L2, L2).
append([H|T], L2, [H|L3]):-append(T, L2, L3).


/*
[trace]  ?- 
|    append([1,2,3],[a,b],X).
   Call: (8) append([1, 2, 3], [a, b], _1848) ? creep
   Call: (9) append([2, 3], [a, b], _2098) ? creep
   Call: (10) append([3], [a, b], _2104) ? creep
   Call: (11) append([], [a, b], _2110) ? creep
   Exit: (11) append([], [a, b], [a, b]) ? creep
   Exit: (10) append([3], [a, b], [3, a, b]) ? creep
   Exit: (9) append([2, 3], [a, b], [2, 3, a, b]) ? creep
   Exit: (8) append([1, 2, 3], [a, b], [1, 2, 3, a, b]) ? creep
X = [1, 2, 3, a, b].
*/
