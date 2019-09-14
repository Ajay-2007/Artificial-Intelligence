/*
?- police=police.
true.

?- police=pen.
false.

?- 686=686.
true.

?- 686=2.
false.

?- a(b, c(d, e))=a(X, c(Y, e))
|    .
X = b,
Y = d.

?- a(b, c(d, e))=a(X, u(Y, e)).
false.

?- anime(A, naruto)=anime(luffy,B).
A = luffy,
B = naruto.

?- river(X,Y,Z)=river(A,B,C).
X = A,
Y = B,
Z = C.

?- letter(c)=word(letter).
false.

?- %because the functers name is different
|    .

ERROR: Stream user_input:394:6 Syntax error: Unexpected end of clause
?- here(now)=now
|    .
false.

?- 'student'=student
|    .
true.

?- f(X,X)=f(a,b).
false.

?- f(X,a(b,c))=f(Z,a(Z,c))
|    .
X = Z, Z = b.

?- 
*/
