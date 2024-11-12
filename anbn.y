%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char* s);
int yylex();
%}

%%
S : 'a' S 'b'   // Rule: an 'a' followed by S and a 'b'
  | /* epsilon (empty string) */; // Allow empty string

%%

void yyerror(const char* s) {
    printf("Invalid string: %s\n", s);
}

int main() {
    printf("Enter strings to check if they are of the form a^n b^n (Ctrl+D to end):\n");
    if (yyparse() == 0)
        printf("The string is valid and follows the form a^n b^n\n");
    else
        printf("The string does not follow the form a^n b^n\n");
    return 0;
}
