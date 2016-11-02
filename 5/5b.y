%{
#include<stdio.h>
#include<stdlib.h>
%}
%token A B
%%
expr	:	S ;
S	:	A S B 
	|	;
%%
main()
{
	printf("Enter a string of a and b: ");
	yyparse();
	printf("Valid string\n");
}
yyerror()
{
	printf("Invalid string\n");
	exit(0);
}
