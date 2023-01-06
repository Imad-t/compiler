%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "syntaxique.tab.h"
    #include "ts.h"
    int nb_ligne = 1;
    int nb_colone = 1;
%}

lettreMaj [A-Z]
lettre [a-zA-Z0-9] 
chiffre [0-9]  
cst_int (0|[+-]?[1-9]{chiffre}*)
cst_reel {cst_int}\.{chiffre}+
cst_char '[^\t]'
cst_logique (True|False)
idf {lettreMaj}({chiffre}|{lettre})*(_({chiffre}|{lettre}*))*
comm #.*
%%
{cst_int} {
    printf("\n '%s' => constante_entier \n",yytext);
    nb_colone += strlen(yytext);
    rechercher(yytext, "cst_int", "INTEGER",atof(yytext),0);
    return cst_int;
    }
{cst_reel} {
    printf("\n '%s' => constante_reel \n",yytext);
    nb_colone += strlen(yytext);
    rechercher(yytext, "cst_reel", "FLOAT",atof(yytext),0);
    return cst_reel;
    }

{cst_logique}  {
    printf("\n '%s' => constante_logique \n",yytext);
    nb_colone += strlen(yytext);
    if(strcmp(yytext,"true") == 0){
        rechercher(yytext, "cst_logique", "Bool",1.0,0);
        return cst_logique;}

    if (strcmp(yytext,"false") ==0){
        rechercher(yytext, "cst_logique", "Bool",0.0,0);
        return cst_logique;}
    ;}
