%john likes anyone who likes wine
%Example-1

likes(mary, wine).
likes(bob, beer).
likes(wini, apple).
likes(charlie, wine).

% rule -> checking john likes anyone who likes wine
likes(john,X):-likes(X,wine).

/*
ِ?- 
|    %Executing Example-1
|    likes(john, X).
X = mary ;
X = charlie ;
false.

?- likes(john, bob).
false.

?- likes(john, wini).
false.

?- likes(john, mary).
true .
*/
