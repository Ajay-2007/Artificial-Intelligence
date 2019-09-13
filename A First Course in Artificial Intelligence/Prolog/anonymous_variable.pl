hates(mary, jane).
hates(gian, nobita).
hates(mom, neighbor).
hates(dawson, oswald).
hates(david, bowling).
hates(harry, oswald).
hates(winnie, trot).

/*
ᔂ?- % Executing Anonymous Variable 
|    hates(X, oswald). % means who hates oswald
X = dawson ;
X = harry.

?- % If we want to show if there is anyone who hates oswald without revealing their name
|    % then we will use anonymous variable(_) here in the place of X
|    hates(_, oswald).
true ;
true.

?- % show this is used in the survey kind of things where we don't give our name but we give our true opinion.
*/
