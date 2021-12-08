<%@page import="java.sql.*" %>
<%
String email = request.getParameter("email");
String uname = request.getParameter("uname");
String fname =request.getParameter("fname");
String pno =request.getParameter("pno");
String psw = request.getParameter("psw");

try
{
	
	Connection con = null;
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject","root","root");
	
	PreparedStatement pstmt = con.prepareStatement(" insert into users(email,fullname,phoneno,username,psw,role,Address,aboutme)"+ 
			" values(?,?,?,?,?,?,?,?);");
	
	pstmt.setString(1, email);
	pstmt.setString(2, fname);
	pstmt.setString(3,pno);
	pstmt.setString(4,uname);
	pstmt.setString(5,psw);
	pstmt.setNull(6, java.sql.Types.VARCHAR);
	pstmt.setNull(7, java.sql.Types.VARCHAR);
	pstmt.setNull(8, java.sql.Types.VARCHAR);
	
	
	
	int n = pstmt.executeUpdate();
	
	if(n>0)
	{
		out.println("<h2 align=center>Registered Succesfully</h2>");
		RequestDispatcher rd = request.getRequestDispatcher("login.html");
		rd.include(request, response);
	}
	else
	{
		out.println("<h2 align=center>Registration Failed</h2>");
		RequestDispatcher rd = request.getRequestDispatcher("registration.html");
		rd.include(request, response);
	}
	
	con.close();
}
catch(Exception e)
{
	out.println(e);
}
%>