<%@ page import = "java.sql.*,java.util.*" %>
<%
	String uname=(String)session.getAttribute("uname");
	String course=request.getParameter("course");
%>

<!DOCTYPE html>
<html>
	<head>
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Chat Room</title>
		<link rel="stylesheet" href="chatWindow.css">
		<link rel="stylesheet" href="SubjectModule.css">
	
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
        <h2>Hi
			<%=uname%>
			<!--  %=course %>-->
		</h2>
		
			<br>
            <div class="box">
			<form name="f" action="insertmessage.jsp?course=<%=course %>" method="post">
				Message: <input type="text" name="txtMsg" value="" />
				<input type="submit" value="Send" name="cmdSend"/>
			</form>
				<br><br>
				<br><br>
				Messages in Chat Box:
				<br><br>
				<%
				try
		         {
		            Class.forName("com.mysql.cj.jdbc.Driver");
		            java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject","root","root");
		            Statement st=con.createStatement();
		            ResultSet rs=st.executeQuery("select * from comments where coursename='"+course+"' order by id;");
		          
		            // Print all retrieved messages
		            while(rs.next())
		            {
		                String username =rs.getString(2);
                        String msg= rs.getString(3);
                        String timestamp=rs.getString(5);
                        out.println("<p class='un'>"+username+"->"+msg+" "+timestamp+"</p>");
						//out.println("<p class='un'>"+username+"</p>"+"<p class='msg'>"+">>"+msg+"</p>");
		            }
		            con.close();
		         }
		         catch(Exception ex1) 
		         {
		        	 System.err.println(ex1.getMessage());
		         }
				%>
        </div>
	</body>
</html>