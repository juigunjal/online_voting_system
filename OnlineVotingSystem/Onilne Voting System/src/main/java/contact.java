

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class contact
 */
@WebServlet("/contact")
public class contact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public contact() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html"); 
		try {
		DatabaseManager db = new DatabaseManager();
		Connection con = db.getConnection();
		
		String name = request.getParameter("name");
		String contact = request.getParameter("number");
		String email = request.getParameter("email");
		String comment = request.getParameter("comment");
		
			if(!(name.length() == 0 || name.equals("Enter Name") || contact.length() != 10 || 
					!(email.substring(email.length()-10).equals("@gmail.com")))){
			
			    PreparedStatement preparedStatement = con.prepareStatement("insert into contact (name,pnumber,email,comment) "
			    		+ "values( '"+name+"','"+contact+"','"+email+"','"+comment+"')");
			    preparedStatement.executeUpdate();
			    response.sendRedirect("thankyou.jsp");
			}else{
				request.setAttribute("error","Invalid Credentials");
		    	RequestDispatcher rd = request.getRequestDispatcher("contact.jsp");
		    	rd.forward(request,response);
			}
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
	}

}
