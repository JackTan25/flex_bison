%{
    enum yytokentype{
        NUMBER = 258,
        ADD = 259,
        SUB = 260,
        MUL = 261,
        DIVIDE = 262,
        ABS = 263,
        EOL = 264
    };
    int yylval;
%}

%%
"+" {return ADD;}
"-" {return SUB;}
"*" {return MUL;}
"/" {return DIVIDE;}
"|" {return ABS;}
[0-9]+ {yylval = atoi(yytext);return NUMBER;}
\n {return EOL;}
[ \t] {/*忽略空白字符*/ /*yytext 是一个char*指针*/}
. {printf("Mystery character %c\n",*yytext);}
%%

main(int argc,char **argv){
    int tok;
    while(tok = yylex()){
        printf("%d",tok);
        if(tok == NUMBER){
            printf(" = %d",yylval);
        }
        printf("\n");
    };
}