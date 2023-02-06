%a
%insert elem on nth pos
head([H|_], H).
removehead([_|Tail], Tail).


concat([],L2,L2). 
concat([Head|Tail],L2,[Head|L3]) :- concat(Tail,L2,L3).

add_tail([],X,[X]).
add_tail([H|T],X,[H|L]):-add_tail(T,X,L).


addNth(List, Elem, Pos, NewList):- length(List, 0),
	write(NewList).

addNth(List, Elem, Pos, NewList):- Pos=1, 
    K is Pos - 1,
    add_tail(NewList, Elem, N),
	addNth(List, Elem, K, N).

addNth(List, Elem, Pos, NewList):- 
    K is Pos-1,
    head(List, X), 
    removehead(List, Y),
    add_tail(NewList, X, N),
    addNth(Y, Elem, K, N).



%b
%gcd on a list
gcd(A,B,X):- A=0,X=B. % base case
gcd(A,B,X):- B=0,X=A. % base case
gcd(A,B,X):- A>B, gcd(B, A, X).
gcd(A,B,X):- A<B, T is B mod A, gcd(A, T, X).

head([H|_], H).
removehead([_|Tail], Tail).

gcdl(A,T,X):- A=1,X=1.
gcdl(A,T,X):- T=[], X=A.
gcdl(A,T,X):- head(T, D), removehead(T, Y), C is gcd(A,D), gcdl(C, Y, X).
