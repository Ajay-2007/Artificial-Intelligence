% Creating Knowledge Base
Valuable(gold).
female(jane).
owns(jane, gold).
father(john,mary).
gives(john, book, mary).

/*
ERROR: Stream user_input:18:6 Syntax error: Unexpected end of clause
?- female(jane)
|    .
true.

?- owns(jane, gold).
true.

?- father(john, marry).
false.

?- father(john, mary).
true.

?- father(mary, jane).
false.

?- 
% c:/users/d33ps3curity/desktop/5th_semester/1. artificial intelligence/1. theory/0.0 artificial intelligence/prolog/prolog_midsem/facts compiled 0.00 sec, 0 clauses
?- 
|    father(mary, jane).
ERROR: Undefined procedure: father/2
ERROR:     However, there are definitions for:
ERROR:         father/1
false.

?- 
% c:/users/d33ps3curity/desktop/5th_semester/1. artificial intelligence/1. theory/0.0 artificial intelligence/prolog/prolog_midsem/facts compiled 0.00 sec, 0 clauses
?- 
|    father(mary, jane)
|    .
false.

?- father(jane, mary).
false.

?- father(john, mary).
true.

?- father(mary, john).
false.

?- father(john, mary).
true.

*/
