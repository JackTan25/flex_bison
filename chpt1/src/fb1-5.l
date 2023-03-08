%{
    #include "fb1-5.tab.h"
%}

%{
    int yylval;
%}

%%
"+" {return ADD;}
"-" {return SUB;}
"*" {return MUL;}
"/" {return DIV;}
"|" {return ABS;}
[0-9]+ {yylval = atoi(yytext);return NUMBER;}
\n {return EOL;}
[ \t] {/*忽略空白字符*/ /*yytext 是一个char*指针*/}
. {/*printf("Mystery character %c\n",*yytext);*/}
%%