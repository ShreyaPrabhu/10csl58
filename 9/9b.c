#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
int main()
{
	pid_t pid;
	pid=fork();
	if(pid<0)
	{
		printf("Fork error\n");
		exit(0);
	}
	else if(pid==0)
	{
		printf("\nThis is child process\n");
		printf("Child pid=%d\n",getpid());
		printf("Parent pid=%d\n",getppid());
	}
	else
	{
		wait();
		printf("This is parent process\n");
		printf("Child pid=%d\n",pid);
		printf("Parent pid=%d\n",getpid());
		exit(0);
	}
}
