%{

%}

%start S
%token cst_int cst_reel cst_char const_logique sep_plus sep_multiplication sep_moins sep_devision sep_crochet_ouvrant sep_crochet_fermant sep_quote
 sep_virgule sep_point sep_parenthese_ouvrante sep_parenthese_fermante  sep_affectation sep_egale sep_deux_points sep_inf sep_sup  
 sep_or sep_and sep_not sep_not_equal sep_equal sep_inf_egal sep_sup_rgal idf tabulation mc_int mc_float mc_char mc_bool mc_if mc_else
 mc_while mc_for mc_in mc_range  saut_ligne comm

%%
S : LIST_INSTR
;
LIST_INSTR : INST LIST_INSTR |
;
INST : DEC | AFF | COND | BOUCLE  
;
DEC : TYPE idf sep_affectation 
%%
main()
{
     initialisation();
     yyparse();
     afficher();
}

yywrap(){}
