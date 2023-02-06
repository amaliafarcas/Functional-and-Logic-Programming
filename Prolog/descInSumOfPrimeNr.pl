isPrime(N, D):- D>N/2, !.
isPrime(N, D):- N mod D =\= 0,
    D1 is D+1, !,
    isPrime(N, D1).

isPrime(N):- N > 1,
    isPrime(N, 2).
    
sumPrime(P, P, [P]) :- 
    isPrime(P).

sumPrime(S, P, L) :- 
    S > P, 
    \+ isPrime(P),
    P1 is P + 1,
    sumPrime(S, P1, L).

sumPrime(S, P, [P|L]) :-
    S > P,
    isPrime(P),
    P1 is P + 1,
    S1 is S - P,
    sumPrime(S1, P1, L).

sumPrime(S, P, L) :-
    S > P,
    isPrime(P),
    P1 is P + 1,
    sumPrime(S, P1, L).

sumPrime(S, L) :- sumPrime(S, 2, L).

main(S, R):- findall(X, sumPrime(S, X), R).
