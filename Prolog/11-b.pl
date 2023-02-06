%pb11
%b

add_tail([],X,[X]).
add_tail([H|T],X,[H|L]):-add_tail(T,X,L).

c_sub([H|T], N, C, R, X):-
    C < N, !,
    add_tail(R, H, P),
    C1 is C+1,
    c_sub(T, N, C1, P, X).

c_sub(_, N, N, R, X):- X = R.

c_sub([], _, _, R, X):- X = R.