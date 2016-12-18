<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@page import="library_search.Author"%>
<%@page import="library_search.Book"%>
<%@page import="library_search.TrieTree"%>
<%@page import="library_search.cqueue"%>
<html>

<head>
	<title>Library Search</title>
	 <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <!--Mobile Optimized-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>


<link rel="stylesheet" type="text/css" href="frontpage_css.css" media="screen" />


<body>
      <!--Import jQuery-->
      <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
  
<div id="div_trans_box">
<form action="Results.jsp" method="get">
	<!--Details of books and authors-->	
 <%
	
        HashMap<String,Book> bookMap=new HashMap();
        HashMap<String,Author> authorMap=new HashMap();
        TrieTree bookTrie=new TrieTree();
    	cqueue recent=new cqueue();
        TrieTree authorTrie=new TrieTree();
            Connection con = null;
        try {
             Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/project","root","password");
            out.println("done");
        } catch (SQLException ex) {
            System.out.print("Internal Server Error");
        }
        Statement st=con.createStatement();
        st.executeQuery("SELECT DISTINCT(BName),type,available,policy FROM Books");
             ResultSet rs = st.getResultSet();
          


                 %>
           <center><input name="Searchbox"  id="div_input" list="browsers" placeholder="Enter Book or Author.." >



<datalist id="browsers">
<!--Add all Book and Author details in HashMaps of Book and Author, add names on Trie and datalist-->	

	<%
while(rs.next())
             {
                 %>
                    <% bookMap.put(rs.getString("BName"), new Book(rs.getString("BName"),rs.getString("type"),Integer.parseInt(rs.getString("available")),rs.getString("policy")));
                    bookTrie.insert(rs.getString("BName"));%>
                    <option value="<%out.print(rs.getString("BName"));%>">
                
                 <%
           
             }
	 st.executeQuery("SELECT DISTINCT(AName) FROM Authors");
     ResultSet rs1 = st.getResultSet();
     while(rs1.next())
     {
         %>
         <% authorMap.put(rs1.getString("AName"), new Author(rs1.getString("AName")));
          authorTrie.insert(rs1.getString("AName"));%>
                   
            <option value="<%out.print(rs1.getString("AName"));%>">
        <!--For every entry in combined author-book relation, add author names to bookMap and vice versa-->
         <%
   
     }
     st.executeQuery("select b.BName,a.AName,b.available,b.type,b.policy from Books b,Author_Book a where a.BName=b.BName");
     ResultSet rs2 = st.getResultSet();
     while(rs2.next())
     {
         %>
        <% if(bookMap.containsKey(rs2.getString("BName")))
        {
        	Book b=bookMap.get(rs2.getString("BName"));
        	b.authors.add(authorMap.get(rs2.getString("AName")));
        }
        
        if(authorMap.containsKey(rs2.getString("AName")))
        {
        	Author a=authorMap.get(rs2.getString("AName"));
        	a.books.add(bookMap.get(rs2.getString("BName")));
        }
        
       
        
        
       
        %>
                   
            
        
         <%
   
     }
     session.setAttribute("btrie", bookTrie);
     session.setAttribute("atrie", ta);
     session.setAttribute("amap",authorMap);
     session.setAttribute("bmap",bookMap);
     session.setAttribute("cqueue",recent);


%>
	</datalist></center>
	
<center><font color="white"><a class="waves-effect waves-light btn"> <input type="submit" value="Search" name="submit"></a></font></center>
</form>
</div>

</body>

</html>