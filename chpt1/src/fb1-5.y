%{
#include<stdio.h>
%}

/* declare tokens 声明令牌*/
%token NUMBER NONENUMBER
%token ADD SUB MUL DIV ABS LP RP 
%token EOL

%%
calclist: /* 空规则 */
    | exp EOL { printf(" = %d\n", $1); }
    
exp: factor {$$ = $1;}
    | exp ADD factor { $$ = $1 + $3;}
    | exp SUB factor { $$ = $1 - $3;}
    
factor: term {$$ = $1;}
    | factor MUL term { $$ = $1 * $3; }
    | factor DIV term { $$ = $1 / $3; }
    
term: NUMBER {$$ = $1;}
    | ABS term { $$ = $2 >= 0 ? $2 : -$2; }
    | LP exp RP { $$ = $2; }
    | NONENUMBER {$$ = $1;}
    | NUMBER NONENUMBER {$$ = $1 + $2;}
%%

main(int argc,char **argv){
    yyparse();
}

yyerror(char *s)
{
    fprintf(stderr, "error: %s\n",s);
}