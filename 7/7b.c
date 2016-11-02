#include<stdio.h>
#include<sys/types.h>
int main()
{
	char cmd[20];
	pid_t pid;
	int ch;
	pid=fork();
	if(pid==0)
	{
		do
		{
			printf("Enter command: ");
			gets(cmd);
			system(cmd);
			printf("Enter 1 to continue, 0 to exit: ");
			scanf("%d",&ch);
		}while(ch);
	}
	wait();
	return 0;
}
