<%@ page import = "java.sql.*,java.util.*" %>
<%
	String uname=(String)session.getAttribute("uname");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document</title>
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
    <p>Welcome Admin</p>
  </body>
</html>