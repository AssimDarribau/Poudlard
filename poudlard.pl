% Faits :
suspect(drago).
suspect(neville).
suspect(ginny).

% Suspects :
declaration(drago, neville_innocent) :- not(coupable(drago)).
declaration(neville, ginny_innocente) :- coupable(drago).
declaration(ginny, ni_drago_ni_neville_coupable) :- coupable(ginny).

% Règle Coupable :
coupable_unique(X) :-
    suspect(X),
    coupable(X),
    test((suspect(Y), Y \= X), innocent(Y)).

% Définir coupable et innocent
coupable(X) :- not(innocent(X)).
innocent(X) :- not(coupable(X)).

% Vérification des déclarations
%valide_declarations :- (Pas encore trouvé)


declaration_valide(drago) :- declaration(drago, neville_innocent), innocent(neville).
declaration_valide(neville) :- declaration(neville, ginny_innocente), innocent(ginny).
declaration_valide(ginny) :- declaration(ginny, ni_drago_ni_neville_coupable), innocent(drago), innocent(neville).

% Règle principale
trouver_coupable(X) :- coupable_unique(X), valide_declarations.
