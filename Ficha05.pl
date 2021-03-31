%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariantes

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% flags iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown, fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% PROLOG: definicoes iniciais
% para poder alterar a cenas de conhecimento

:- op( 900,xfy,'::' ).
:- dynamic filho/2.
:- dynamic pai/2.
:- dynamic neto/2.
:- dynamic avo/2.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado filho: Filho,Pai -> {V,F,D}

filho( joao,jose ).
filho( jose,manuel ).
filho( carlos,jose ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extens�o do predicado que permite a evolucao do conhecimento

evolucao( Termo ) :- solucoes(Invariante, +Termo::Invariante, Lista),
                     insercao( Termo ),
                     teste( Lista ).

insercao( Termo ) :- assert( Termo ).
insercao( Termo ) :- retract( Termo ), !, fail.

teste( [] ).
teste( [R|LR] ) :- R, teste( LR ).

solucoes(X, Y, Z) :- findall(X, Y, Z).

comprimento([], 0).
comprimento([_|T], R) :- comprimento(T, N), R is N+1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante Estrutural:  nao permitir a insercao de conhecimento repetido
% Não pode existir mais do que uma ocorrência da mesma evidência na relação filho/2;

+filho( F,P ) :: (solucoes( (F,P), (filho( F, P )), S ),
                  comprimento( S, N ),
                  N == 1).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Não pode existir mais do que uma ocorrência da mesma evidência na relação pai/2

+pai( P, F ) :: (solucoes( (P,F), pai( P, F ), S ),
                 comprimento( S, N ),
                 N == 1).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Não pode existir mais do que uma ocorrência da mesma evidência na relação neto/2

+neto( N, A ) :: (solucoes( (N,A), neto( N, A ), S ),
                  comprimento( S, X ),
                  X == 1).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Não pode existir mais do que uma ocorrência da mesma evidência na relação avo/2
+avo( A, N ) :: (solucoes( (A,N), avo( A, N ), S ),
                  comprimento( S, X ),
                  X == 1).
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Não pode existir mais do que uma ocorrência da mesma evidência na relação descendentes/3
% descendentes(descendente, man, grau de desscendencia)
+descendentes( D, M, G ) :: (solucoes( (D, M, G), descendentes( D, M, G), S ),
                             comprimento( S, X ),
                             X == 1).


 %--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante Referencial:Não podem existir mais do que 2 progenitores para um dado indivíduo, na relação filho/2;

+filho( F, _ ) :: ( solucoes( Ps, (filho( Ps, F )), S), comprimento(S, N), N =< 2).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante Referencial: nao admitir mais do que 2 progenitores para um mesmo individuo, na relação pai/2;

+pai( _,F ) :: ( solucoes( Ps, (pai( Ps, F )), S), comprimento(S, N), N =< 2).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante Referencial: nao admitir mais do que 2 progenitores para um mesmo individuo, na relação avo/2;

+avo( _,N ) :: ( solucoes( As, (avo( As, N )), S), comprimento(S, N), N =< 4).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante Referencial: Não podem existir mais do que 4 indivíduos identificados como avô na relação neto/2;

+neto( N,_ ) :: ( solucoes( As, (neto( N, As )), S), comprimento(S, N), N =< 4).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante Referencial: A identificação do grau de descendência na relação descendente/3 deverá pertencer ao conjunto dos números naturais .

+descendentes(_, _, G) :: intenger(G).
