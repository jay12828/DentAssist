package Servlets.Appointment;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database_Functions.DBFunctions;

/**
 * Servlet implementation class appointment
 */
@WebServlet("/appointment")
public class appointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public appointment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String app_date = request.getParameter("app_date");
		String app_time =request.getParameter("app_time_hr")+":"+request.getParameter("app_time_min")+" " +request.getParameter("am_pm");
		String treat_summary = request.getParameter("q_treat");
		Random rand = new Random();
		int randNumber = rand.nextInt();
		String app_id = "app" + randNumber;
		
		String patient_ID = request.getParameter("q");
		
		Statement stmt = null;
		try {
			stmt = DBFunctions.createConnection().createStatement();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		DBFunctions.addAppointment(stmt, app_id, patient_ID, app_date, app_time, treat_summary);
		
		try {
			stmt.close();
			DBFunctions.createConnection().close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("Single_Patient_Details.jsp?q="+patient_ID);
		
	}

}
