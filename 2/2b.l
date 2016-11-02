%{
#include<stdio.h>
int flag=0;
%}
%%
([ ]?[Aa][Nn][Dd][ ])|([ ]?[Oo][Rr][ ])|([ ]?[Bb][Uu][Tt][ ])	flag=1;
.|\n								;
%%
main()
{
	printf("Input a statement:\n");
	yylex();
	if(flag)
		printf("Compound statement\n");
	else
		printf("Simple statement\n");
}
