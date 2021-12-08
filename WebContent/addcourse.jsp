<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html><%@ page import="java.sql.*" %>  

<%
try
{	
	Class.forName("com.mysql.jdbc.Driver");  
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject","root","root"); 

	if(request.getParameter("btn_add")!=null) 
	{
		String name,branch,year,semester;
		
		name=request.getParameter("name"); 
		branch=request.getParameter("branch");
		year=request.getParameter("year");
		semester=request.getParameter("semester");
		
		PreparedStatement pstmt=null; 
		
		pstmt=con.prepareStatement("insert into course(coursename,branch,year,semester) values(?,?,?,?);");  
		pstmt.setString(1,name); 
		pstmt.setString(2,branch); 
		pstmt.setString(3,year); 
		pstmt.setString(4,semester);  
		
		pstmt.executeUpdate(); 
		
		con.close();  
		
		out.println("Insert Successfully...! Click Back link.");
		
	}	
	
}
catch(Exception e)
{
	out.println(e);
}

%>

<html>

	<head>
	
		<title>Add Course</title>
		
		<style type="text/css">
		
		.main
		{
			width:700px;;
			margin-left:250px;
			padding: 10px;
			border: 5px solid grey;
			
		}
		table
		{
			font-family: arial, sans-serif;
			border-collapse: collapse;
			width: 600px;
		}
		td
		{
			border: 5px solid silver;
			text-align: left;
			padding: 8px;
		}
		</style>
		
		<script>
		
			function validate()
			{
				var name = document.myform.name;
				var branch = document.myform.branch;
				
				if (name.value == "")
				{
					window.alert("please enter name ?");
					name.focus();
					return false;
				}
				if (branch.value == "")
				{
					window.alert("please enter owner ?");
					owner.focus();
					return false;
				}
			}
			
		</script>
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

		<form method="post" name="myform"  onsubmit="return validate();">
	
			<center>
				<h1>Insert Record</h1>
			</center>
		
			
			<table>	
		
				<tr>
					<td>Course Name</td>
					<td><input type="text" name="name"></td>
				</tr>
				
				<tr>
					<td>Branch</td>
					<td><input type="text" name="branch"></td>
				</tr>	
				<tr>
					<td>Year</td>
					<td><input type="text" name="year"></td>
				</tr>
				<tr>
					<td>Semester</td>
					<td><input type="text" name="semester"></td>
				</tr>
				<tr>
					<td><input type="submit" name="btn_add" value="Insert"></td>	
				</tr>
				
			</table>
			
				<center>
					<h1><a href="viewcourse.jsp">Back</a></h1>
				</center>
				
		</form>
		
		</div>

</body>

</html>