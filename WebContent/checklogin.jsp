<%@page import="java.sql.*" %>
<%
String uname = request.getParameter("uname");
String pwd = request.getParameter("pwd");
System.out.println(pwd);
int result=0;
try
{
	
	Connection con = null;
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject","root","root");
	
	 PreparedStatement stmt=con.prepareStatement("select * from users where username=? and psw=?");
     stmt.setString(1, uname);
     stmt.setString(2, pwd);
     ResultSet rs=stmt.executeQuery();
		
     if(rs.next()) {
    	 session.setAttribute("uname", uname);
    	 String role=rs.getString("role");
    	 System.out.println(role.equals("admin"));
    	 if(role.equals("admin")){
    		 response.sendRedirect("admin.jsp");
    	 }
    	 else{
    		 response.sendRedirect("SubjectModule.jsp");
    	 }
        
     }
     else {
       response.sendRedirect("login.html");
     }
     
}
catch(Exception e) {
 out.println(e);
}

%>