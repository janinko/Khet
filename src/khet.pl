/* -*- Mode:Prolog; coding:iso-8859-1; -*- */

:- dynamic figurka/5 .

:- consult('vypis.pl').
/*:- consult('otevreni.pl').*/
:- consult('hra.pl').
:- consult('laser.pl').

khet:-
        nacti('classic.pl'),!,
        hraj.
%khet:-
%        write('Poskozeny soubor classic.pl!'),nl.
        
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

nacti( Soubor ) :-
        seeing( StarySoubor ),
        see( Soubor ),
        repeat,
                read( Term ), 
                process_term( Term ), 
                Term == end_of_file, 
        !,
        seen, 
        see( StarySoubor ). 

process_term(Term):-
        assert(Term).



nacti(Soubor):-
        read(Term),
        nactiTerm(Term). 
        
        
        
nactiTerm(end_of_file).
nactiTerm(Term):-
        processTerm(Term),
        read(NewTerm),
        nactiTerm(NewTerm).
        