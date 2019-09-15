% prolog program to find factorial of a number
% base case predicate
fact(0,1).
fact(N, F):-
(
	N>0 ->
	(
		N1 is N-1,
		fact(N1, F1),
		F is N*F1
	)
	;
	write('N should be greater than 0')
).
