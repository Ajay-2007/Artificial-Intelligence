population(china, 100).
population(india, 85).
population(usa, 30).
population(germany,9).

area(china, 10).
area(india, 4).
area(usa, 12).
area(germany, 2).

density(X,Y):-population(X, Pop),
              area(X, Ar),
              Y is Pop/Ar.

/*
?- % Executing arithematic_operators_2
|    density(china, X).
X = 10.

?- density(usa, X).
X = 2.5.

?- density(india, X).
X = 21.25.
*/
