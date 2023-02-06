%11a


getNth([_|T], C, X):-
    C > 1, !,
    C1 is C-1,
    getNth(T, C1, X).

getNth([H|_], 1, X):- X = H.

replace([H|T], N, L, M, [H|X]):-
    N > 1, 
    N1 is N - 1,
    replace(T, N1, L, M, X).

replace([_|T], N, L, M, [K|X]):-
    N = 1, !,
    getNth(L, M, K),
    N1 is N - 1,
    replace(T, N1, L, M, X).

replace([H|T], N, L, M, [H|X]):-
    N = 0, 
    replace(T, N, L, M, X).

replace([], _, _, _, []).

main_r(L, N, M, X):- replace(L, N, L, M, X).
    