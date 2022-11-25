%{ 
#include <stdio.h>
#include <stdlib.h>
#include<string.h>
#include<stdbool.h>
int yylex(void);
int yyerror(char *s);
bool erreursyntax= false;
extern int nbligne;
extern FILE * yyin;
%} 
%token IDENT MRINT FINIST FINLIGNE VIR MRREEL MRBEGIN MREND FROM MRGET MRSET NBR COMM MSG MRPUT COND MRIF MRELSE
%start Prog
%% 
Prog: Debut Input Fin;
Debut: Deb {if ($1==1) printf("debut du programme\n");};
Input: 
 /* Vide */ | Input Ligne ; 
Ligne: 
FINLIGNE 
| Declaration FINLIGNE { 
	if ($1==1) 
		printf("Declation d'entier(s) \n"); 
	else 
		printf("Declaration de reel(s) \n"); 
} 


| Affectation FINLIGNE { 
	if ($1==1) 
		printf("Affectation d'une valeur a une variable \n"); 
	else 
		printf("Affectation d'une variable a une variable \n"); 
} 

| Commentaire FINLIGNE { 
	printf("Ceci est un commentaire \n"); 
	}

| Message FINLIGNE { 
	printf("Ceci est un message \n"); 
	}

| Condition FINLIGNE { 
	if ($1==1) 
		printf("Ceci est une condition avec if & else \n"); 
	else 
		printf("Ceci est une condition avec if uniquement \n"); 
} 
| Fin FINLIGNE { printf("Fin du programme \n"); return 0;} 
| error FINLIGNE {yyerrok; } ;

Declaration: 
MRINT Identificateurs FINIST { $$ = 1;} 
| MRREEL Identificateurs FINIST { $$ = 2;} ; 

Identificateurs : A IDENT ; 

A : /* vide */ | Identificateurs VIR ; 

Fin: MREND ;
Deb: MRBEGIN FINLIGNE {$$ = 1;};
Affectation: 
MRSET IDENT NBR FINIST { $$ = 1;} 
|MRGET IDENT FROM IDENT FINIST { $$ = 2;} ;

Commentaire: COMM;

Message: MRPUT MSG FINIST ;

Resultat: Affectation | Message ;

Condition: 
MRIF COND Resultat MRELSE Resultat { $$ = 1;}
|MRIF COND Resultat { $$ = 2;} ;
%% 
int yyerror(char *s) { 
printf("Erreur syntaxique\n\n"); 
return 1; } 
int main(void) { 
	 yyin= fopen (argv[1], "r");
	if(!yyparse()){printf("Compilation effectue avec succes\n");} } 