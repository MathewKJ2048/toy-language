%{
#include "y.tab.h"
#include <string.h>
void yyerror();
%}
RELATIONAL_OPERATOR (<|>|<=|>=|==|!=)
%%
\/\/.*\n  {/*single line comment*/}
\+\+    {return INCREMENT;}
\-\-    {return DECREMENT;}
"while" {return WHILE;}
"if"    {return IF;}
"else"  {return ELSE;}
"do"    {return DO;}
"for"   {return FOR;}
"switch"    {return SWITCH;}
"break" {return BREAK;}
"continue"  {return CONTINUE;}
"int"   {return INT;}
"short" {return SHORT;}
"float" {return FLOAT;}
"char"      {return CHAR;}
"long"      {return LONG;}
"double"      {return DOUBLE;}
"goto"      {return GOTO;}
"&&"  {return AND;}
"||"  {return OR;}
"!"  {return NOT;}
"^^" {return XOR;}

{RELATIONAL_OPERATOR}    {strcpy(yylval.lexeme,yytext);return RELOP;}
[a-zA-Z][a-zA-Z0-9]*	{ strcpy(yylval.lexeme,yytext); return VAR; }
[0-9]+\.[0-9]+ { yylval.vf = atof(yytext); return LIT_F; }
[0-9]+      { yylval.vi = atoi(yytext); return LIT_I; }

[ \t\n]	;		/* ignore white space */

"$"	return 0;	/* logical EOF */

.	return yytext[0];
%%
