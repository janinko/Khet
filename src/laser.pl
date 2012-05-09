/* -*- Mode:Prolog; coding:iso-8859-1; -*- */

vyhodnot_laser(Barva):-
        figurka(sfinga,X,Y,Smer,Barva),
        posun(X,Y,Smer).
        
                          


posun(X,Y,Smer):-
        ziskej(X,Y,X2,Y2,Smer),
        \+ figurka(_,X2,Y2,_,_),
        posun(X2,Y2,Smer).
posun(X,Y,Smer):-
        figurka(Typ,X,Y,SmerF,_),
        vyhodnot(Typ,Smer,SmerF,NovySmer,X,Y),
        posun(X,Y,NovySmer).

vyhodnot(pyramida,doleva,dolu,dolu,_,_).
vyhodnot(pyramida,nahoru,dolu,doprava,_,_).



vyhodnot(_,_,_,_,X,Y):-
        zruspravidlo(figurka(_,X,Y,_,_)).