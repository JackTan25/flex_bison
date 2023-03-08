fb1-5: fb1-5.l fb1-5.y
## 这一步会生成fb1-5.tab.c 和 fb1-5.tab.h 
	bison -d fb1-5.y 
	flex fb1-5.l
	cc  -o calc fb1-5.tab.c lex.yy.c -lfl
