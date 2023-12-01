

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

/**
 * Servlet implementation class voterLogin
 */
@WebServlet("/voterLogin")
public class voterLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public voterLogin() {
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
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String voternum = request.getParameter("voterNumber");
		
		DatabaseManager db = new DatabaseManager();
		Connection con = db.getConnection();
		
		try{
		    PreparedStatement preparedStatement = con.prepareStatement("select voter_card_number from temp_vc_number where voter_card_number ="+"'"+voternum+"'");
		    ResultSet rs = preparedStatement.executeQuery();

		    if(rs.next()){
		    	request.setAttribute("error","You Have Already Voted.");
		    	RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		    	rd.forward(request,response);
		    }else{
		    	PreparedStatement preparedStatement2 = con.prepareStatement("select vid,pnumber from voters where voter_card_number ="+"'"+voternum+"'");
			    ResultSet rs2 = preparedStatement2.executeQuery();
		    	
			    if(rs2.next()) {
//			    	response.sendRedirect("userwelcome.jsp?vid="+voternum);
			    	request.setAttribute("voterid",voternum);
			    	RequestDispatcher rd = request.getRequestDispatcher("userwelcome.jsp");
			    	rd.forward(request,response);
			    	
			    }else {
			    	request.setAttribute("error","Invalid Voter Card Number.");
			    	RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			    	rd.forward(request,response);
			    }
		    }
		}catch (Exception e){
		    out.println(e.getMessage());
		}
//		out.println(voternum);
	}

}
