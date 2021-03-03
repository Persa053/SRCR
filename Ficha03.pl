%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Operacoes sobre listas.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado «diferentes» que calcula a quantidade de elementos diferentes existentes numa lista: Lista,ElementosDif -> {V,F}

diff([], 0).
diff([H|T], X) :- pertence(H,T), diff(T, X).
diff([_|T], X) :- diff(T, N), X is N+1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pertence: Elemento,Lista -> {V,F}

pertence( X,[X|_] ).
pertence( X,[Y|L] ) :- X \= Y, pertence( X,L ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado comprimento: Lista,Comprimento -> {V,F}

comprimento( [], 0).
comprimento( [_|L], N) :- comprimento( L, N1), N is N1+1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado «apaga1» que apaga a primeira ocorrência de um elemento de uma lista: Elemento,Lista,Resultado -> {V,F}

apagal(_, [], []).
apagal(E, [H|T],T) :- E =:= H.
apagal(E, [X|Xs], [X|Ys]) :- E \= X, apagal(E,Xs,Ys).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado «apagaT» que apaga todas as ocorrências de um dado elemento numa lista: Elemento,Lista,Resultado -> {V,F}

apagaT(_, [], []).
apagaT(E, [X|Xs], L) :- E =:= X, apagaT(E, Xs, L).
apagaT(E, [X|Xs], [X|T]) :- E \= X, apagaT(E, Xs, T).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado «adicionar» que insere um elemento numa lista, sem o repetir: Elemento,Lista,Resultado -> {V,F}

add(E,L,L) :- pertence(E,L).
add(E, L, [E|L]).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado «concatenar», que resulta na concatenação dos elementos da lista L1 com os elementos da lista L2: Lista1,Lista2,Resultado -> {V,F}

concat([], L, L).
concat([H|T], L, R) :- add(H, N, R), concat(T, L, N).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado «inverter» que inverte a ordem dos elementos de uma lista: Lista,Resultado -> {V,F}

inverter([X], [X]).
inverter([H|T], R) :- inverter(T, L), concat(L, [H], R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado sublista: SubLista,Lista -> {V,F}

pref([], _).
pref([H|T], [X|Xs]) :- H =:= X, pref(T, Xs).

sublista([], _).
sublista([H|T], [X|Xs]) :- H =:= X,  pref(T, Xs).
sublista([_|T], L) :- sublista(T, L).
