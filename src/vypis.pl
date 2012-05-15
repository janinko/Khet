/* -*- Mode:Prolog; coding:iso-8859-1; -*- */
% author: xrejta, xbrazdi1

% vykreslovani hraciho pole na obrazovku
vypis:-
        write('     0    1    2    3    4    5    6    7    8    9  '), nl,
        vypisRadek(0),
        write('  +----+----+----+----+----+----+----+----+----+----+'), nl,
        flush_output.

% vypisovani radku mezi poli
vypisRadek(Radek):-
        Radek < 8, !,
        write('  +----+----+----+----+----+----+----+----+----+----+'), vypisPopisek(Radek,a),nl,
        write(Radek),write(' '),
        vypisSloupec(Radek, 0), write('|'),
        vypisPopisek(Radek,b),
        nl,
        Radek2 is Radek +1,
        vypisRadek(Radek2).
vypisRadek(_).

%vypisovani sloupcu mezi poli
vypisSloupec(Radek, Sloupec):-
        Sloupec < 10, !,
        write('|'),
        vypisFigurku(Radek,Sloupec),
        Sloupec2 is Sloupec +1,
        vypisSloupec(Radek, Sloupec2).
vypisSloupec(_,_).

%vypisovani figurky do pole
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

vypisSmer(scarab,nahoru):-!, write(' /').
vypisSmer(scarab,dolu):-!, write(' \\').
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


vypisPopisek(0,a):- write('     S - sfiga').
vypisPopisek(0,b):- write('     A - anubis').
vypisPopisek(1,a):- write('     F - faraon').
vypisPopisek(1,b):- write('     P - pyramida').
vypisPopisek(2,a):- write('     Q - scarab').
vypisPopisek(2,b):- write('     # - cerveny').
vypisPopisek(3,a):- write('     & - stribrny').
vypisPopisek(4,a):- write('  Pohyb a rotace:').
vypisPopisek(4,b):- write('     u k i     7 8 9').
vypisPopisek(5,a):- write('      \\|/       \\|/').
vypisPopisek(5,b):- write('     h- -l     4- -6').
vypisPopisek(6,a):- write('      /|\\       /|\\').
vypisPopisek(6,b):- write('     n j m     1 2 3').
vypisPopisek(7,a):- write('  > podle hodinovych rucicek').
vypisPopisek(7,b):- write('  < proti hodinovym rucickam').
vypisPopisek(_,_).