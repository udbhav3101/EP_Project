<%@ page import="java.sql.*" %>

<%
try
{
	Class.forName("com.mysql.cj.jdbc.Driver"); 
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject","root","root"); 
	
	if(request.getParameter("btn_update")!=null)
	{
		int id=Integer.parseInt(request.getParameter("edit"));
		
	String name,branch,year,semester;
		
		name=request.getParameter("name"); 
		branch=request.getParameter("username");
		year=request.getParameter("email");
		semester=request.getParameter("phone_number");
		
		PreparedStatement pstmt=null; 
		pstmt=con.prepareStatement("update users set name=?,branch=?,year=?,semester=?where id ="+id+";");  
		pstmt.setString(1,name); 
		pstmt.setString(2,branch); 
		pstmt.setString(3,year); 
		pstmt.setString(4,semester);
		
		pstmt.executeUpdate();
		
		con.close(); //connection close

		out.println("Update Successfully...! Click Back link.");
	}	
	
}
catch(Exception e)
{
	out.println(e);
}

%>

<html>

	<head>
	
		<title>Update Course</title>
		<link rel="stylesheet" href="admin.css">
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
			<h1>Update Record</h1>
		</center>
		
		<table>	
		   <%
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject","root","root");  
	
			if(request.getParameter("edit")!=null) 
			{
				int id=Integer.parseInt(request.getParameter("edit"));
		
				String name,branch,year,semester;
		
				PreparedStatement pstmt=null;
				
				pstmt=con.prepareStatement("select * from course where id=?;");
				pstmt.setInt(1,id);
				ResultSet rs=pstmt.executeQuery();
				
				while(rs.next()) 
				{
					
					name=rs.getString(2);
					branch=rs.getString(3);
					year=rs.getString(4);
					semester=rs.getString(5);

			%>
			<tr>
					<td>Course Name</td>
					<td><input type="text" name="name" value="<%=name%>"></td>
				</tr>
				
				<tr>
					<td>Branch</td>
					<td><input type="text" name="username" value="<%=branch%>"></td>
				</tr>	
				<tr>
					<td>Year</td>
					<td><input type="text" name="email" value="<%=year%>"></td>
				</tr>
				<tr>
					<td>Semester</td>
					<td><input type="text" name="phone_number" value="<%=semester%>"></td>
				</tr>				
				<input type="hidden" name="txt_hide" value="<%=id%>">
		<%
				}
			}
		}
		catch(Exception e)
		{
			out.println(e);
		}
		%>	
		</table>
		
		<center>
				<h1><a href="viewcourse.jsp">Back</a></h1>
		</center>
		
	</form>


</body>

</html>