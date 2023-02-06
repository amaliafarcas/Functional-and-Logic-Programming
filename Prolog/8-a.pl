%8a

is_even([_, _|T]):-
    is_even(T).

is_even([]):-
    true.

is_even(_):- false.