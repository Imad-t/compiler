%{

%}

%start S
%token  cst_logique cst_int cst_char cst_reel sep_plus sep_multiplication sep_moins sep_devision sep_crochet_ouvrant sep_crochet_fermant sep_quote
 sep_virgule sep_point sep_parenthese_ouvrante sep_parenthese_fermante  sep_affectation sep_egale sep_deux_points sep_inf sep_sup  
 sep_or sep_and sep_not sep_not_equal sep_inf_egal sep_sup_rgal idf tabulation mc_int mc_float mc_char mc_bool mc_if mc_else
 mc_while mc_for mc_in mc_range  saut_ligne comm

%%
S :   LIST_DEC S
   |  LIST_INST S
   |  comm S
   |  saut_ligne S
   |
   {printf(" Le programme est correcte syntaxiquement");YYACCEPT;}
;

LIST_DEC : DEC LIST_DEC 
          | 
;

DEC :  DEC_VAR
     | DEC_TAB
;

DEC_VAR :   TYPE LIST_IDF
          | idf sep_affectation VAL
;

TYPE :      mc_int
          | mc_float
          | mc_char
          | mc_bool
;

LIST_IDF :  idf
          | idf sep_virgule LIST_IDF
;

VAL :  cst_int
     | cst_reel
     | cst_logique
     | cst_char 
;

DEC_TAB :  TYPE idf sep_crochet_ouvrant cst_int sep_crochet_fermant
;

LIST_INST : INST LIST_INST
           |
;

INST :   AFFECT 
       | IF_COND
       | FOR
       | WHILE
;

AFFECT : idf sep_affectation EXPRESSION
;

EXPRESSION :  idf
            | VAL
            | sep_parenthese_ouvrante EXPRESSION sep_parenthese_fermante
            | sep_parenthese_ouvrante EXPRESSION sep_parenthese_fermante sep_parenthese_ouvrante EXPRESSION sep_parenthese_fermante
            | idf OP_ARTH idf
            | idf OP_ARTH VAL
            | idf OP_ARTH sep_parenthese_ouvrante EXPRESSION sep_parenthese_fermante
            | VAL OP_ARTH idf
            | VAL OP_ARTH VAL
            | VAL OP_ARTH sep_parenthese_ouvrante EXPRESSION sep_parenthese_fermante
            | sep_parenthese_ouvrante EXPRESSION sep_parenthese_fermante OP_ARTH idf
            | sep_parenthese_ouvrante EXPRESSION sep_parenthese_fermante OP_ARTH VAL
            | sep_parenthese_ouvrante EXPRESSION sep_parenthese_fermante OP_ARTH sep_parenthese_ouvrante EXPRESSION sep_parenthese_fermante
;

OP_ARTH :   sep_plus
          | sep_moins
          | sep_multiplication
          | sep_devision
;

;

IF_COND :   mc_if sep_parenthese_ouvrante COND sep_parenthese_fermante sep_deux_points saut_ligne LIST_INST2 
          | mc_if sep_parenthese_ouvrante COND sep_parenthese_fermante sep_deux_points saut_ligne LIST_INST2 saut_ligne mc_else sep_deux_points saut_ligne IF_COND 
          | mc_if sep_parenthese_ouvrante COND sep_parenthese_fermante sep_deux_points saut_ligne LIST_INST2 saut_ligne mc_else sep_deux_points saut_ligne LIST_INST2 
;

COND :   COMPAR
       | sep_parenthese_ouvrante COND sep_parenthese_fermante
       | sep_not sep_parenthese_ouvrante COND sep_parenthese_fermante 
       | sep_parenthese_ouvrante COND sep_parenthese_fermante sep_or sep_parenthese_ouvrante COND sep_parenthese_fermante
       | sep_parenthese_ouvrante COND sep_parenthese_fermante sep_and sep_parenthese_ouvrante COND sep_parenthese_fermante
;

COMPAR :  idf SEP_COMPAR idf
        | idf SEP_COMPAR VAL
        | VAL SEP_COMPAR idf
        | VAL SEP_COMPAR VAL
;

SEP_COMPAR :  sep_egale
            | sep_not_equal 
            | sep_inf
            | sep_inf_egal 
            | sep_sup
            | sep_sup_rgal
;

LIST_INST2 :  tabulation INST LIST_INST2 
            | tabulation INST 
            |
;

FOR :  mc_for idf mc_in mc_range sep_parenthese_ouvrante cst_int sep_virgule cst_int sep_parenthese_fermante sep_deux_points saut_ligne LIST_INST2
     | mc_for idf mc_in idf sep_deux_points saut_ligne LIST_INST2
;

WHILE : mc_while sep_parenthese_ouvrante COND sep_parenthese_fermante sep_deux_points saut_ligne LIST_INST2


%%
main()
{
   initialisation();
   yyparse(); 
   afficher();
}

yywrap(){}


