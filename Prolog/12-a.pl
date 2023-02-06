%12a

app_l([], L, L).

app_l([H|T], L, [H|X]):-
    app_l(T, L, X).

%not working
repalace_l([], _, _, []).

replace_l([H|T], E, L, X):-
    E =:= H,
    app_l(L, T, P),
    replace_l(P, E, L, X).

replace_l([H|T], E, L, [H|X]):-
    E =\= H,
    replace_l(T, E, L, X).
