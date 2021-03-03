%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Base de Conhecimento com informacao genealogica.

masculino(joao).
masculino(jose).
feminino(maria).
feminino(joana). 

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado filho: Filho,Pai -> {V,F}

filho( joao,jose ).
filho( jose,manuel ).
filho( carlos,jose ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pai: Pai,Filho -> {V,F}

pai( P,F ) :- filho( F,P ).
pai( paulo,filipe ).
pai( paulo,maria ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado avo: Avo,Neto -> {V,F}

avo( A,N ) :- descendente( N,A,2 ).
avo( A,N ) :- filho( X,A ), filho( N,X ).
avo( antonio,nadia ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%Extensao do predicado neto: Neto,Avo -> {V,F}

neto( N,A ) :- avo( A,N ).
neto( nuno,ana ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado trisavo: trisavo,trisneto -> {V,F}

trisavo( X,Y ) :- descendente( Y,X,4 ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado bisavo: tetraneto,tetraavo -> {V,F}

tetraneto( X,Y ) :- descendente( X,Y,5 ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado bisavo: Bisavo,Bisneto -> {V,F}

bisavo( X,Y ) :- descendente( Y,X,3 ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente -> {V,F}

descendente( X,Y ) :- filho( X, Y).
descendente( X,Y ) :- filho( X, P), descendente( P,Y ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente,Grau -> {V,F}

descendente( X,Y,1 ) :- filho( X,Y ).
descendente( X,Y,I ) :- filho(X,P), descendente( P,Y,N ), I is N + 1.

