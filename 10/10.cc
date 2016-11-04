#include<iostream>
using namespace std;
class STRF;
class RRB;
class process
{
	int at,bt,rt,fin;
	public :	
		process() {}
		void set (int x,int y)
		{
			at=x;
			bt=rt=y;fin=0;
		}
		friend class SRTF;
		friend class RRB;
};
class RRB
{
	double awt,atat;
	int np,tq;
	process p[100];
	public:
		RRB(){}
		RRB(process a[],int n)
		{
			np=n;
			for(int i=0;i<n;i++)
				p[i].set(a[i].at,a[i].bt);
			cout<<"\n Enter the QuantamTime\t";
			cin>>tq;
		}
		void compute()
		{
			int flag=0,b,i=0,time=0,n=np,finish=0;
			cout<<"\nprocess\t   TT\t WT";
			while(finish<n)
			{
				if(p[i].rt<=tq && p[i].rt>0)
				{
					time+=p[i].rt;
					p[i].rt=0;
					flag=1;
				}
				else if(p[i].rt>0)
				{
					p[i].rt-=tq;
					time+=tq;
				}
				if(p[i].rt==0 && flag==1)
				{
					finish++;p[i].fin=1;
					cout<<"\np["<<i<<"]\t   "<<time;
					cout<<"\t  "<<time-p[i].bt;
					awt+=time-p[i].bt;
					atat+=time;
					flag=0;
				}
				if(i==n-1)
					i=0;
				else
				{
					for(b=(i+1);b<n;b++)
						if(p[b].fin==0)
						{
							i=b;
							break;
						}
			//	}
			}
			cout<<"\naverage wait time = "<<awt/n;
			cout<<"\naverage turn around time ="<<atat/n<<endl;
		}
};		
class SRTF
{
	double awt,atat;
	int np;
	process p[100];
	public:
		SRTF(){}
		SRTF(process a[],int n)
		{
			np=n;
			for(int i=0;i<n;i++)
				p[i].set(a[i].at,a[i].bt);
		}
		void compute()
		{
			int et=0,min,i,finish=0,n=np,time;
			cout<<"\nprocess\t   TT\t WT";
			p[9].rt=9999;
			for(time=0;finish<n;time++)
			{
				min=9;
				for(i=0;i<n;i++)
					if(p[i].at<=time && p[i].rt<p[min].rt && p[i].rt>0)
						min=i;
				p[min].rt--;
				if(p[min].rt==0)
				{
					et=time+1;
					finish++;
					cout<<"\np["<<min<<"]\t   "<<et-p[min].at;
					cout<<"\t  "<<et-p[min].bt-p[min].at;
					awt+=et-p[min].bt-p[min].at;
					atat+=et-p[min].at;
				}
			}
			cout<<"\naverage wait time = "<<awt/n;
			cout<<"\naverage turn around time ="<<atat/n<<endl;
		}
};
int main()
{
	int n;
	int at,bt;
	cout<<"enter the number of process \t";
	cin>>n;
	process p[100];
	for(int i=0;i<n;i++)
	{
		cout<<"\nenter the burst time of process \t"<<i<<"\t";cin>>bt;
		cout<<"enter the arrival time of process \t"<<i<<"\t";cin>>at;
		p[i].set(at,bt);
	}
	SRTF x(p,n);
	cout <<"\n---------------SRTF Schedule Algorithm------------\n";
	x.compute();
	cout <<"\n---------------RoundRobin Schedule Algorithm------\n";
	RRB y(p,n);
	y.compute();
	printf("\n");
}
