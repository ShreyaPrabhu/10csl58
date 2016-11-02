%{
#include<stdio.h>
%}
%token ALPHA NUM
%left '+''-'
%left '*''/'
%%
expr	:	e ;
e	:	e'+'e
	|	e'-'e
	|	e'*'e
	|	e'/'e
	|	'('e')'
	|	NUM
	|	ALPHA ;
%%
main()
{
	printf("Enter the expression: ");
	yyparse();
	printf("Valid expression\n");
}
yyerror()
{
	printf("Error\n");
	exit(0);
}
