package Servlets.Treatment;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Request;

import Database_Functions.DBFunctions;

/**
 * Servlet implementation class treatmentPlan
 */
@WebServlet("/treatmentPlan")
public class treatmentPlan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @param name_prop 
     * @see HttpServlet#HttpServlet()
     */
	public static String getProcName(HttpServletRequest request, String name_prop){
		String procName = null;
		procName = request.getParameter(name_prop);
		return procName;
		
	}
	
    public treatmentPlan() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Patient_ID = request.getParameter("pid");
		String Plan_Name = request.getParameter("pn");
		int tooth_num = Integer.parseInt(request.getParameter("tn"));
		
		String[] procs;
		procs = new String[7];
		
		
			procs[0] = request.getParameter("amal");
			procs[1] = request.getParameter("crown");
			procs[2] = request.getParameter("prop");
			procs[3] = request.getParameter("bridge");
			procs[4] = request.getParameter("xray");
			procs[5] = request.getParameter("ext");
			procs[6] = request.getParameter("imp");
		
		String Status = request.getParameter("status");
		String Surface = "**";
		
		for(int i=0;i<procs.length;i++){
		if (!(procs[i].equals("None") || procs[i].equals("Not Required")) ){
			if(i==0){
				Surface = request.getParameter("surface");	
			}else{
				Surface = "**";
			}
		Statement stmt = null;
		try {
			stmt = DBFunctions.createConnection().createStatement();
			int procID = DBFunctions.getProcID(stmt, procs[i]);
			int procCost = DBFunctions.getProcCost(stmt, procID);
			DBFunctions.insertPLan(stmt, Patient_ID, procID, Plan_Name, procs[i], Surface, tooth_num, procCost,Status);
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		}
		}
		
		response.sendRedirect("single_patient_treatment_plans.jsp?q="+Patient_ID);
		
		
	}

}
