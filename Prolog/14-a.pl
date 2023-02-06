%14a

nrOcc([H|T], E, C, X):-
    E = H, !,
    C1 is C+1,
    nrOcc(T, E, C1, X).

nrOcc([_|T], E, C, X):-
    nrOcc(T, E, C, X).

nrOcc([], _, C, X):- X = C.


remOcc([H|T], E, L):-
    H = E, !,
    remOcc(T, E, L).

remOcc([H|T], E, [H|L]):-
    remOcc(T, E, L).

remOcc([], _, []).


%not working
equal_s([H|T], S):-
    nrOcc(H, S, 0, C),
    write(C),
	C=1, !,
	remOcc(S, H, NL),
    equal_s(T, NL).

equal_s([], []).