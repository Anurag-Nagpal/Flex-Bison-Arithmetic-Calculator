calc:  	lexer.l parser.y
		bison -d parser.y
		flex lexer.l
		gcc main.c lex.yy.c parser.tab.c -w
		./a