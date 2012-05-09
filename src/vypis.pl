/* -*- Mode:Prolog; coding:utf-8; -*- */

figurka(sfinga,0,0,dolu,cerveny).
figurka(anubis,5,0,dolu,cerveny).
figurka(faraon,6,0,dolu,cerveny).
figurka(anubis,7,0,dolu,cerveny).

vypis:-
        vypisRadek(0),
        write('+---+---+---+---+---+---+---+---+---+---+'), nl.

vypisRadek(Radek):-
        Radek < 8, !,
        write('+---+---+---+---+---+---+---+---+---+---+'), nl,
        vypisSloupec(Radek, 0), write('|'),nl,
        Radek2 is Radek +1,
        vypisRadek(Radek2).
vypisRadek(_).

vypisSloupec(Radek, Sloupec):-
        Sloupec < 10, !,
        write('|'),
        vypisFigurku(Radek,Sloupec),
        Sloupec2 is Sloupec +1,
        vypisSloupec(Radek, Sloupec2).
vypisSloupec(_,_).

vypisFigurku(Radek,Sloupec):-
        figurka(Typ, Sloupec, Radek, Smer, Barva),
        vypisTyp(Typ),
        vypisSmer(Smer),
        vypisBarvu(Barva).
vypisFigurku(_,_):-
        write('   ').

vypisTyp(sfinga):- write('S').
vypisTyp(anubis):- write('A').
vypisTyp(faraon):- write('F').
vypisTyp(scarab):- write('Q').
vypisTyp(pyramida):- write('P').

vypisSmer(nahoru):- write('^').
vypisSmer(dolu):- write('v').
vypisSmer(vlevo):- write('>').
vypisSmer(vpravo):- write('<').

vypisBarvu(cerveny):- write('#').
vypisBarvu(stribrny):- write('&').