%pb10
%b

alt_sum([], _, S, X):- X = S.

alt_sum([H|T], 1, S, X):-
    S1 is S-H, 
    alt_sum(T, 0, S1, X).

alt_sum([H|T], 0, S, X):-
    S1 is S+H, 
    alt_sum(T, 1, S1, X).
        
        
main_alt_sum([H|T], X):- alt_sum(   T, 1, H, X).