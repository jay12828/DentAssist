package Servlets.Patients;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database_Functions.DBFunctions;

/**
 * Servlet implementation class Patients
 */
@WebServlet("/Patients")
public class Patients extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String pid = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Patients() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub		
		String patient_ID = request.getParameter("pid");
		response.sendRedirect("Single_Patient_Details.jsp?q="+patient_ID);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String first_name = request.getParameter("fname");
		String last_name = request.getParameter("lname");
		String gender = request.getParameter("gender");
		String marital_status = request.getParameter("m_status");
		String date_of_birth = request.getParameter("date_of_birth");
		String street_name = request.getParameter("street_name");
		String house_number = request.getParameter("house_number");
		String state = request.getParameter("state");
		String city = request.getParameter("city");
		String pin = request.getParameter("pin");
		String home_phone = request.getParameter("home_phone");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		
		Random rand = new Random();
		int randNumber = rand.nextInt();
		String patient_id = first_name + randNumber;
		
		
		
		Statement stmt = null;
		try {
			stmt = DBFunctions.createConnection().createStatement();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		DBFunctions.addPatients(stmt,patient_id,first_name, last_name, gender, marital_status, date_of_birth, street_name, house_number, state, city, pin, home_phone, mobile, email);
		try {
			stmt.close();
			DBFunctions.createConnection().close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("Patient_Details.jsp");
		
	}

}
