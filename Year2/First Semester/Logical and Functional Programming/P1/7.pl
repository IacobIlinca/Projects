%7.a. Sa se scrie un predicat care intoarce reuniunea a doua multimi.
%b. Sa se scrie un predicat care, primind o lista, intoarce multimea
%tuturor perechilor din lista. De ex, cu [a, b, c, d] va produce
%[[a, b], [a, c], [a, d], [b, c], [b, d], [c, d]].

%a.
%apartine(E:Integer, L:List).
apartine(E,[E|_]):-!.
apartine(E,[_|T]):- apartine(E,T).

%reuniune(L1:List, L2:List, LR:List).
reuniune([],T1,T1).
reuniune([H|T],L2,[H|T1]):-
	not(apartine(H,L2)),
	!,
	reuniune(T,L2,T1).
reuniune([_|T],L2,T1):- reuniune(T,L2,T1).

%b.
%pereche(E:Integer, L:List, LR:List).
pereche(E,[H|_],[E,H]):- E\=H.
pereche(E,[_|T],P):-pereche(E,T,P).

%perechi(L:List, LR:List).
perechi([H|T],P):-pereche(H,T,P).
perechi([_|T],P):-perechi(T,P).
