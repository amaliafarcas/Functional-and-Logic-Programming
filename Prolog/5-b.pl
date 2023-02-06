%pb5
 %b

add_tail([],X,[X]).
add_tail([H|T],X,[H|L]):-add_tail(T,X,L).

get_pair([], _, []).

get_pair([H|T],  N, [NH|L]):-
    add_tail([N], H, NH),
    get_pair(T, N, L).

make_pairs([H|T], [NL|L]):-
    get_pair(T, H, NL),
    make_pairs(T, L).

make_pairs([], []).