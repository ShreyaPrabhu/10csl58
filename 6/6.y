%{
#include<stdio.h>
#include<stdlib.h>
int i=0;
%}
%token A B
%%
expr	:	S B ;
S	:	A S	{
				i++;
			}
	|	;
%%
main()
{
	printf("Enter a string of a and b: ");
	yyparse();
	if(i>=10)
		printf("Valid string\n");
	else
		printf("Invalid string\n");
}
yyerror()
{
	printf("Error");
	exit(0);
}
