
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


//import com.mysql.cj.xdevapi.Statement;

/**
 * Servlet implementation class adminLogin
 */
@WebServlet("/adminLogin")
public class adminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public adminLogin() {
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
		PrintWriter out = response.getWriter();
		
		String admin_name = request.getParameter("adminName");
		String admin_password = request.getParameter("password");
		
		DatabaseManager db = new DatabaseManager();
		Connection con = db.getConnection();
		
		try{
		    PreparedStatement preparedStatement = con.prepareStatement("select * from admin where adminName ="+"'"+admin_name+"'"+" and adminPass = "+"'"+ admin_password+"'");
		    ResultSet rs = preparedStatement.executeQuery();

		    if(rs.next()){
		        HttpSession session = request.getSession();
		        session.setAttribute("adminname",admin_name);
		        response.sendRedirect("adminwelcome.jsp");
		    }else{
		    	request.setAttribute("error","Invalid Credentials");
		    	RequestDispatcher rd = request.getRequestDispatcher("adminlogin.jsp");
		    	rd.forward(request,response);
//		        response.sendRedirect("wrong.jsp");
//		    	out.println("working");
		    }
		}catch (Exception e){
		    out.println(e.getMessage());
		}
	}

}
