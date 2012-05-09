/* -*- Mode:Prolog; coding:iso-8859-1; -*- */

:- consult('vypis.pl').
:- consult('otevreni.pl').

khet:-
        nacti('classic.pl'),
        hraj.
        
khet(Soubor):-
        nacti(Soubor),
        hraj.


hraj.