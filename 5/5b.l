%{
#include"y.tab.h"
%}
%%
[aA]	return A;
[bB]	return B;
.	return yytext[0];
\n	return 0;
%%

