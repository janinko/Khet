/* -*- Mode:Prolog; coding:iso-8859-1; -*- */
% author: xrejta, xbrazdi1

:- dynamic laser/3 .
:- use_module(library(system)).

% procedura pro vyhodnocovani laseru   
vyhodnot_laser(Barva):-
        figurka(sfinga,X,Y,Smer,Barva),
        dalsi_pozice(X,Y,X2,Y2,Smer),
        \+ posunLaseru(X2,Y2,Smer).
        
                          
% posunLaserua laser na ziskane souradnice
% pokud je pole prazdne vypise laser
% pokud je na pole obsazene figurkou tak vyhodnoti zasah
posunLaseru(X,Y,Smer):-
        X >= 0, Y>= 0, X<10, Y<8,
        vypisLaser(X,Y,Smer),
        figurka(Typ,X,Y,SmerF,_),!,
        vyhodnot(Typ,SmerF,Smer,NovySmer,X,Y),
        dalsi_pozice(X,Y,X2,Y2,NovySmer),!,
        posunLaseru(X2,Y2,NovySmer).
posunLaseru(X,Y,Smer):-
        X >= 0, Y>= 0, X=<10, Y=<8, !,
        dalsi_pozice(X,Y,X2,Y2,Smer),
        posunLaseru(X2,Y2,Smer).

% graficke vykreslovani laseru
vypisLaser(X,Y,Smer):-
        assert(laser(X,Y,Smer)),
        vypis,
        sleep(0.5),
        retract(laser(X,Y,Smer)), !.

%vypocet poli pro posunuti lasru
dalsi_pozice(X,Y,X2,Y,doprava):- X2 is X +1.
dalsi_pozice(X,Y,X2,Y,doleva):-  X2 is X -1.
dalsi_pozice(X,Y,X,Y2,dolu):-    Y2 is Y +1.
dalsi_pozice(X,Y,X,Y2,nahoru):-  Y2 is Y -1.

%databaze pro vyhodnoceni zasahu laseru a odrazu
vyhodnot(pyramid,dolu,doleva,dolu,_,_).
vyhodnot(pyramid,dolu,nahoru,doprava,_,_).
vyhodnot(pyramid,doleva,doprava,dolu,_,_).
vyhodnot(pyramid,doleva,nahoru,doleva,_,_).
vyhodnot(pyramid,nahoru,doprava,nahoru,_,_).
vyhodnot(pyramid,nahoru,dolu,doleva,_,_).
vyhodnot(pyramid,doprava,dolu,doprava,_,_).
vyhodnot(pyramid,doprava,doleva,nahoru,_,_).
vyhodnot(scarab,nahoru,doleva,dolu,_,_).
vyhodnot(scarab,nahoru,nahoru,doprava,_,_).
vyhodnot(scarab,nahoru,dolu,doleva,_,_).
vyhodnot(scarab,nahoru,doprava,nahoru,_,_).
vyhodnot(scarab,dolu,doleva,nahoru,_,_).
vyhodnot(scarab,dolu,nahoru,doleva,_,_).
vyhodnot(scarab,dolu,dolu,doprava,_,_).
vyhodnot(scarab,dolu,doprava,dolu,_,_).
vyhodnot(anubis,dolu,nahoru,_,_,_):- !, fail.
vyhodnot(anubis,doleva,doprava,_,_,_):- !, fail.
vyhodnot(anubis,doprava,doleva,_,_,_):- !, fail.
vyhodnot(anubis,nahoru,dolu,_,_,_):- !, fail.
vyhodnot(sfinga,_,_,_,_,_):- !, fail.
vyhodnot(_,_,_,_,X,Y):-
        retract(figurka(_,X,Y,_,_)),
        !, fail.
       
        



vyhodnot(_,_,_,_,X,Y):-
        zruspravidlo(figurka(_,X,Y,_,_)).