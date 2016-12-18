package library_search;

import java.util.*;

public class Author
{
	private String authorName;
	public ArrayList<Book> books=new ArrayList<Book>();
	
	public Author(String name)
	{
		authorName=name;
	}
	
	//GET AND SET METHODS
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	public ArrayList<Book> getBooks() {
		return books;
	}
	public void setBooks(ArrayList<Book> books) {
		this.books = books;
	}
}

