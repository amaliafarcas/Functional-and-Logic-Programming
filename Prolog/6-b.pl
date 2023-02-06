%pb6
%b

remOcc3([H|T], E, C, L):-
    H = E, 
    C>0, !,
    C1 = C-1,
    remOcc3(T, E, C1, L).

remOcc3([H|T], E, C, [H|L]):-
    remOcc3(T, E, C, L).

remOcc3([], _, _, []).
