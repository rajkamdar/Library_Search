<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@page import="library_search.Author"%>
<%@page import="library_search.Book"%>
<%@page import="library_search.TrieTree"%>
<%@page import="library_search.cqueue"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Results</title>
</head>
<link rel="stylesheet" type="text/css" href="NewFile.css" media="screen" />
<body>
<form action="Results.jsp" method="get">
<div id="DA" >
<input name="ankit"  id="div_input" list="browsers" placeholder="Enter Book or Author.." style="margin-left:200px; margin-top:5px; width:400px; height:30px;">
<input type="submit" value="Search" style="height:35px; margin-top:5px;">
</div>
<center>

<% String st2=request.getParameter("Searchbox"); 
	TrieTree bookTrie=(TrieTree)session.getAttribute("btrie");
	cqueue recent=(cqueue)session.getAttribute("cqueue");
	TrieTree authorTrie=(TrieTree)session.getAttribute("atrie");
	HashMap authorMap=(HashMap)session.getAttribute("amap");
	HashMap bookMap=(HashMap)session.getAttribute("bmap");
	ArrayList<String> matches = bookTrie.search(st2);
	ArrayList<String> matches2 = authorTrie.search(st2);
	
	
                if(matches==null || matches.size() == 0)
        		{
        			System.out.println("Not found");
        		}
        		else
        		{
        			for(String str:matches)
        			{	
        				Book bo=(Book) bookMap.get(str);
        				
        				
        				%>
    					<table border="1" id="res">
    					<tr>
    					<td colspan="2" style="font-family:times new roman;">
    					<center><font family="Arial" size="6px" color="blue"><% out.println(bo.getBookName()); %></font></center>
    					</td>
    					</tr>
    					<tr>
    					<td width="40px">
    					<b>By</b>
    					</td>
    					<td>
    					<% out.println(bo.print()); %>
    					</td>
    					</tr>
    					<tr>
    					<td>
    					<b>Type</b>
    					</td>
    					<td>
    					<% out.println(bo.getType()); %>
    					</td>
    					</tr>
    					<tr>
    					<td>
    					<b>Available</b>
    					</td>
    					<td>
    					<% out.println(bo.getAvail()); %>
    					</td>
    					</tr>
    					<tr>
    					<td>
    					<b>Policy</b>
    					</td>
    					<td>
    					<% out.println(bo.getPolicy());%>
    					</td>
    					</tr>
    					<br>
    					</table>
    					<%
        			}
        		}
                
                if(matches2==null || matches2.size() == 0)
                {
        		}
        		else
        		{
        			for(String str:matches2)
        			{	
        				Author a=(Author) authorMap.get(str);
        				for(Book bo:a.books)
        				{
        					
        					%>
        					<table border="1" id="res">
        					<tr>
        					<td colspan="2" style="font-family:times new roman;">
        					<center><font family="Arial" size="6px" color="blue"><% out.println(bo.getBookName()); %></font></center>
        					</td>
        					</tr>
        					<tr>
        					<td width="40px">
        					<b>By</b>
        					</td>
        					<td>
        					<% out.println(bo.print()); %>
        					</td>
        					</tr>
        					<tr>
        					<td>
        					<b>Type</b>
        					</td>
        					<td>
        					<% out.println(bo.getType()); %>
        					</td>
        					</tr>
        					<tr>
        					<td>
        					<b>Available</b>
        					</td>
        					<td>
        					<% out.println(bo.getAvail()); %>
        					</td>
        					</tr>
        					<tr>
        					<td>
        					<b>Policy</b>
        					</td>
        					<td>
        					<% out.println(bo.getPolicy());%>
        					</td>
        					</tr>
        					<br>
        					</table>
        					<%
            				
            				
            				
            				
        				}
        			
        			}
        		}
                
                if(!recent.isFull())
                	recent.enqueue(st2);
                else
                {
                	recent.dequeue();
                	recent.enqueue(st2);
                }
                out.println("Recently Searched: ");
                out.println();
        		out.println(recent.print());
%>

</center>
</form>
</body>
</html>