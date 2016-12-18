package library_search;

import java.util.ArrayList;

public class Book
{
	private String bookName;
	private String type;
	private int avail;
	private String policy;
	public Book(String name,String typ,int av,String pol)
	{
		bookName=name;
		type=typ;
		avail=av;
		policy=pol;
	}
 	public ArrayList<Author> authors=new ArrayList<Author>();
	public String print()
	{
		String str="";
		for(int i=0;i<authors.size();i++)
		{
			str+=authors.get(i).getAuthorName()+", ";
		}
		return str;
	}
	
	//GET AND SET METHODS
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getAvail() {
		return avail;
	}
	public void setAvail(int avail) {
		this.avail = avail;
	}
	public String getPolicy() {
		return policy;
	}
	public void setPolicy(String policy) {
		this.policy = policy;
	}
	public ArrayList<Author> getAuthors() {
		return authors;
	}
	public void setAuthors(ArrayList<Author> authors) {
		this.authors = authors;
	}
	
	
}      
