/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

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
     MRBEGIN = 258,
     MREND = 259,
     MRSET = 260,
     MRGET = 261,
     MRINT = 262,
     MRREEL = 263,
     MRPUT = 264,
     MRFROM = 265,
     FINIST = 266,
     VIR = 267,
     FINLIGNE = 268,
     MRIF = 269,
     MRELSE = 270,
     CON = 271,
     IDENT = 272,
     MSG = 273,
     COM = 274,
     ENT = 275,
     FLOAT = 276
   };
#endif
/* Tokens.  */
#define MRBEGIN 258
#define MREND 259
#define MRSET 260
#define MRGET 261
#define MRINT 262
#define MRREEL 263
#define MRPUT 264
#define MRFROM 265
#define FINIST 266
#define VIR 267
#define FINLIGNE 268
#define MRIF 269
#define MRELSE 270
#define CON 271
#define IDENT 272
#define MSG 273
#define COM 274
#define ENT 275
#define FLOAT 276




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

