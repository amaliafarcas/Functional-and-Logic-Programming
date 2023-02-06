%1
add_tail([],X,[X]).
add_tail([H|T],X,[H|L]):-add_tail(T,X,L).


nrOfElements([H|T], N, C, R):- H=:=N,
    !,
    C1 is C+1,
    nrOfElements(T, N, C1, R).

nrOfElements([_|T], N, C, R):-
    nrOfElements(T, N, C, R).

nrOfElements([], _, C, C).

is_list(X) :-
        var(X), !,
        fail.
is_list([]).
is_list([_|T]) :-
        is_list(T).

is_not_list(X) :-
        var(X), !,
        true.
is_not_list([]) :- fail.
is_not_list([_|T]) :-
        is_list(T).

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



mergeListOfLists([H|T], List, R):- is_not_list(H),
    nrOfElements(List, H, 0, C),
    C<1, 
    add_tail(List, H, NL),
    %write(NL),
    mergeListOfLists(T, NL, R).

mergeListOfLists([H|T], List, R):-
    nrOfElements(List, H, 0, C),
    C>0,
    mergeListOfLists(T, List, R).

mergeListOfLists([H|T], List, R):- is_list(H),
    write(H),
    mergeList(H, List, R1),
    mergeListOfLists(T, R1, R).

mergeListOfLists([], List, List).
    


%2
%get_min(l1..ln, X) = X; n=0
%					  X=l1, get_min(l2..ln, X); l1<X, n>0
%					  get_min(l2..ln, X); otherwise
%					  

%get_min(L - list, M - min, X - result) - 
%        (i, i, o)

get_min([H|T], M, X):-
    H < M, !,
    get_min(T, H, X).

get_min([_|T], M, X):-
    get_min(T, M, X).

get_min([], M, X):- X is M.


%main_get_min(L - list, X - result)
%            (i, o)

main_get_min([H|T], X):- get_min(T, H, X).  


%get_pos(l1...ln, M, C) = null; n=0
%						  C |_| get_pos(l2...ln, M, C+1); l1 = M, n>0
% 						  get_pos(l2...ln, M, C+1); otherwise

%get_pos(L - list, M - min_of_list, C - counter, X - result)
%        (i, i, i, o)

get_pos([H|T], M, C, [C|X]):-
    H = M, !, 
    C1 is C+1,
    get_pos(T, M, C1, X).

get_pos([_|T], M, C, X):-
    C1 is C+1,
    get_pos(T, M, C1, X).

get_pos([], _, _, []).


%main_get_pos(L - list, X - result)
% 			 (o, i)

main_get_pos(L, X):-
    main_get_min(L, M),
    get_pos(L, M, 1, X).




%3
%get_min(l1..ln, X) = X; n=0
%					  X=l1, get_min(l2..ln, X); l1<X, n>0
%					  get_min(l2..ln, X); otherwise
%					  

%get_min(L - list, M - min, X - result) - 
%        (i, i, o)

get_min([H|T], M, X):-
    H < M, !,
    get_min(T, H, X).

get_min([_|T], M, X):-
    get_min(T, M, X).

get_min([], M, X):- X is M.


%main_get_min(L - list, X - result)
%            (i, o)

main_get_min([H|T], X):- get_min(T, H, X).  


%get_pos(l1...ln, M, C) = null; n=0
%						  C |_| get_pos(l2...ln, M, C+1); l1 = M, n>0
% 						  get_pos(l2...ln, M, C+1); otherwise

%get_pos(L - list, M - min_of_list, C - counter, X - result)
%        (i, i, i, o)

get_pos([H|T], M, C, [C|X]):-
    H = M, !, 
    C1 is C+1,
    get_pos(T, M, C1, X).

get_pos([_|T], M, C, X):-
    C1 is C+1,
    get_pos(T, M, C1, X).

get_pos([], _, _, []).


%main_get_pos(L - list, X - result)
% 			 (o, i)

main_get_pos(L, X):-
    main_get_min(L, M),
    get_pos(L, M, 1, X).


    
    
%4
% isConsecutive(L - list)
% isConsecutive(i)
% isConsecutive([l1,l2,..,ln]) = { true, L=[l1,l2] && l1+1=l2
%                                { isConsecutive(l2..ln), l1+1=l2 && n>2
%                                { false, otherwise
isConsecutive([X,Y]):-X+1=:=Y.
isConsecutive([H1,H2|T]):-H2=:=H1+1, isConsecutive([H2|T]).

%sumCons(S-the sum to be obtained, P-the number to start(1), X- Result List)
%sumCons(i,i,o)
%sumCons(S, P) = { P, if S = P
%                { P U sumCons(S, P+1), if S > P and P satisfies the cond of cons  
%				 { false, otherwise

sumCons(P, P, [P]).
sumCons(S, P, [P|X]):-
    S > P,
    P1 is P + 1,
    S1 is S-P,
    sumCons(S1,P1,X).

sumCons(S, P, X):-
    S > P,
    P1 is P+1,
    sumCons(S, P1, X).

sumCons(S, X):-
    sumCons(S,1,X), isConsecutive(X).

main(S, R):-
    findall(X, sumCons(S,X), R).




