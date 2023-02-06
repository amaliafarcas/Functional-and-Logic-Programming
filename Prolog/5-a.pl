%pb5
%a

add_tail([],X,[X]).
add_tail([H|T],X,[H|L]):-add_tail(T,X,L).

nrOcc([], _, N, X):- X = N.

nrOcc([H|T], E, N, X):-
    H = E, !,
    N1 is N+1,
    nrOcc(T, E, N1, X).

nrOcc([_|T], E, N, X):-
    nrOcc(T, E, N, X).

add_list([H|T], R, X):-
    nrOcc(R, H, 0, NR), 
    NR = 0, !,
    add_tail(R, H, C),
    add_list(T, C, X).

add_list([_|T], R, X):-
    add_list(T, R, X).

add_list([], R, X):- X = R.

union_sets(A, B, X):-
    add_list([], A, C),
    
    add_list(C, B, D),
    X = D.