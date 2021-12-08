<%@ page import="java.sql.*" %>  

<%
try
{	
	Class.forName("com.mysql.jdbc.Driver");  
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject","root","root");

	if(request.getParameter("btn_add")!=null)
	{
		String Name,username,email,phone_number,psw,role,address,aboutme,year,semester;
		
		Name=request.getParameter("name"); 
		username=request.getParameter("username");
		email=request.getParameter("email");
		phone_number=request.getParameter("phone_number");
		psw=request.getParameter("password");
		role="student";
		address=request.getParameter("address");
		aboutme=request.getParameter("aboutme");
		year=request.getParameter("year");
		semester=request.getParameter("semester");
		
		PreparedStatement pstmt=null;
		
		pstmt=con.prepareStatement("insert into users(email,fullname,phoneno,username,psw,role,Address,aboutme,year,semester) values(?,?,?,?,?,?,?,?,?,?);");  
		pstmt.setString(1,email); 
		pstmt.setString(2,Name); 
		pstmt.setString(3,phone_number); 
		pstmt.setString(4,username); 
		pstmt.setString(5,psw); 
		pstmt.setString(6,role); 
		pstmt.setString(7,address); 
		pstmt.setString(8,aboutme); 
		pstmt.setString(9,year); 
		pstmt.setString(10,semester); 
		
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
	
		<title>Add Student</title>
		
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
				var name = document.myform.txt_name;
				var owner = document.myform.txt_owner;
				
				if (name.value == "")
				{
					window.alert("please enter name ?");
					name.focus();
					return false;
				}
				if (owner.value == "")
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
					<td>Name</td>
					<td><input type="text" name="name"></td>
				</tr>
				
				<tr>
					<td>username</td>
					<td><input type="text" name="username"></td>
				</tr>	
				<tr>
					<td>email</td>
					<td><input type="text" name="email"></td>
				</tr>
				<tr>
					<td>phone_number</td>
					<td><input type="text" name="phone_number"></td>
				</tr>
				<tr>
					<td>password</td>
					<td><input type="text" name="password"></td>
				</tr>
				<tr>
					<td>address</td>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<td>aboutme</td>
					<td><input type="text" name="aboutme"></td>
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
					<h1><a href="viewstudents.jsp">Back</a></h1>
				</center>
				
		</form>
		
		</div>

</body>

</html>