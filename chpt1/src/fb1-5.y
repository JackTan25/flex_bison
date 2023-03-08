%{
#include<stdio.h>
%}

/* declare tokens 声明令牌*/
%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL

%%
calclist: /* 空规则 */
    | calclist exp EOL { printf(" = %d\n", $2); }
    
exp: factor {$$ = $1;}
    | exp ADD factor { $$ = $1 + $3;}
    | exp SUB factor { $$ = $1 - $3;}
    
factor: term {$$ = $1;}
    | factor MUL term { $$ = $1 * $3; }
    | factor DIV term { $$ = $1 / $3; }
    
term: NUMBER {$$ = $1;}
    | ABS term { $$ = $2 >= 0 ? $2 : -$2; }
    
%%

main(int argc,char **argv){
    yyparse();
}

yyerror(char *s)
{
    fprintf(stderr, "error: %s\n",s);
}