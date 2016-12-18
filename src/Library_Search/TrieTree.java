package library_search;
import java.util.*;
public class TrieTree
{
    private Node root;
    
    //CONSTRUCTOR
    public TrieTree()
    {
        root = new Node(' '); 
    }

    //INSERT NODE IN TRIE
    public void insert(String word)
    {       
        Node current = root; 
        for (char ch:word.toCharArray())
        {
            Node child=current.childNode(ch);
            if (child!=null) //IF CHILD OF SAME CHARACTER EXISTS
                current=child;
            else 
            {
                 current.getChildList().add(new Node(ch)); //CREATE NEW CHILD IF IT DOESN'T EXIST
                 current = current.childNode(ch);
            }
        }
        current.setEnd();//SET BOOKNAME TO END
    }
    
    
    public ArrayList search(String query)
	{
		if(query==null||query.isEmpty())
			return null;
		
		int flag=0;
		char[] ch=query.toCharArray();
		Node current=root;

		for(char c:ch)//FOR EVERY CHARACTER IN QUERY
		{
			if(current.getChildList().size()>0)//IF THERE EXISTS A CHILD OF CURRENT NODE
			{
				for(Node node:current.getChildList())//FOR EVERY CHILD OF CURRENT NODE
				{
					if(node.getContent()==c)//IF CHILD EQUALS CURRENT CHARACTER
					{
						current=node;
						flag=1;				
						break;
					}
				}
			}
			else
			{
				flag=0; //IF ANY OF THE CHARACTER IN QUERY DOESN'T MATCH CHILDLIST, FLAG WILL TURN TO 0 I.E. NOT PRESENT
				break;
			}
		}
		if(flag==1) //IF QUERY EXISTS IN OUR TRIE
		{
			ArrayList<String> matches=new ArrayList<String>();
			
			matches=getAllWords(current,query);//FIND ALL THE WORDS STARTING WITH PREFIX AS QUERY
			
			return matches;
		}
		return null;
	}
	
	private ArrayList getAllWords(Node current,String query) //PRIVATE BECAUSE ONLY THIS CLASS WILL USE IT
	{
		if(current.getChildList().size()==0)//IF QUERY ITSELF IS THE FULL NAME OF BOOK
		{
			ArrayList list = new ArrayList();
			list.add(query);
			return list;
		}
		else//IF QUERY IS JUST A PREFIX
		{
			ArrayList list = new ArrayList();
			for(Node n: current.getChildList())
			{
				list.addAll(getAllWords(n, query+n.getContent()));
			}
			return list;
		}
		
	}
    
    
}    