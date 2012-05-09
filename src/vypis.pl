/* -*- Mode:Prolog; coding:iso-8859-1; -*- */

vypis:-
        vypisRadek(0),
        write('+----+----+----+----+----+----+----+----+----+----+'), nl.

vypisRadek(Radek):-
        Radek < 8, !,
        write('+----+----+----+----+----+----+----+----+----+----+'), nl,
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
        vypisBarvu(Barva),
        vypisSmer(Typ,Smer).
vypisFigurku(_,_):-
        write('    ').

vypisTyp(sfinga):- write('S').
vypisTyp(anubis):- write('A').
vypisTyp(faraon):- write('F').
vypisTyp(scarab):- write('Q').
vypisTyp(pyramid):- write('P').

vypisSmer(scarab,nahoru):-!, write('/ ').
vypisSmer(scarab,dolu):-!, write('\\ ').
vypisSmer(pyramid,dolu):-!, write('|/').
vypisSmer(pyramid,doleva):-!, write('\\|').
vypisSmer(pyramid,nahoru):-!, write('/|').
vypisSmer(pyramid,doprava):-!, write('|\\').
vypisSmer(_,nahoru):- write(' ^').
vypisSmer(_,dolu):- write(' v').
vypisSmer(_,doleva):- write(' <').
vypisSmer(_,doprava):- write(' >').

vypisBarvu(cerveny):- write('#').
vypisBarvu(stribrny):- write('&').