%{
#include<stdio.h>
int opr=0,op=0,sq=0,cb=0,fb=0;
%}
%%
[A-Za-z0-9]+	{
			opr++;
			printf("Operhand=%s\n",yytext);
		}
[-+/*%]		{
			op++;
			printf("Operator=%s\n",yytext);
		}
"("		cb++;
")"		{ if (cb>0) cb--; }
"{"		fb++;
"}"		{ if (fb>0) fb--; }
"["		sq++;
"]"		{ if (sq>0) sq--; }
\n		;
%%
main()
{
	printf("\nInput a valid arithematic expression\n");
	yylex();
	if(!cb&&!fb&&!sq&&(op==(opr-1)))
		printf("Valid expression\n");
	else
		printf("Invalid expression\n");
	printf("Operator=%d\nOperhand=%d\n",op,opr);
}
