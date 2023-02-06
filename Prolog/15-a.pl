%pb15
%a

nrOcc([], _, N, X):- X = N.

nrOcc([H|T], E, N, X):-
    H = E, !,
    N1 is N+1,
    nrOcc(T, E, N1, X).

nrOcc([_|T], E, N, X):-
    nrOcc(T, E, N, X).

add_tail([],X,[X]).
add_tail([H|T],X,[H|L]):-add_tail(T,X,L).

t_list([], R, X):- X=R.

t_list([H|T], R, X):-
    nrOcc(R, H, 0, C),
    C = 0, !,
    add_tail(R, H, R1),
    t_list(T, R1, X).

t_list([_|T], R, X):-
    t_list(T, R, X).