%Example-2
%john the theif :P

theif(wini).
theif(john).
theif(william).

likes(wini, ball).
likes(william, shoe).
likes(john, snow).
likes(john, dollar).

%rule -> john may steal X if john is a theif and john likes X
may_steal(john, X):-theif(john),likes(john, X).


/*
⡐?- 
|    % Showing Example - 2
|    may_steal(john, X).
X = snow ;
X = dollar.

?- may_steal(john, jewellery).
false.

?- may_steal(john, ball).
false.

?- % compiler outputs false because whatever facts  it sees in the database according to that it will return the result
|    % by thinking that it all the information that it has for the world
|    .
*/
