%{
#include<stdio.h>
%}

dig[0-9]
exp[eE]
sign[+-]
realnum({sign}?{dig}+(\.{dig}+)?({exp}{sign}?{dig+})?

%%
{realnum} { printf }
.|\n { }
%%

int yywrap(){
}

int main(){
yy;ex()
}
