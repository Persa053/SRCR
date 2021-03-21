%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Programacao em logica estendida

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% PROLOG: definicoes iniciais

:- dynamic '-'/1.
:- dynamic mamifero/1.
:- dynamic morcego/1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Se a entidade X é uma ave então a característica do voo está presente nessa entidade

voa( X ) :- ave( X ),
            nao( excepcao( voa( X ) ) ).

-voa( X ) :- excepcao( voa( X ) ).

voa( X ) :- excepcao( -voa( X ) ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Se X é um mamífero então é mentira que X exiba a característica do voo

-voa( X ) :-  mamifero( X ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% O Tweety não voa

-voa( tweety ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% O Pitiguí é uma ave

ave( pitigui ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Os canários são aves

ave( X ) :- canario( X ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Os periquitos são aves;

ave( X ) :- periquito( X ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% O Silvestre é um mamífero

mamifero( silvestre ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Os cães são mamíferos;

mamifero( X ) :- cao( X ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Os gatos são mamíferos

mamifero( X ) :- gato( X ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% O Boby é um cão

cao( boby ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% As avestruzes são aves

ave( X ) :- avestruz( X ).
excepcao( voa( X ) ) :- avestruz( X ).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Os pinguins são aves

ave( X ) :- pinguim( X ).
excepcao( voa( X ) ) :- pinguim( X ).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% A Trux é uma avestruz

avestruz( trux ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% O Pingú é um pinguim

pinguim( pingu ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%Os morcegos são mamíferos

mamifero( X ) :- morcego( X ).
excepcao( -voa( X ) ) :- morcego( X ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% O Bateméne é um morcego

morcego( batemene ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Questao ) :- Questao, !, fail.
nao( Questao ).
