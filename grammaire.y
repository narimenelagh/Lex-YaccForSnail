%{
#include <stdlib.h>
#include <stdio.h>
int yylex(void);
int yyerror(const char*);
%}
%token MRBEGIN MREND MRSET MRGET MRINT MRREEL MRPUT MRFROM FINIST VIR FINLIGNE MRIF MRELSE CON IDENT MSG COM ENT FLOAT
%start Debut
%%
Debut: D Input;
Input:
/* Vide */ |Input Ligne ;
Ligne: 
FINLIGNE
| Declaration FINLIGNE {
    if ($1==1) printf("Declation d'entier(s) \n");
    else printf("Declaration de reel(s) \n");}

| Affectation FINLIGNE {
     if ($1==1) printf("Affectation d une valeur a une variable\n");
    else printf("Affectation d une variable a une autre\n");}

| Commentaire FINLIGNE { printf("ceci est un commentaire\n");}
| Fin FINLIGNE {printf("Fin du programme\n"); return 0;}

| Affichage FINLIGNE { printf("Affichage de Variable\n");}
| Message FINLIGNE {  printf("Affichage de message\n"); }

| Si FINLIGNE {printf("Conditionnel \n");}
| Sinon FINLIGNE {printf("Sinon \n");}
| Condition FINLIGNE {printf("Contion avec if et else \n");}
| error FINLIGNE {yyerrok;} ;

D: MRBEGIN FINLIGNE {printf("debut du programme\n");};
Declaration:
 MRINT Identificateurs FINIST { $$ = 1;} 
| MRREEL Identificateurs FINIST { $$ = 2;} ;
Identificateurs: A IDENT ;
A : /* vide */ |Identificateurs VIR ;

Affectation:
MRSET IDENT E FINIST {$$ = 1;}
|MRGET IDENT MRFROM IDENT FINIST;

E: ENT | FLOAT;

Commentaire: COM;
Fin: MREND;

Affichage: MRPUT IDENT FINIST ;
Message: MRPUT MSG FINIST ;

Si: MRIF CON;
Sinon :MRELSE;
Inst: Affectation|Affichage|Message;
Condition : Si Inst Sinon Inst;
%%
int yyerror(const char *s) {
printf("Erreur syntaxique\n\n");
return 1; }
int main(void) { yyparse(); }