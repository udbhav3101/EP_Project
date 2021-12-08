<%@ page import="java.sql.*,java.text.DateFormat,java.util.Date,java.util.Calendar,java.text.SimpleDateFormat" 
language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%

String uname=(String)session.getAttribute("uname");
String comment=request.getParameter("txtMsg");
String course=request.getParameter("course");
System.out.println(course);
try
{
   Date date = Calendar.getInstance().getTime();  
   DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");  
   String timestamp = dateFormat.format(date); 
   String time,topic="#";	
   Class.forName("com.mysql.cj.jdbc.Driver");
   java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/discussionforum","root","root");
   PreparedStatement pstmt=con.prepareStatement("insert into comments(username,comment,coursename,timestamp) values(?,?,?,?,?,?)");
   pstmt.setString(1, uname);
   pstmt.setString(2, comment);
   pstmt.setString(3, course);
   pstmt.setString(4, timestamp);
   int n=pstmt.executeUpdate();
   if(n>0){
	   response.sendRedirect("ChatWindow.jsp?course="+course);
   }
   con.close();
}
catch(Exception ex1) 
{
	 System.err.println(ex1.getMessage());
}

%>