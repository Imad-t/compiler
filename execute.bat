flex lexical.l
bison -d syntaxique.y
gcc lex.yy.c syntaxique.tab.c -lfl -ly -o analyseur_Lexico_Syntaxique.exe
analyseur_Lexico_Syntaxique.exe 0<test.txt