size([], 0). % this is a fact that when there is empty list its size will be zero.
size([_|T], N):-size(T,N1), N is N1+1.

/*
ᄀ% c:/users/d33ps3curity/documents/prolog/list_length compiled 0.00 sec, 0 clauses
[trace]  ?- 
|    size([1, 2, 3, 4], N).
   Call: (8) size([1, 2, 3, 4], _668) ? creep
   Call: (9) size([2, 3, 4], _918) ? creep
   Call: (10) size([3, 4], _918) ? creep
   Call: (11) size([4], _918) ? creep
   Call: (12) size([], _918) ? creep
   Exit: (12) size([], 0) ? creep
   Call: (12) _922 is 0+1 ? creep
   Exit: (12) 1 is 0+1 ? creep
   Exit: (11) size([4], 1) ? creep
   Call: (11) _928 is 1+1 ? creep
   Exit: (11) 2 is 1+1 ? creep
   Exit: (10) size([3, 4], 2) ? creep
   Call: (10) _934 is 2+1 ? creep
   Exit: (10) 3 is 2+1 ? creep
   Exit: (9) size([2, 3, 4], 3) ? creep
   Call: (9) _668 is 3+1 ? creep
   Exit: (9) 4 is 3+1 ? creep
   Exit: (8) size([1, 2, 3, 4], 4) ? creep
N = 4.

*/
