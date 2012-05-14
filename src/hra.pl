/* -*- Mode:Prolog; coding:iso-8859-1; -*- */


tah(Barva):-
        write('Tahne '), write(Barva), write(': Radek Sloupec Akce (> v < ^ r l)'),nl,flush_output,
        repeat, 
                nactiPrikaz(Vstup),
                overPrikaz(Vstup,X,Y,P),
                figurka(_,X,Y,_,Barva),
                ziskejPrikaz(P,Prikaz),
                provedPrikaz(Prikaz,X,Y,P),
        !.

        

nactiPrikaz(Prikaz):-
        get_code(Zn1),
        get_code(Zn2),
        get_char(Zn3),
        Prikaz = [Zn1,Zn2,Zn3].

overPrikaz([Zn1,Zn2,Zn3],X,Y,P):-
        Y is Zn1 - 48,
        X is Zn2 - 48,
        X >= 0,
        Y >= 0,
        X < 10,
        Y < 8,!,
        znak(Zn3,P).
znak('h',zapad).
znak('j',jih).
znak('k',sever).
znak('l',vychod).
znak('u',severozapad).
znak('i',severovychod).
znak('n',jihozapad).
znak('m',jihovychod).
znak('4',zapad).
znak('2',jih).
znak('8',sever).
znak('6',vychod).
znak('7',severozapad).
znak('9',severovychod).
znak('1',jihozapad).
znak('3',jihovychod).
znak('>',doprava).
znak('<',doleva).

ziskejPrikaz(doprava,otoc).
ziskejPrikaz(doleva,otoc).
ziskejPrikaz(_,posun).

provedPrikaz(otoc,X,Y,S):- otoc(X,Y,S).
provedPrikaz(posun,X,Y,S):- posun(X,Y,S).

otoc(X,Y,SmerOtoceni):-
        figurka(Typ,X,Y,Smer,Barva),
        smer(Typ,Smer,NovySmer,SmerOtoceni),
        retract(figurka(_,X,Y,_,_)),
        assert(figurka(Typ,X,Y,NovySmer,Barva)).

posun(X,Y,SmerPohybu):-
        figurka(Typ,X,Y,_,_),
        spoctiPosun(X,Y,X2,Y2,SmerPohybu),
        muzePosun(Typ,X2,Y2),
        posun(X,Y,X2,Y2,Typ).

posun(X,Y,X2,Y2,scarab):-
        figurka(Typ2,X2,Y2,Smer2,Barva2),!,
        figurka(Typ,X,Y,Smer,Barva),
        retract(figurka(_,X,Y,_,_)),
        retract(figurka(_,X2,Y2,_,_)),
        assert(figurka(Typ,X2,Y2,Smer,Barva)),
        assert(figurka(Typ2,X,Y,Smer2,Barva2)).

posun(X,Y,X2,Y2,_):-
        figurka(Typ,X,Y,Smer,Barva),
        retract(figurka(_,X,Y,_,_)),
        assert(figurka(Typ,X2,Y2,Smer,Barva)).
       
       
spoctiPosun(X,Y,X,Y2,jih):-
        Y < 7,
        Y2 is Y + 1.
spoctiPosun(X,Y,X2,Y2,jihozapad):-
        X > 0, Y < 7,
        X2 is X - 1,
        Y2 is Y + 1.
spoctiPosun(X,Y,X2,Y,zapad):-
        X > 0,
        X2 is X - 1.
spoctiPosun(X,Y,X2,Y2,severozapad):-
        X > 0, Y > 0,
        X2 is X - 1,
        Y2 is Y - 1.
spoctiPosun(X,Y,X,Y2,sever):-
        Y > 0,
        Y2 is Y - 1.
spoctiPosun(X,Y,X2,Y2,severovychod):-
        X <9, Y > 0,
        X2 is X + 1,
        Y2 is Y - 1.
spoctiPosun(X,Y,X2,Y,vychod):-
        X < 9,
        X2 is X + 1.
spoctiPosun(X,Y,X2,Y2,jihovychod):-
        X <9, Y < 7,
        X2 is X + 1,
        Y2 is Y + 1.

smer(sfinga,dolu,vpravo,_).
smer(sfinga,vpravo,dolu,_).
smer(sfinga,nahoru,vlevo,_).
smer(sfinga,vlevo,nahoru,_).
smer(scarab,nahoru,dolu,_).
smer(scarab,dolu,nahoru,_).
smer(_,dolu,doleva,doprava).
smer(_,doleva,nahoru,doprava).
smer(_,nahoru,doprava,doprava).
smer(_,doprava,dolu,doprava).
smer(_,doleva,dolu,doleva).
smer(_,nahoru,doleva,doleva).
smer(_,doprava,nahoru,doleva).
smer(_,dolu,doprava,doleva).

muzePosun(sfinga,_,_):-!,fail.
muzePosun(scarab,0,0):-!,fail.
muzePosun(scarab,9,7):-!,fail.
muzePosun(scarab,_,_).
muzePosun(_,X,Y):- \+ figurka(_,X,Y,_,_).