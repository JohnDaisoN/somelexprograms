%{
#include <stdio.h>
#include <stdlib.h>
%}

%%

/* Keywords */
"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|
"extern"|"float"|"for"|"goto"|"if"|"inline"|"int"|"long"|"register"|"restrict"|"return"|
"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|
"volatile"|"while"|"_Bool"|"_Complex"|"_Imaginary"|"alignas"|"alignof"|"atomic"|"noreturn"|
"static_assert"|"thread_local" { printf("Keyword: %s\n", yytext); }

/* Identifiers */
[a-zA-Z_][a-zA-Z0-9_]* { printf("Identifier: %s\n", yytext); }

/* Constants */
[0-9]+ { printf("Integer constant: %s\n", yytext); }
[0-9]*\.[0-9]+([eE][-+]?[0-9]+)? { printf("Floating-point constant: %s\n", yytext); }
\'(\\.|[^\\\'])\' { printf("Character constant: %s\n", yytext); }
\"(\\.|[^\\\"])*\" { printf("String literal: %s\n", yytext); }

/* Operators */
"++"|"--"|"->"|"&&"|"||"|"<<"|">>"|"<="|">="|"=="|"!="|"+"|"-"|"*"|"/"|"%"|"&"|"|"|"^"|
"!"|"~"|"="|"?"|":"|"<"|">" { printf("Operator: %s\n", yytext); }

/* Punctuation */
"(" { printf("Left parenthesis: %s\n", yytext); }
")" { printf("Right parenthesis: %s\n", yytext); }
"{" { printf("Left brace: %s\n", yytext); }
"}" { printf("Right brace: %s\n", yytext); }
"[" { printf("Left bracket: %s\n", yytext); }
"]" { printf("Right bracket: %s\n", yytext); }
"," { printf("Comma: %s\n", yytext); }
";" { printf("Semicolon: %s\n", yytext); }
"." { printf("Dot: %s\n", yytext); }
"..." { printf("Ellipsis: %s\n", yytext); }

/* Preprocessor Directives */
\#.* { printf("Preprocessor directive: %s\n", yytext); }

/* Whitespace */
[ \t\n]+   { /* Ignore whitespace */ }

/* Catch-all for unrecognized characters */
. { printf("Unknown token: %s\n", yytext); }

%%

int main() {
    printf("Enter C code to tokenize:\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
