%option noyywrap
%{
#include <stdlib.h>
#include <stdio.h>
#include "y.tab.h"
int yyerror(const char*);
%}
blancs [ \t]+
chif [0-9]
let [a-z|A-Z]
entier {chif}+
reel {entier}+"."{entier}+
id {let}(_?({let}|{chif})+)*
message \"[^\"]*\"
tout .
comm "%"{tout}*"%"
condition "["{id}["<"|">"]?"="?({entier}|{id}|{reel})"]"
%%
"Set" {return(MRSET);}
"Get" {return(MRGET);}
"Snl_Int" {return(MRINT);}
"Snl_Real" {return(MRREEL);}
"Snl_Put" {return(MRPUT);}
"From" {return(MRFROM);}
"%." {return(FINIST);}
"," {return(VIR);}
"\n" {return(FINLIGNE);}
"If" {return(MRIF);}
"Else" {return(MRELSE);}
"Snl_Begin" {return(MRBEGIN);}
"Snl_End" {return(MREND);}
{id} {return(IDENT); }
{message} {return(MSG);}
{comm} {return(COM);}
{entier} {return(ENT);}
{reel} {return(FLOAT);}
{condition} {return(CON);}
{blancs} {/* On l'ignore */}
{tout} yyerror("invalide");
%% 