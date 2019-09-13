% Variables in Prolog
likes(john, flowers).
likes(john, chicks).
likes(john, mangoes).
hates(john, oranges).
dislikes(john, study).



/*
?- likes(john, mangoes).
true.

?- likes(john, dresses).
false.

?- %introducing variables
|    likes(john, X).
X = flowers ;
X = chicks ;
X = mangoes.

?- %notice vairable name starts with Capital latter 
|    % we can give any name to the variable the only condition is that it should start with
|    % the Capital latter
|    likes(john, Mary).
Mary = flowers ;
Mary = chicks ;
Mary = mangoes.
*/
