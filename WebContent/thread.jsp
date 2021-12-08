<%@page import="java.sql.*" %>
<%
String subjectname =request.getParameter("subject");
int result = 0;
try{
    Connection con = null;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject","root","root");
    PreparedStatement ps = con.prepareStatement("select * from subjecttable where subjectname = ? or shortcutsubject = ?;");
    ps.setString(1, subjectname);
    ps.setString(2, subjectname);
    ResultSet rs = ps.executeQuery();
    rs.next();
    if(rs.getString(1)!=null)
    {
    	session.setAttribute("subject", subjectname);
        response.sendRedirect(rs.getString(2)+".html");
        request.getSession();
        session.setMaxInactiveInterval(5);
  		response.sendRedirect("userhome");
    }
    else
    {
    	response.sendRedirect("demo.html");
    }    
}
catch(Exception e){
    System.out.println(e);
}
%>