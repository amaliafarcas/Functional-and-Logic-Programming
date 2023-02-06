add_tail([],X,[X]).
add_tail([H|T],X,[H|L]):-add_tail(T,X,L).


nrOfElements([H|T], N, C, R):- H=:=N,
    !,
    C1 is C+1,
    nrOfElements(T, N, C1, R).

nrOfElements([_|T], N, C, R):-
    nrOfElements(T, N, C, R).

nrOfElements([], _, C, C).


mergeLists([H|T], SecondList, List, R):-
    nrOfElements(List, H, 0, C),
    C<1,
    add_tail(List, H, NL),
    mergeLists(T, SecondList, NL, R).

mergeLists([H|T], SecondList, List, R):-
    nrOfElements(List, H, 0, C),
    C>0,
    mergeLists(T, SecondList, List, R).

mergeLists([], [H|T], List, R):-
    nrOfElements(List, H, 0, C),
    C<1,
    add_tail(List, H, NL),
    mergeLists([], T, NL, R).

mergeLists([], [H|T], List, R):-
    nrOfElements(List, H, 0, C),
    C>0,
    mergeLists([], T, List, R).

mergeLists([], [], List, List).

