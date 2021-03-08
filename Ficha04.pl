%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado que caracterize os números naturais: N -> {V,F}

natural(1).
natural(X) :- X < 0, !, fail.
natural(X) :- N is X-1, N >= 1, natural(N).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado que caracterize os números inteiros: N -> {V,F}

inteiro(0).
inteiro(X) :- X > 0, N is X-1, N >= 0, inteiro(N).
inteiro(X) :- N is X+1, N =< 0, inteiro(N).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado par: N -> {V,F}

par( 0 ).
par( X ) :- N is X-2, N >= 0, par( N ).

par(N):- N mod 2 =:= 0.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado impar: N -> {V,F}

impar( 1 ).
impar( X ) :- N is X-2, N >= 1, impar( N ).

impar(N):- N mod 2 =:= 1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Questao ) :- Questao, !, fail.
nao( _ ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicadoo que determine os divisores de um número natural: N -> {V,F}

divisores(X, L) :- divisores(X, X, L).

divisores(_,1,[1]).
divisores(X, Y,[Y|L]) :- Y > 0, X mod Y =:= 0, YY is Y-1, divisores(X, YY, L).
divisores(X, Y, L) :- Y > 0, X mod Y =\= 0, YY is Y-1, divisores(X, YY, L).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicadoo que verifica se um número natural é primo: N -> {V,F}

primo(X) :-natural(X), divisores(X, L), length(L, 2).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado que calcule o m.d.c. entre 2 números naturais: N1,N2,MDC -> {V,F}

mdc(X,X,X).
mdc(X,Y,R) :- X > Y, N is X-Y, mdc(N,Y,R).
mdc(X,Y,R) :- X < Y, N is Y-X, mdc(X,N,R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado que calcule o m.m.c. entre 2 números naturais: N1,N2,MMC -> {V,F}

mmc(X,X,X).
mmc(X,Y,R) :- X > Y, N is X * Y, mdc(X, Y, Z), R is N / Z.
mmc(X,Y,R) :- Y > X, N is Y * X, mdc(X, Y, Z), R is N / Z.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado  que, dado o índice de fibonacci permita identificar o respetivo número da sequência de fibonacci: indice, fibonnaci -> {V,F}

fib(0,0).
fib(1,1).
fib(X,R) :- N1 is X-1, N2 is X-2, fib(N1,R1), fib(N2,R2), R is R1 + R2.
fib(X):- X < 0, !, fail.
