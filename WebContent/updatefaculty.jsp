<%@ page import="java.sql.*" %>

<%
try
{
	Class.forName("com.mysql.cj.jdbc.Driver"); 
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject","root","root"); 
	
	if(request.getParameter("btn_update")!=null)
	{
		int id=Integer.parseInt(request.getParameter("edit"));
		
	String Name,username,email,phone_number,psw,role,address,aboutme;
		
		Name=request.getParameter("name"); 
		username=request.getParameter("username");
		email=request.getParameter("email");
		phone_number=request.getParameter("phone_number");
		psw=request.getParameter("password");
		role="faculty";
		address=request.getParameter("address");
		aboutme=request.getParameter("aboutme");
		
		PreparedStatement pstmt=null; 
		pstmt=con.prepareStatement("update users set email=?,fullname=?,phoneno=?,username=?,psw=?,role=?,address=?,aboutme=? where userid ="+id+";");  
		pstmt.setString(1,email); 
		pstmt.setString(2,Name); 
		pstmt.setString(3,phone_number); 
		pstmt.setString(4,username); 
		pstmt.setString(5,psw); 
		pstmt.setString(6,role); 
		pstmt.setString(7,address); 
		pstmt.setString(8,aboutme); 
		
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
	
		<title>Update Faculty</title>
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
		
				String Name,username,email,phone_number,psw,role,address,aboutme;
		
				PreparedStatement pstmt=null;
				
				pstmt=con.prepareStatement("select * from users where userid=?;");
				pstmt.setInt(1,id);
				ResultSet rs=pstmt.executeQuery();
				
				while(rs.next()) 
				{
					
					Name=rs.getString(3);
					username=rs.getString(5);
					email=rs.getString(2);
					phone_number=rs.getString(4);
					psw=rs.getString(6);
					role=rs.getString(7);
					address=rs.getString(8);
					aboutme=rs.getString(9);

			%>
			<tr>
					<td>Name</td>
					<td><input type="text" name="name" value="<%=Name%>"></td>
				</tr>
				
				<tr>
					<td>username</td>
					<td><input type="text" name="username" value="<%=username%>"></td>
				</tr>	
				<tr>
					<td>email</td>
					<td><input type="text" name="email" value="<%=email%>"></td>
				</tr>
				<tr>
					<td>phone_number</td>
					<td><input type="text" name="phone_number" value="<%=phone_number%>"></td>
				</tr>
				<tr>
					<td>password</td>
					<td><input type="text" name="password" value="<%=psw%>"></td>
				</tr>
				<tr>
					<td>address</td>
					<td><input type="text" name="address" value="<%=address%>"></td>
				</tr>
				<tr>
					<td>aboutme</td>
					<td><input type="text" name="aboutme" value="<%=aboutme%>"></td>
				</tr>
				<tr>
					<td><input type="submit" name="btn_update" value="Update"></td>	
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
				<h1><a href="viewfaculty.jsp">Back</a></h1>
		</center>
		
	</form>


</body>

</html>