evenlength:-
	write('even elements in the list').

oddlength:-
	write('odd elements in the list').

oddeven([H | T]):-
	length(T, L),
	L>=0 ->
	( 
		L1 is L+1
		L2 is mod(L1, 2)
		L2=:=0 ->
			evenlength
		;
			oddlength
	).
  
  /*
  [trace]  ?- oddeven([1,2,3]).
   Call: (8) oddeven([1, 2, 3]) ? creep
   Call: (9) length([2, 3], _1940) ? creep
   Exit: (9) length([2, 3], 2) ? creep
   Call: (9) 2>=0 ? creep
   Exit: (9) 2>=0 ? creep
   Call: (9) _1944 is 2+1 ? creep
   Exit: (9) 3 is 2+1 ? creep
   Call: (9) _1950 is 3 mod 2 ? creep
   Exit: (9) 1 is 3 mod 2 ? creep
   Call: (9) 1=:=0 ? creep
   Fail: (9) 1=:=0 ? creep
   Redo: (8) oddeven([1, 2, 3]) ? creep
   Call: (9) oddlength ? creep
   Call: (10) write('odd elements in the list') ? creep
odd elements in the list
   Exit: (10) write('odd elements in the list') ? creep
   Exit: (9) oddlength ? creep
   Exit: (8) oddeven([1, 2, 3]) ? creep
true.
  
  */
