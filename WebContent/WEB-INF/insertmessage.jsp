<%@page import="java.sql.*" %>
<%
String message = request.getParameter("txtMsg");



try
{
	
	Connection con = null;
	Class.forName("com.mysql.jdbc.Driver");
	
 	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hello_chat","root","root");
	
	PreparedStatement pstmt = con.prepareStatement(" insert into hello_message values(?,?)");
	
	pstmt.setString(2, message);
	//pstmt.setString(1,//uname);
	
	
	int n = pstmt.executeUpdate();
	
	if(n>0)
	{
		out.println("<h2 align=center>Message inserted succesfully Kiddo</h2>");
		RequestDispatcher rd = request.getRequestDispatcher("ChatWindow.jsp");
		rd.include(request, response);
	}
	else
	{
		out.println("<h2 align=center>Insertion failed Failed</h2>");
		RequestDispatcher rd = request.getRequestDispatcher("ChatWindow.jsp");
		rd.include(request, response);
	}
	
	con.close();
}
catch(Exception e)
{
	out.println(e);
}
%>