%{
#include <stdio.h>
#include <math.h>

int yylex(); 
int yyerror(const char *p) { fprintf(stderr, "%s\n", p); return 0;}
%}


%union {
  int val; 
  char sym;
};
%token <val> NUM
%token <sym> ADD SUB MUL DIV ALS LLS EXP LP RP EVALUATE
%left ADD SUB MUL DIV ALS LLS EXP LP RP
%type  <val> exp res

%%
run: res run | res

res: exp EVALUATE     { printf("%d\n",$1); }

exp:
        NUM { $$ = $1;}
    |   NUM NUM {if ($2>=0){yyerror("syntax error"); exit(0); } else $$ = $1+$2;}  
    | exp ADD exp      { $$ = $1 + $3 ;}
    | exp SUB exp      { $$ = $1 - $3 ;}
    | exp MUL exp      { $$ = $1 * $3 ;}
    | exp DIV exp      { if($3 == 0 ){printf(" divide by zero error ");exit(1);} else $$ = $1 / $3;}
    | exp ALS exp      { $$ = ($2 == 'l' ? $1 << $3 : $1 >> $3); }
    | exp LLS exp      { $$ = ($2 == 'L' ? $1 << $3 : ($1 < 0 ? (int)((unsigned int)$1 >> $3) : $1 >> $3)); }
    | exp EXP exp      { $$ = pow($1 ,$3); }
    | LP exp RP        { $$ = $2; }

%%
