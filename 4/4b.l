%{
#include<stdio.h>
#include"y.tab.h"
%}
%%
[a-zA-Z]	return ALPHA;
[0-9]		return NUM;
.		return yytext[0];
\n		return 0;
%%
