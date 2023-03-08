%{
    int chars;
    int words;
    int lines;
%}
%%
[a-zA-Z]+ {words++;chars += strlen(yytext);}
\n {lines++;chars++;}
. {chars++;}
%%

main(int argc,char **argv){
    yylex();
    printf("%8d%8d%8d\n",lines,words,chars);
}