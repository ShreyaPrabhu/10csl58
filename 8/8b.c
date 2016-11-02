#include<stdio.h>
int main()
{
	char buf1[]={"Hello--buffer--1"};
	char buf2[]={"Hello--buffer--2"};
	FILE *fp;
	fp=fopen("text.hole","w");
	fprintf(fp,buf1);
	fseek(fp,48,SEEK_SET);
	fprintf(fp,buf2);
	fclose(fp);
	return 0;
}
