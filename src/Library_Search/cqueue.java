package library_search;

public class cqueue
{
	String queue[]=new String[3];
	int front=-1,rear=-1,size=3;
	public boolean isEmpty()
	{
		if(front==-1 && rear==-1)
			return true;
		return false;
	}
	public boolean isFull()
	{
		if(rear==front-1 || (front==0 && rear==size-1))
			return true;
		return false;
	}
	public void enqueue(String item)
	{
		if(rear==-1)
		{
			rear=0;
			front=0;
			queue[rear]=item;
		}
		else if(rear==size-1)
		{
			if(front!=0)
			{
				rear=0;
				queue[rear]=item;
			}
				
			else
				System.out.println("Queue FULL");
		}
		else if(!isFull())
		{
			queue[++rear]=item;
		}
		else
		{
			System.out.println("Queue is FULL");
		}
	}
	public String dequeue()
	{
		if(front==size-1)
		{
			String ele=queue[front];
			front=0;
			return ele;
		}
		else if(front==rear && rear!=-1 && front!=-1)
		{
			String ele=queue[front];
			front=-1;
			rear=-1;
			return ele;
		}
		else if(!isEmpty())
		{
			String ele=queue[front];
				front++;
			return ele;
		}
		else
		{
			System.out.println("Can't dequeue");
			return null;
		}

	}
	public String print()
	{
		String str="";
		if(front<=rear)
		{
			for(int i=front;i<=rear;i++)
			{
				if (front==-1)
					return "Empty";
				else 
				str+=queue[i]+", ";
			}
		}
		else
		{
			for(int i=front;i<=size-1;i++)
			{
				str+=queue[i]+", ";
			}
			for(int i=0;i<=rear;i++)
			{

				str+=queue[i]+", ";
			}
		}
		return str;
	}
}