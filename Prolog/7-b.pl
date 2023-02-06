%pb7
%b

make_list(A, B, [A|L]):-
    A < B,
    A1 is A+1,
    make_list(A1, B, L).

make_list(B, B, [B]).
