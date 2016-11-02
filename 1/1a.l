%{
#include<stdio.h>
int ch=0,w=0,l=0,sp=0;
%}
%%
[^ \n\t]+	{	w++;
			ch+=yyleng;
		}
[ ]		{
			sp++;
		}
[\n]		{
			l++;
		}
%%
main(int argc, char *argv[])
{
	yyin=fopen(argv[1],"r");
	yylex();
	printf("\nCharacters=%d\nWords=%d\nSpace=%d\nLine=%d\n",ch,w,sp,l);
	fclose(yyin);
}
