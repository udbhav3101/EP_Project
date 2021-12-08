import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/userhome")
public class userhome extends HttpServlet{
	public void service(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException {
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		
		HttpSession session = req.getSession(false);
		
		if(session!=null) {
			String uname = (String)session.getAttribute("uname");
			
			out.println("<h2 align = center>UserHomePage<h2>");

			out.println("Welcome: "+uname+"<br>");

			 
		RequestDispatcher rd = req.getRequestDispatcher("index1.html");
		rd.include(req,res);
			
			
		}
		else {
		
			
		out.println("Session Expired");
			 
		RequestDispatcher rd = req.getRequestDispatcher("login.html");
		rd.include(req,res);
		}
	}
	
}	
