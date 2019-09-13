% Conjunctions like AND(,) OR(;) in prolog

% Knowledge Base
likes(mary, chocolate).
likes(mary, wine).
likes(mary, burger).
likes(john, wine).
likes(john, mary).
likes(john, burger).


% Output
/*
ᕐ?- 
|    likes(mary, john),likes(john, mary).
false.

?- likes(john, mary),likes(john, mary).
true.

?- %calculating things that are liked by both mary and john
|    likes(mary, X), likes(john, X).
X = wine ;
X = burger.

?- % ,(comma) is AND in prolog
|    % and ;(semi colon) is OR in porlog
|    likes(mary, X), likes(john, X).
X = wine .

*/
