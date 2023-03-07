%3.aSa se scrie un predicat care transforma o lista intr-o multime, in
% ordinea primei aparitii. Exemplu: [1,2,3,1,2] e transformat in [1,2,3].

%sterge(E:Intreg, L:Lista, LR:Lista);
%E:elementul care se doreste sa fie sters
%L:lista intiala, din care se va sterge elementul;
%LR:lista rezultata dupa stergerea elementului din lista initiala;
%Model de flux: (i,i,o);

sterge(_,[],[]):-!.
sterge(E,[E],[]):-!.
sterge(E,[H|T],[H|R]):- H=\=E, sterge(E,T,R).
sterge(E,[H|T],R):-H=:=E, sterge(E,T,R).


%multime(L:Lista, LR:Lista);
%L:lista initiala ce se doreste a fi modificata in multime;
%LR:lista rezultat, sub forma de multime,
%in functie de prima aparitie a elementelor;
%Model de flux: (i,o), (i,i);
multime([],[]):-!.
multime([H|T],[H|R]):-sterge(H,T,L), multime(L,R).

%3.bSa se scrie o functie care descompune o lista de numere intr-o lista
% de forma [ lista-de-numere-pare lista-de-numere-impare] (deci lista cu
% doua elemente care sunt liste de intregi), si va intoarce si numarul
% elementelor pare si impare.


%liste(L:Lista, P:Lista, I:Lista);
%Lista = Element*;
%Model de flux: (i,o,o), (i,i,i);
%L:lista care se doreste separata;
%P:lista formata din elemente pare din lista initiala;
%I:lista formata din elemente impare din lista initiala;
%
%Implementare PROLOG:


liste([],[],[]):-!.
liste([H|T],[H|P],I):- H1 is H mod 2, H1=:=0, liste(T,P,I), !.
liste([H|T], P, [H|I]):- H1 is H mod 2, H1=\=0, liste(T,P,I), !.

%lungime(L:Lista, N:Intreg);
%Lista = Element*;
%Model de fux: (i,o), (i,i);
%L:lista a carui lungime se doreste a fi calculata;
%N:lungimea listei;

lungime([],0):-!.
lungime([_|T], N1):- lungime(T,N), N1 is N+1,!.

%pare_impare(L:Lista, [P:Lista, I:Lista], NP:Intreg, NI:Intreg);
%model de flux (i,[o,o], o,o)
%L:lista intiala;
%P:lista de numere pare din lista initiala;
%I:lista de numere impare din lista initiala;
%NP:numarul elementelor pare din lista initiala;
%NI:numarul de elemente impare din lista initiala;


pare_impare(L, [P,I],NP,NI):- liste(L,P,I), lungime(P,NP), lungime(I,NI).



