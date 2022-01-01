%{
    #include "parser.tab.h"
    #include <stdio.h>
    #include <math.h>
%}

%option noyywrap

%%

[0-9]+ {yylval.val = atoi(yytext); return NUM;}
-?[0-9]{1,10} {yylval.val = atoi(yytext); return NUM;}
"+"             { yylval.sym = yytext[0]; return ADD; }
"-"             { yylval.sym = yytext[0]; return SUB; }
"*"             { yylval.sym = yytext[0]; return MUL; }
"/"             { yylval.sym = yytext[0]; return DIV; }
"l"|"r"         { yylval.sym = yytext[0]; return ALS; }
"L"|"R"         { yylval.sym = yytext[0]; return LLS; }
"^"             { yylval.sym = yytext[0]; return EXP; }
"("             { return LP; }
")"             { return RP; }
[\n]            {printf("ANS -> "); return EVALUATE; }
<<EOF>>         { return 0; }
[ \t]+          { }
.               { fprintf(stderr, "Unrecognised Token!"); exit(1); }

%%