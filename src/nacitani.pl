:- dynamic figurka/5.

% nacitani termu ze souboru
nacti(Soubor):-
	seeing(StarySoubor),
	see(Soubor),
	read(Term), 
	nacti_term(Term),
	seen,
	see(StarySoubor).


nacti_term(end_of_file).
nacti_term(Term) :- 
	process_term(Term),!,
	read(NewTerm),
	nacti_term(NewTerm).


%kontrola syntaxe, kontrola pravidel, pridani do programu
process_term(Term):-
	kontrola_syntaxe(Term),
	kontrola_pravidel(Term),
	assert(Term).

%kontrola syntaxe nacteneho Termu : zda X a Y jsou cela cisla, zda term nebosahuje nedefinovany (Smer,Barvu,Typ)
% a kotroluje se zda je term ve spravnem tvaru "figurka" s prislunym poctem atributu
kontrola_syntaxe(Term):-
	functor(Term,figurka,5),
	Term = figurka(Typ,X,Y,Smer,Barva),
	spravnyTyp(Typ),
	spravnaBarva(Barva),
	spravnySmer(Smer),
	integer(X),integer(Y).


spravnyTyp(sfinga).
spravnyTyp(pyramid).
spravnyTyp(scarab).
spravnyTyp(faraon).
spravnyTyp(anubis).

spravnaBarva(cerveny).
spravnaBarva(stribrny).

spravnySmer(dolu).
spravnySmer(nahoru).
spravnySmer(doleva).
spravnySmer(doprava).

%kontrola pravidel : umisteni figurky, kontrola umisteni dvou figurek na stejnem policku,
% kontroluje umisten figurky na hraci desce
kontrola_pravidel(figurka(Typ,X,Y,Smer,Barva)):-
	0=<X, X=<9,0=<Y, Y=<7,
	\+ figurka(_,X,Y,_,_),
	kontrola_umisteni(Typ,X,Y,Smer,Barva).

%kontrola umisteni sfingy
kontrola_umisteni(sfinga,0,0,dolu,cerveny).
kontrola_umisteni(sfinga,0,0,doprava,cerveny).
kontrola_umisteni(sfinga,9,7,nahoru,stribrny).
kontrola_umisteni(sfinga,9,7,doleva,stribrny).
kontrola_umisteni(sfinga,_,_,_,_):- !,fail.

%kontrola umisteni ostatnich figurek
kontrola_umisteni(_,0,_,_,stribrny):- !,fail.
kontrola_umisteni(_,9,_,_,cerveny):- !,fail.
kontrola_umisteni(_,1,0,_,cerveny):- !,fail.
kontrola_umisteni(_,1,7,_,cerveny):- !,fail.
kontrola_umisteni(_,8,0,_,stribrny):- !,fail.
kontrola_umisteni(_,8,7,_,stribrny):- !,fail.
kontrola_umisteni(_,_,_,_,_).
