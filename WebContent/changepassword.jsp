<%@ page import="java.sql.*" %>
<%
	String uname=(String)session.getAttribute("uname");
%>
<%
try
{
	Class.forName("com.mysql.cj.jdbc.Driver"); 
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject","root","root"); 
	
	if(request.getParameter("btn_update")!=null)
	{
		int id=Integer.parseInt(request.getParameter("edit"));
		
	String password;
		
		password=request.getParameter("name"); 
		
		
		PreparedStatement pstmt=null; 
		pstmt=con.prepareStatement("update users set psw=? where id ="+id+";");  
		pstmt.setString(1,password); 
		
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

<head>
    <title>Document</title>
    <link rel="stylesheet" href="subject.css">
    <style type="text/css">
		
		.main
		{
			width:1000px;;
			margin-left:250px;
			padding: 10px;
			border: 5px solid grey;
			
		}
		table
		{
			font-family: arial, sans-serif;
			border-collapse: collapse;
			width: 800px;
		}
		td
		{
			border: 5px solid silver;
			text-align: center;
			padding: 8px;
		}
		</style>	
		
		<script>
		
			function validate()
			{
				var passowrd = document.myform.password;
				
				
				if (passowrd.value == "")
				{
					window.alert("please enter password ?");
					name.focus();
					return false;
				}
				if (passowrd.length )
				{ 
					window.alert("please enter atleast 8 characters");
					owner.focus();
					return false;
				}
			}
			
		</script>
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
	<div class="main">

	<form method="post" name="myform"  onsubmit="return validate();">
	
		<center>
			<h1>ChangePassword</h1>
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
		
				String password;
		
				PreparedStatement pstmt=null;
				
				pstmt=con.prepareStatement("select psw from course where id=?;");
				pstmt.setInt(1,id);
				ResultSet rs=pstmt.executeQuery();
				
				while(rs.next()) 
				{
					
					password=rs.getString(2);
					
			%>
				<tr>
					<td>Password</td>
					<td><input type="text" name="name" value="<%=password%>"></td>
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
				<h1><a href="subjectModule.jsp">Back</a></h1>
		</center>
		
	</form>


</body>

</html>