%%
"+" {printf("PLUS\n");}
"-" {printf("MINUS\n");}
"*" {printf("TIMES\n");}
"/" {printf("DIVIDE\n");}
"|" {printf("ABS\n");}
[0-9]+ {printf("NUMBER:%s\n",yytext);}
\n {printf("NEWLINE\n");}
[ \t] {}
/*yytest 是一个char*指针*/
. {printf("Mystery character %s\n",yytext);}
%%
