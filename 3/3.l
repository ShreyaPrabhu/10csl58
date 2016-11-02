%{
#include<stdio.h>
#include<strings.h>
int id=0,flag=0;
%}
%%
"char"|"int"|"float"|"double"|"long"|"short"|"signed"|"unsigned"	flag=1;
[_A-Za-z]+[_A-Za-z0-9]*							{
										if(strstr(yytext,"main")>0)
											flag=0;
										if(flag)
										{
											id++;
											printf("Identifier=%s\n",yytext);
										}
									}
";"									flag=0;
.|\n									;
%%
main(int argc,char *argv[])
{
	yyin=fopen(argv[1],"r");
	yylex();
	printf("Total identifiers=%d\n",id);
	fclose(yyin);
}
