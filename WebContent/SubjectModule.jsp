<%@ page import = "java.sql.*,java.util.*" %>
<%
	String uname=(String)session.getAttribute("uname");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document</title>
    <link rel="stylesheet" href="subject.css">
</head>
<body>  
  <div class='nav'>
    <ul>
      <li style="float:left"><a href="SubjectModule.jsp" style="font-size: 17px;">ELUCIDATE</a></li>
      <li><a href="login.html">Logout</a></li>
      <!-- 
      		<li><a href="#">MyActivity</a></li>
      		<li><a href="#">ToDO</a></li>
      		<li><a href="#">Profile</a></li>
    	 -->
    </ul>
  </div>  
	<form  action="assign.jsp">
      <div class='row'>
        
	<%
				try
		         {
		            Class.forName("com.mysql.cj.jdbc.Driver");
		            java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject","root","root");
		            Statement st=con.createStatement();
		            ResultSet rs=st.executeQuery("select * from course c,users u where c.year=u.year and c.semester=u.semester and username='"+uname+"' ;");
		            
		            
		            // Print all retrieved messages
		            while(rs.next())
		            {
		            	
		            	out.println("<div class='column'>");
		            	out.println("<div class='card'>");
		                String SubjectID = rs.getString(1);
                        String SubjectName = rs.getString(2);
                        String AboutSubject = rs.getString(3);
						out.println("<h3>"+"</h3>"+"<a id='"+SubjectName+"' name='"+SubjectName+
								"' href=ChatWindow.jsp?course="+SubjectName+">"+SubjectName+"</a>"+"<p class='AboutSubject'>"
						+AboutSubject+"</p>");
						out.println("</div>");
		            	out.println("</div>");
		            }
		            con.close();
		         }
		         catch(Exception ex1) 
		         {
		        	 System.err.println(ex1.getMessage());
		         }
				%>
        </div>
      </div>
    </div>  
    </form> 
   
</body>
</html>