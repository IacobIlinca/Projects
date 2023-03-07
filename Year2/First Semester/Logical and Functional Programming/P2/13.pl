%13.a) Sa se adauge dupa fiecare element dintr-o lista divizorii elementului.

div(N,N,[N]):-!.
div(N,D,[D|L]):-
	N mod D =:= 0,
	!,
	D1 is D+1,
	div(N,D1,L).
div(N,D,L):-
	N mod D =\= 0,
	!,
	D1 is D+1,
	div(N,D1,L).

diviz(N,L):-div(N,1,L).

adauga_sf(E,[],[E]).
adauga_sf(E,[H|T],[H|L]):-adauga_sf(E,T,L).

conca([],[],[]):-!.
conca([],L,L):-!.
conca(L,[],L):-!.
conca(L,[H|T],R):-adauga_sf(H,L,S),conca(S,T,R).

adauga([],[]):-!.
adauga([H|T],[H|R]):-
	diviz(H,M),
	adauga(T,S),
	conca(S,M,R).

