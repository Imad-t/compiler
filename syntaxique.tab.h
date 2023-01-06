
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     cst_logique = 258,
     cst_int = 259,
     cst_char = 260,
     cst_reel = 261,
     sep_plus = 262,
     sep_multiplication = 263,
     sep_moins = 264,
     sep_devision = 265,
     sep_crochet_ouvrant = 266,
     sep_crochet_fermant = 267,
     sep_quote = 268,
     sep_virgule = 269,
     sep_point = 270,
     sep_parenthese_ouvrante = 271,
     sep_parenthese_fermante = 272,
     sep_affectation = 273,
     sep_egale = 274,
     sep_deux_points = 275,
     sep_inf = 276,
     sep_sup = 277,
     sep_or = 278,
     sep_and = 279,
     sep_not = 280,
     sep_not_equal = 281,
     sep_inf_egal = 282,
     sep_sup_rgal = 283,
     idf = 284,
     tabulation = 285,
     mc_int = 286,
     mc_float = 287,
     mc_char = 288,
     mc_bool = 289,
     mc_if = 290,
     mc_else = 291,
     mc_while = 292,
     mc_for = 293,
     mc_in = 294,
     mc_range = 295,
     saut_ligne = 296,
     comm = 297
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