"+" {printf("\n '%s' => separateur \n",yytext);nb_colone += strlen(yytext); 
rechercher(yytext, "addition", "",0,2);
return sep_plus; }
"*" {printf("\n '%s' => separateur \n",yytext);nb_colone += strlen(yytext); 
rechercher(yytext, "multiplication","",0,2); 
return sep_multiplication; }
"-" {printf("\n '%s' => separateur \n",yytext);nb_colone += strlen(yytext); 
rechercher(yytext, "soustraction", "",0 , 2);
return sep_moins; }
"/" {printf("\n '%s' => separateur \n",yytext);nb_colone += strlen(yytext); 
rechercher(yytext, "division", "",0,2); 
return sep_devision; }
"[" {printf("\n '%s' => separateur \n",yytext);nb_colone += strlen(yytext); 
rechercher(yytext, "crochet_ouvrant", "",0,2);
return sep_crochet_ouvrant; }
"]" {printf("\n '%s' => separateur \n",yytext);nb_colone += strlen(yytext); 
rechercher(yytext, "crochet_fermant", "",0,2);
return sep_crochet_fermant; }
"'" {nb_colone += strlen(yytext); 
rechercher(yytext, "quote", "",0,2); 
return sep_quote; }
","  {printf("\n '%s' => separateur \n",yytext);nb_colone += strlen(yytext); 
rechercher(yytext, "virgule", "",0,2);
return sep_virgule; }
"."  {printf("\n '%s' => separateur \n",yytext);nb_colone += strlen(yytext); 
rechercher(yytext, "point", "",0,2);
return sep_point; }
"("  {printf("\n '%s' => separateur \n",yytext);nb_colone += strlen(yytext); 
rechercher(yytext, "parenthese_ouvrante", "",0,2);
return sep_parenthese_ouvrante; }
")"  {printf("\n '%s' => separateur \n",yytext);nb_colone += strlen(yytext); 
rechercher(yytext, "parenthese_fermante", "",0,2);
return sep_parenthese_fermante; }
"="  {printf("\n '%s' => separateur \n",yytext);nb_colone += strlen(yytext); 
rechercher(yytext, "affectaion", "",0,2);
return sep_affectation;  }
"=="  {printf("\n '%s' => separateur \n",yytext);nb_colone += strlen(yytext); 
rechercher(yytext, "egalite", "",0,2);
return sep_egale; }
":"  {printf("\n '%s' => separateur \n",yytext);nb_colone += strlen(yytext); 
rechercher(yytext, "deux_points", "",0,2);
return sep_deux_points;}
"<"  {printf("\n '%s' => separateur \n",yytext);nb_colone += strlen(yytext); 
rechercher(yytext, "inf", "",0,2);
return sep_inf; }
">"  {printf("\n '%s' => separateur \n",yytext);nb_colone += strlen(yytext); 
rechercher(yytext, "sup", "",0,2);
return sep_sup; }
"or"  {printf("\n '%s' => separateur \n",yytext);nb_colone += strlen(yytext); 
rechercher(yytext, "or", "",0,2);
return sep_or;}
"and" {printf("\n '%s' => separateur \n",yytext);nb_colone += strlen(yytext); 
rechercher(yytext, "and", "",0,2);
return sep_and;}
"not" {printf("\n '%s' => separateur \n",yytext);nb_colone += strlen(yytext); 
rechercher(yytext, "not", "",0,2);
return sep_not;}
"!="  {printf("\n '%s' => separateur \n",yytext);nb_colone += strlen(yytext); 
rechercher(yytext, "inegalite", "",0,2);
return sep_not_equal; }
"<="  {printf("\n '%s' => separateur \n",yytext);nb_colone += strlen(yytext); 
rechercher(yytext, "inf_egal", "",0,2);
return sep_inf_egal;}
">="  {printf("\n '%s' => separateur \n",yytext);nb_colone += strlen(yytext); 
rechercher(yytext, "sup_egal", "",0,2);
return sep_sup_rgal;}
{idf} {
    if (yyleng>8)printf("\n idf trop long\n");
    else{
        printf(" '%s' --> idf ",yytext);
        nb_colone += strlen(yytext);        
        rechercher(yytext, "IDF","", 0, 0);
        return idf;
    }
}
{comm} {nb_colone += strlen(yytext); printf("\n %s  => Commentaire\n", yytext); return comm;}
\n { nb_ligne++;nb_colone=1;rechercher("\\n", "Saute", "",0,2); return saut_ligne;}
\t {nb_colone+=4; rechercher("\\t", "Tabulation", "", 0, 2); return tabulation;}
" " nb_colone++;
int {nb_colone += strlen(yytext); printf("\n'%s' => mot_cle  \n",yytext);   rechercher(yytext, "MOT_CLE","",0,1);return mc_int;}
float {nb_colone += strlen(yytext); printf("\n'%s' => mot_cle  \n",yytext); rechercher(yytext, "MOT_CLE", "",0,1);return mc_float;}
char {nb_colone += strlen(yytext); printf("\n'%s'  => mot_cle   \n",yytext); rechercher(yytext, "MOT_CLE", "",0,1);return mc_char;}
bool {nb_colone += strlen(yytext); printf("\n'%s'  => mot_cle   \n",yytext); rechercher(yytext, "MOT_CLE", "",0,1);return mc_bool;}
if {nb_colone += strlen(yytext); printf("\n'%s' => mot cle    \n",yytext); rechercher(yytext, "MOT_CLE", "",0,1);return mc_if;}
else {nb_colone += strlen(yytext); printf("\n'%s' => mot cle   \n",yytext); rechercher(yytext, "MOT_CLE", "",0,1);return mc_else;}
while {nb_colone += strlen(yytext); printf("\n'%s' => mot cle   \n",yytext); rechercher(yytext, "MOT_CLE", "",0,1);return mc_while;}
for {nb_colone += strlen(yytext); printf("\n'%s' => mot cle    \n",yytext); rechercher(yytext, "MOT_CLE", "",0,1);return mc_for;}
in {nb_colone += strlen(yytext); printf("\n'%s' => mot_cle   \n",yytext); rechercher(yytext, "MOT_CLE", "",0,1);return mc_in;}
range {nb_colone += strlen(yytext); printf("\n'%s' => mot_cle \n",yytext); rechercher(yytext, "MOT_CLE", "",0,1);return mc_range;}
{cst_char} {
    printf("\n '%s' => constante_char \n",yytext);
    nb_colone += strlen(yytext);
    rechercher(yytext, "cst_char", "CHAR",atof(yytext),0);
    return cst_char;
}
. {printf("%d_%d_ erreur lexical %s n'appartient pas au langage\n",nb_ligne,nb_colone,yytext); nb_colone += strlen(yytext);}
