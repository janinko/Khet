/* -*- Mode:Prolog; coding:iso-8859-1; -*- */

vypis:-
        write('     0    1    2    3    4    5    6    7    8    9  '), nl,
        vypisRadek(0),
        write('  +----+----+----+----+----+----+----+----+----+----+'), nl,
        flush_output.

vypisRadek(Radek):-
        Radek < 8, !,
        write('  +----+----+----+----+----+----+----+----+----+----+'), nl,
        write(Radek),write(' '),
        vypisSloupec(Radek, 0), write('|'),
        vypisPopisek(Radek),
        nl,
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
vypisFigurku(Radek,Sloupec):-
        laser(Sloupec,Radek, Smer),
        vypisLaser(Smer).
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

vypisLaser(dolu):- write(' |. ').
vypisLaser(nahoru):- write(' |\' ').
vypisLaser(doleva):- write(' <- ').
vypisLaser(doprava):- write(' -> ').

vypisBarvu(cerveny):- write('#').
vypisBarvu(stribrny):- write('&').


vypisPopisek(0):- write('     S - sfiga').
vypisPopisek(1):- write('     A - anubis').
vypisPopisek(2):- write('     F - faraon').
vypisPopisek(3):- write('     P - pyramida').
vypisPopisek(4):- write('     Q - scarab').
vypisPopisek(5):- write('     # - cerveny').
vypisPopisek(6):- write('     & - stribrny').
vypisPopisek(_).