/* -*- Mode:Prolog; coding:iso-8859-1; -*- */

% pripojeni souboru s dalsimi funkcemi pro hru
:- consult('vypis.pl').
:- consult('nacitani.pl').
:- consult('hra.pl').
:- consult('laser.pl').

% spusteni khet bez parametru spusti hru se stadartnim rozestavenim
khet:-
        nacti('classic.pl'),!,
        hraj,
        smazFigurky.
khet:-
        smazFigurky.
%        write('Poskozeny soubor classic.pl!'),nl.

%spusteni hry khet s jinym nez defaultnim rozestavenim
% napriklad imhotep, dynasty nebo vlastnim rozestavenim        
khet(Soubor):-
        nacti(Soubor),!,
        hraj,
        smazFigurky.
khet(_):-
        smazFigurky.
%        write('Chyba nacitani souboru '),write(Soubr),nl.

smazFigurky:-
        repeat,
                \+ retract(figurka(_,_,_,_,_)),
        !.
        

hraj:-
        \+ hraj(cerveny),
		  vypis,
        konecHry.
     
hraj(Barva):-
        vypis,
        tah(Barva),
        vyhodnot_laser(Barva),!,
        figurka(faraon,_,_,_,cerveny),
        figurka(faraon,_,_,_,stribrny),
        druhaBarva(Barva,DruhaBarva),!,
        hraj(DruhaBarva).

konecHry:-
        figurka(faraon,_,_,_,cerveny),!,
        write('Cerveny vyhral!').
konecHry:-
        write('Stribrny vyhral!').

druhaBarva(cerveny,stribrny).
druhaBarva(stribrny,cerveny).
        
