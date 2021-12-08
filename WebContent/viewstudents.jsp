<%@page import="java.sql.*" %>

<%
try
{	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject","root","root");  

	if(request.getParameter("delete")!=null)
	{
		int id=Integer.parseInt(request.getParameter("delete"));
		
		PreparedStatement pstmt=null; 		
		pstmt=con.prepareStatement("delete from users where userid=? "); 
		pstmt.setInt(1,id);
		pstmt.executeUpdate(); 
		
		con.close(); 
	}
}
catch(Exception e)
{
	out.println(e);
}
%>	
<html>

	<head>
	
		<title>JSP:Insert, Update, Delete using MySQL</title>
		
		<style type="text/css">
		
		.main
		{
			width:1100px;;
			margin-left:250px;
			padding: 10px;
			border: 5px solid grey;
			
		}
		table
		{
			font-family: arial, sans-serif;
			border-collapse: collapse;
			width: 900px;
		}
		td
		{
			border: 5px solid silver;
			text-align: center;
			padding: 8px;
		}
		</style>
		<link rel="stylesheet" href="admin.css">
		
	</head>	
	
<body>
	<nav class="nav">
      <div class="container">
        <h1 class="logo"><a href="#"></a>My Website</h1>
        <ul>
          <li><a href="admin.jsp" class="current">Home</a></li>
          <li><a href="viewcomments.jsp">View Comments</a></li>
          <li><a href="viewstudents.jsp">View Students</a></li>
          <li><a href="viewfaculty.jsp">View Faculty</a></li>
          <li><a href="viewcourse.jsp">View Courses</a></li>
        </ul>
      </div>
    </nav>
    <div class="hero">
      <div class="container">
      </div>
    </div>
		<div class="main">
		
			<center>
				<h1><a href="addstudent.jsp">Add Record</a></h1>	
			</center>
		
		<table>
		
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Username</th>
				<th>email</th>
				<th>phone_number</th>
				<th>psw</th>
				<th>role</th>
				<th>address</th>
				<th>aboutme</th>
				<th>Year</th>
				<th>Semester</th>
			</tr>
		<%
		
		try
		{	
			Class.forName("com.mysql.jdbc.Driver");  
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject","root","root");  

			PreparedStatement pstmt=null;
		
			pstmt=con.prepareStatement("select * from users where role='student'"); 
			
			ResultSet rs=pstmt.executeQuery();
		
			while(rs.next())
			{	
		%>
				<tr>
					<td><%=rs.getInt(1)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=rs.getString(7)%></td>
					<td><%=rs.getString(8)%></td>
					<td><%=rs.getString(9)%></td>
					<td><%=rs.getString(10)%></td>
					<td><%=rs.getString(11)%></td>
					
					<td><a href="updatestudent.jsp?edit=<%=rs.getInt(1)%> ">Edit</a></td>
					<td><a href="?delete=<%=rs.getInt(1)%> ">Delete</a></td>
					
				</tr>
		<%
			}
			
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
		%>
		
		</table>
		
		</div>
		
			
</body>

</html>