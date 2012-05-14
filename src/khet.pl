/* -*- Mode:Prolog; coding:iso-8859-1; -*- */

:- dynamic figurka/5 .

% pripojeni souboru s dalsimi funkcemi pro hru
:- consult('vypis.pl').
:- consult('nacitani.pl').
:- consult('hra.pl').
:- consult('laser.pl').

% spusteni khet bez parametru spusti hru se stadartnim rozestavenim
khet:-
        nacti('classic.pl'),!,
        hraj.
%khet:-
%        write('Poskozeny soubor classic.pl!'),nl.

%spusteni hry khet s jinym nez defaultnim rozestavenim
% napriklad imhotep, dynasty nebo vlastnim rozestavenim        
khet(Soubor):-
        nacti(Soubor),!,
        hraj.
%khet(Soubor):-
%        write('Chyba nacitani souboru '),write(Soubr),nl.


hraj:-
        vypis,
        tah(cerveny),
        vyhodnot_laser(cerveny),
        vypis,
        tah(stribrny),
        vyhodnot_laser(stribrny),
        vypis,
        tah(cerveny),
        vyhodnot_laser(cerveny),
        vypis,
        retract(figurka(_,_,_,_,_)).        