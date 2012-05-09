/* -*- Mode:Prolog; coding:iso-8859-1; -*- */

:- consult('vypis.pl').
:- consult('otevreni.pl').
:- consult('hra.pl').
:- consult('laser.pl').

khet:-
        nacti('classic.pl'),
        hraj.
        
khet(Soubor):-
        nacti(Soubor),
        hraj.


hraj.