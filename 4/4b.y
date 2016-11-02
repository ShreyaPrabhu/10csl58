%{
#include<stdio.h>
#include<stdlib.h>
%}
%token ALPHA NUM
%%
expr	:	ALPHA e;
e	:	NUM e
	|	ALPHA e
	|	;
%%
main()
{
	printf("Enter a variable name: ");
	yyparse();
	printf("Valid variable name\n");
}
yyerror()
{
	printf("Error");
	exit(0);
}
