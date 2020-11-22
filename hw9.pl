/* 
Tenzin Dolma Gyalpo 
Homework 9 - part 1 
*/



/* checks if X is a permutation of Y */
permute([],[]). /* base case */
permute([H|X], Y) :-
    permute(X, B),
    rem(H, Y, B).

/* rem(X, L, Res) - remove one occurence of X from L */
rem(X, [X|T], T).
rem(X, [H|T], [H|R]) :-
  rem(X, T, R).

/* check if the list has even number of elements */
evenLength(X) :- 
    length(X, N),
     0 is mod(N, 2).
     
/* check if the result is the merge of two lists */
mergeLists([], [], []).
mergeLists(X, [], X).
mergeLists([], Y, Y).
mergeLists([H|X], [B|Y], [H|R]) :-
    mergeLists(X, [B|Y], R).
mergeLists([A|X], [H|Y], [H|R]) :-
    mergeLists([A|X], Y, R).

/* Check if the list is a palindrom */
palindrome([]).
palindrome(L) :- 
    reverse(L, L).

/* a relation to remove adjacent duplicates */
removeDup([],[]).
removeDup([X],[X]).
removeDup([X|Y],R):- 
    Y=[X|_],
    removeDup(Y,R). 

removeDup([X|Y],[X|R]):- 
    removeDup(Y,R).


/* compute factorial in tail-recursive fashion. */
factorial(N, R) :- factorial(0, N, 1, R).
factorial(0, 0, X, X).
factorial(0, N, X, R) :- 
    X1 is N*X,
    N1 is N-1,
    factorial(0, N1, X1, R).



    
