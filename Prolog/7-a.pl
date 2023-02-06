%pb7
%b

add_tail([],X,[X]).
add_tail([H|T],X,[H|L]):-add_tail(T,X,L).

nrOcc([], _, N, X):- X = N.

nrOcc([H|T], E, N, X):-
    H = E, !,
    N1 is N+1,
    nrOcc(T, E, N1, X).

nrOcc([_|T], E, N, X):-
    nrOcc(T, E, N, X).

intersect_sets([], _, R, X):- X = R.

intersect_sets([H|T], B, R, X):-
    nrOcc(B, H, 0, C),
    C > 0, !,
    add_tail(R, H, K),
    intersect_sets(T, B, K, X).

intersect_sets([_|T], B, R, X):-
    intersect_sets(T, B, R, X).