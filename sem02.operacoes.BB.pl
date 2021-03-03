%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Operacoes aritmeticas e conjuntos (listas).
% aplica uma operação aritmética (adição ou multiplicação) a um conjunto de valores

aritm([X], _,X).
aritm([H|T], '+', R):- aritm(T,'+',N), R is N+H.
aritm([H|T], '*', R):- aritm(T,'*',N), R is N*H.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado operacao para uma lista de valores e um valor: [X],N,operacao,OperacaoL -> {V,F}

merda([], _, _,[]).
merda([X|Xs], N, O,[Y|Ys]):- operacao(X,N,O,Y), merda(Xs, N, O, Ys).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado soma: X,Y,Soma -> {V,F}

soma( X,Y,Soma ) :- Soma is X+Y.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado soma: X,Y,Z,Soma -> {V,F}

soma2(X,Y,Z,Soma2) :- Soma2 is X+Y+Z.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado somatorio: [X],Soma -> {V,F}

somatorio([],0).
somatorio([H|T],X) :- somatorio(T,S), X is H + S.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado operacao: X,Y,Operacao,R -> {V,F}

operacao(X, Y, '+', R):- R is X+Y.
operacao(X, Y, '-', R):- R is X-Y.
operacao(X, Y, '*', R):- R is X*Y.
operacao(X, Y, '/', R):- Y \= 0, R is X/Y.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado maior: X,Y,maior -> {V,F}

maior(X,Y,X):- X>Y.
maior(X,Y,Y):- Y>X.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado maior para 3 valores: X,Y,Z,maior -> {V,F}

maior3(X,Y,Z,X):- X>Y, X>Z.
maior3(X,Y,Z,Y):- X<Y, Y>Z.
maior3(X,Y,Z,Z):- Z>Y, X<Z.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado maior para uma lista: [H|T],maior -> {V,F}

max([X],X).
max([H|T], H):- max(T,N), N<H.
max([H|T], N):- max(T,N), N>H.

% Extensao do predicado maior: X,Y,maior -> {V,F}

menor(X,Y,X):- X<Y.
menor(X,Y,Y):- Y<X.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado maior para 3 valores: X,Y,Z,maior -> {V,F}

menor3(X,Y,Z,X):- X<Y, X<Z.
menor3(X,Y,Z,Y):- X>Y, Y<Z.
menor3(X,Y,Z,Z):- Z<Y, X>Z.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado maior para uma lista: [H|T],maior -> {V,F}

min([X],X).
min([H|T], H):- min(T,N), N>H.
min([H|T], N):- min(T,N), N<H.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado media para uma lista: [H|T],maior -> {V,F}

len([],0).
len([_|T],L):- len(T,N), L is N+1.

media([H],H).
media(L,M):- aritm(L,+,S), len(L,T), M is S/T.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado que ordena de forma crescente uma lista: [H|T],ListaOrdenada -> {V,F}

inserec(X,[],[X]).
inserec(N,[H|T],[N,H|T]):- N=<H. 
inserec(X,[H|T],[H|L]):- X > H, inserec(X,T,L). 


cresc([X],[X]).
cresc([H|T],F):- cresc(T,N), inserec(H,N,F).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado que ordena de forma decrescente uma lista: [H|T],ListaOrdenada -> {V,F}

insered(X,[],[X]).
insered(N,[H|T],[N,H|T]):- N>=H. 
insered(X,[H|T],[H|L]):- X < H, insered(X,T,L). 


decresc([X],[X]).
decresc([H|T],F):- decresc(T,N), insered(H,N,F).
















