%{
#include "y.tab.h" // This includes token definitions from yacc.y
%}

%%
a       { return 'a'; }  // Return 'a' token to Yacc
b       { return 'b'; }  // Return 'b' token to Yacc
[ \t\n] { /* Ignore whitespace */ }
.       { return yytext[0]; }  // Return any other character as itself for error reporting
%%

int yywrap() {
    return 1;
}
