%option noyywrap 
%{ 
    
#include <stdlib.h>
#include <stdio.h>
#include "y.tab.h" 
bool erreurlexical = false;
int nbligne;
int yyerror(const char*);
extern int nbligne;
%} 
blancs [ \t]+ 
chif [0-9] 
let [a-z|A-Z] 
entier {chif}+ 
id {let}(_?({let}|{chif})+)* 
nombre {entier}("."{entier})?
commentaire %[^%|^"."]*%
message \"[^\"]*\"
operateurs ["<"|">"|"<="|">="|"=="]
condition "["{id}{operateurs}{nombre}"]"
%% 
"Snl_Int" {return(MRINT);} 
"Snl_Real" {return(MRREEL);} 
"Snl_Begin" {return(MRBEGIN);}
"Snl_End" {return(MREND);}
"Snl_Put" {return(MRPUT);}
"Set" {return(MRSET);}
"Get" {return(MRGET);} 
"from" {return(FROM);}
"%." {return(FINIST);} 
"," {return(VIR);} 
"\n" {nbligne++; return(FINLIGNE);} 
"If" {return(MRIF);} 
"Else" {return(MRELSE);} 
{blancs} {/* On l'ignore */} 
{id} {yylval.text =strdup(yytext); return(IDENT); } 
{nombre} {yylval.num=atoi(yytext); return(NBR);}
{commentaire} {return(COMM);}
{message} {return(MSG);}
{condition} {return(COND);}
. { /*yyerror();*/ 
        fprintf(stderr,"\tERREUR : Lexeme inconnu a la ligne %d. Il s'agit de %s et comporte %d lettre(s)\n",linenbr,yytext,yyleng);
        erreurLexical = true;
        return yytext[0];} 

%% 