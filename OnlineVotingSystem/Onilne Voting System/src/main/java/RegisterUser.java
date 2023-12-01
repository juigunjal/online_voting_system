

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
//import java.sql.ResultSet;
import java.sql.SQLException;
//import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RegisterUser
 */
@WebServlet("/RegisterUser")
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterUser() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		try(PrintWriter out = response.getWriter()){
			
			String name = request.getParameter("name");
			String voter_card_number = request.getParameter("voternumber");
			String address = request.getParameter("address");
			String dob = request.getParameter("dob");
			String contact = request.getParameter("number");
			String email = request.getParameter("email");
			
			if(!(name.length() == 0 || name.equals("Enter Name") || voter_card_number.length() != 10 || address.equals("Enter Address")
					|| address.length() == 0 || dob.length() == 0 || contact.length() != 10 || 
					!(email.substring(email.length()-10).equals("@gmail.com")))){
//			if(true) {
			DatabaseManager db = new DatabaseManager();
			Connection con = db.getConnection();
			
		    PreparedStatement preparedStatement = con.prepareStatement("insert into voters (name,pnumber,email,voter_card_number,"
		    		+ "address,date_of_birth) values( '"+name+"','"+contact+"','"+email+"','"+voter_card_number+"','"+address+"','"+dob+"')");
		    preparedStatement.executeUpdate();
		    out.println("Registrartion success");
		    response.sendRedirect("adminwelcome.jsp");
			}else{
				request.setAttribute("error","Invalid Credentials");
		    	RequestDispatcher rd = request.getRequestDispatcher("registration.jsp");
		    	rd.forward(request,response);
			}
		    
			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
	}

}
