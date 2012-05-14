/* -*- Mode:Prolog; coding:iso-8859-1; -*- */

:- dynamic figurka/5 .

:- consult('vypis.pl').
/*:- consult('otevreni.pl').
:- consult('hra.pl').*/
:- consult('laser.pl').

khet:-
        nacti('classic.pl'),
        hraj.
        
khet(Soubor):-
        nacti(Soubor),
        hraj.


hraj:-
        vypis,
        vyhodnot_laser(cerveny),
        vypis,
        vyhodnot_laser(stribrny),
        vypis,
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
