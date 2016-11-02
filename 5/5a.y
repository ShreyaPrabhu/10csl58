%{
#include<stdio.h>
%}
%token NUM
%left '+''-'
%left '*''/'
%%
expr	:	e	{
				printf("Result=%d\n",$1);
				return 0;
			};
e	:	e'+'e	{
				$$=$1+$3;
			}
	|	e'-'e	{
				$$=$1-$3;
			}
	|	e'*'e	{
				$$=$1*$3;
			}
	|	e'/'e	{
				if($3==0)
				{
					printf("Division by 0 error");
					exit(0);
				}
				$$=$1/$3;
			}
	|	'('e')'	{
				$$=$2;
			}
	|	NUM	{
				$$=$1;
			};
%%
main()
{
	printf("Enter an expression: ");
	yyparse();
}
yyerror()
{
	printf("Error");
	exit(0);
}
