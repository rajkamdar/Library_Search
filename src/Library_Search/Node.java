package library_search;
import java.util.*;
public class Node 
{
    private char content; 
    private boolean isEnd;  //UNLIKE NORMAL TRIE, HERE WORD ENDS AFTER NAME OF BOOK ENDS
    private LinkedList<Node> childList; //CONTAINS EVERY NODE THAT IS CHILD OF CURRENT NODE
    
    //CONSTRUCTOR
    public Node(char c)
    {
        childList = new LinkedList<Node>();
        isEnd = false;
        content = c;
    }  
    
    //FUNCTION TO CHECK WHETHER THERE EXISTS A NODE IN CHILDLIST
    public Node childNode(char c)
    {
        if (childList != null)
            for (Node n:childList)
                if (n.content == c)
                    return n;
        return null;
    }
    
    //GET AND SET METHODS
    public char getContent() {
		return content;
	}
	public void setContent(char content) {
		this.content = content;
	}
	public boolean isEnd() {
		return isEnd;
	}
	public void setEnd() {
		this.isEnd = true;
	}
	public LinkedList<Node> getChildList() {
		return childList;
	}
	public void setChildList(LinkedList<Node> childList) {
		this.childList = childList;
	}
	
}
 

 