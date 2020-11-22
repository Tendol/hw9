/* bst.pl
 * Tenzin Dolma Gyalpo and Victoria Anna 
 * CS 313 hw9
 *
 * binary search trees of integers
 */

/* example trees */

mytree1(node(5, node(3, nil, nil),
                node(8, node(7, nil, nil),
                        node(9, nil, nil)))).
mytree2(node(2, node(1, nil, nil), T)) :-
  mytree1(T).

/* printing */

show(T) :- show1(T, 0).

show1(nil, _).
show1(node(N, L, R), Indent) :-
  Indent2 is Indent + 4,
  show1(R, Indent2),
  tab(Indent),
  writeln(N),
  show1(L, Indent2).

/* testing for membership */

find(X, node(X, _, _)).
find(X, node(N, L, _)) :-
  X<N,
  find(X, L).
find(X, node(N, _, R)) :-
  X>N,
  find(X, R).

/* Insert node at the root */
insert(N, nil, node(N, nil, nil)).

/* if the node is already in the tree do nothing */
insert(N, node(X,L, R), node(X, L, R)) :- 
  N = X.

/* insert node in the left sub tree if N < X */
insert(N, node(X,L, R), node(X, Result, R)) :- 
  N < X,
  insert(N, L, Result).

/* insert node in the right sub tree if N > X */
insert(N, node(X,L, R), node(X, L, Result)) :- 
  N > X,
  insert(N, R, Result).

/* if N is a leaf, return nil */
remove(N, node(N, nil, nil), nil).

/* if N has only has left child */
remove(N, node(N, node(L, nil, nil), nil), node(L, nil, nil)).

/* if N has only has right child */
remove(N, node(N, nil, node(R, nil, nil)), node(R, nil, nil)).

/* else find the N in the left sub tree  */
remove(N, node(X, L, R), node(Result, L, R)) :- 
  N < X, 
  remove(N, L, Result).

/* else find the N in the right sub tree */ 
remove(N, node(X, L, R), node(X, L, Result)) :- 
  N > X, 
  remove(N, R, Result).
  
/* if N has two children */
remove(N, node(N, L, R), node(M, Result, R)) :- 
  /* find the right most in the left subtree*/
  right_most(L, Result, M).

right_most(node(T, L, nil), nil, T).
right_most(node(T, L, R), node(T, L, Result), M) :- 
  right_most(R, Result, M).


/* sample output:

?- show(node(6, node(3, nil, nil), node(7, nil, nil))).
    7
6
    3

?- mytree1(T), show(T).
        9
    8
        7
5
    3

T = node(5, node(3, nil, nil), node(8, node(7, nil, nil), node(9, nil, nil))) 

?- mytree2(T), show(T).
            9
        8
            7
    5
        3
2
    1

T = node(2, node(1, nil, nil), node(5, node(3, nil, nil), node(8, node(7, nil, nil), node(9, nil, nil)))) 

?- mytree1(T), find(7, T).

T = node(5, node(3, nil, nil), node(8, node(7, nil, nil), node(9, nil, nil))) 

Yes

?- mytree2(T), find(4, T).

No

*/