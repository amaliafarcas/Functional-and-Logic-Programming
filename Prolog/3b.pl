add_tail([],X,[X]).
add_tail([H|T],X,[H|L]):-add_tail(T,X,L).


nrOfElements([H|T], N, C, R):- H=:=N,
    !,
    C1 is C+1,
    nrOfElements(T, N, C1, R).

nrOfElements([_|T], N, C, R):-
    nrOfElements(T, N, C, R).

nrOfElements([], _, C, C).


is_list_p(X) :-
        var(X), !,
        fail.
is_list_p([]).
is_list_p([_|T]) :-
        is_list_p(T).

is_not_list(X) :-
        var(X), !,
        true.
is_not_list([]) :- fail.
is_not_list([_|T]) :-
        is_not_list(T).

mergeList([H|T], List, R):-
    nrOfElements(List, H, 0, C),
    C<1,
    add_tail(List, H, NL),
    mergeList(T, NL, R).

mergeList([H|T], List, R):-
    nrOfElements(List, H, 0, C),
    C>0,
    mergeList(T, List, R).

mergeList([], List, List).



mergeListOfLists([H|T], List, R):- number(H),
    nrOfElements(List, H, 0, C),
    C<1, 
    add_tail(List, H, NL),
    mergeListOfLists(T, NL, R).

mergeListOfLists([H|T], List, R):- number(H),
    nrOfElements(List, H, 0, C),
    C>0,
    mergeListOfLists(T, List, R).

mergeListOfLists([H|T], List, R):- is_list_p(H),
    mergeList(H, List, R1),
    mergeListOfLists(T, R1, R).

mergeListOfLists([], List, List).
    
