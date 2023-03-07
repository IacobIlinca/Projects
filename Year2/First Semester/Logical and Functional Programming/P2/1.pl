%1.a) Definiti un predicat care determina suma a doua numere scrise in
%reprezentare de lista.

adauga_sf(E,[],[E]).
adauga_sf(E,[H|T],[H|L]):-adauga_sf(E,T,L).

invers([],[]).
invers([H|T],L):-invers(T,L1), adauga_sf(H,L1,L).

suma_aux([],[],[],_):-!.
suma_aux(C,[H|T],[M|L],N):-
	C = [],
	S is H+N,
	M is S mod 10,
	N1 is S div 10,!,
	suma_aux(C,T,L,N1).
suma_aux([H|T],C,[M|L],N):-
	C=[],
	S is H+N,
	M is S mod 10,
	N1 is S div 10,!,
	suma_aux(T,C,L,N1).
suma_aux([H|T],[H1|T1],[M|L],N):-
	N=0,
	S is H+H1,
	M is S mod 10,
	N1 is S div 10,
	suma_aux(T,T1,L,N1).
suma_aux([H|T],[H1|T1],[M|L],N):-
	N\=0,
	S is H+H1+N,
	M is S mod 10,
	N1 is M div 10,
	suma_aux(T,T1,L,N1).

suma([],[],[]):-!.
suma(L1,L2,R):-
	invers(L1,L11),
	invers(L2,L22),
	suma_aux(L11,L22,S,0),
	invers(S,R).
