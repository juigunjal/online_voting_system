

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
 * Servlet implementation class vote
 */
@WebServlet("/vote")
public class vote extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public vote() {
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
		
		String voterid = request.getParameter("voterid");
		String partie = request.getParameter("partie");
		
		DatabaseManager db = new DatabaseManager();
		Connection con = db.getConnection();
		
		try{
				PreparedStatement preparedStatement = con.prepareStatement("insert into temp_vc_number (voter_card_number) values('"+voterid+"')");
			    PreparedStatement preparedStatement2 = con.prepareStatement("insert into vote (voter_card_number,partie) values('"+voterid+"','"+partie+"')");
			    preparedStatement.executeUpdate();
			    preparedStatement2.executeUpdate();
			    
			    response.sendRedirect("index.jsp");
				   
		}catch (Exception e){
		    out.println(e.getMessage());
		}
	}

}
