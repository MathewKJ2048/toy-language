parser: y.tab.c lex.yy.c y.tab.h
	gcc y.tab.c lex.yy.c -ll -ly -o parser
lex.yy.c: $(fname).l
	lex $(fname).l
y.tab.c: $(fname).y
	yacc -v -d -t $(fname).y
clean:
	rm -f parser y.tab.c lex.yy.c y.tab.h y.output
