%{
#include<stdio.h>
int count=0,mlc=0,slc=0;
%}
%%
.		{
			if(!mlc && !slc)
			{
				fprintf(yyout,"%s",yytext);
			}
		}
"//"		{
			slc=1;
		}
"/*"		{
			mlc=1;
		}
\n		{
			if(slc)
			{
				count++;
				slc=0;
				fprintf(yyout,"\n");
			}
			if(!mlc)
			{
				fprintf(yyout,"\n");
			}
		}
"*/"		{
			if(mlc)
			{
				count++;
				mlc=0;
			}
		}
%%
main()
{
	yyin=fopen("x","r");
	yyout=fopen("y","w");
	yylex();
	printf("Comments=%d\n",count);
	fclose(yyin);
	fclose(yyout);
}
				
