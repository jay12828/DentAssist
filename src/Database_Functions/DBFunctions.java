package Database_Functions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBFunctions {
    private static String dbURL = "jdbc:derby://localhost:1527/DentAssist;create=true";
    public static Connection conn = null;
    public static Statement stmt = null;
    
    public static Connection createConnection()
    {
        try
        {
            Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
            //Get a connection
            conn = DriverManager.getConnection(dbURL); 
        }
        catch (Exception except)
        {
            except.printStackTrace();
        }
		return conn;
    }
    
    //Dont know why I have this function here. Will Refactor later
    
    public static boolean authenticateUser(String username, String password)
    {
    	boolean user_validate = false;
        try
        {
            stmt = conn.createStatement();
            ResultSet results = stmt.executeQuery("select username, password from mine.REGISTRATION");

            while(results.next())
            {
                String u_name = results.getString(1);
                String p_word = results.getString(2);
                if (username.equals(u_name)){
                	if (password.equals(p_word)){
                		user_validate = true;
                	}
                }
            }
            results.close();
            stmt.close();
        }
        catch (SQLException sqlExcept)
        {
            sqlExcept.printStackTrace();
        }
		return user_validate;
    }
    
    public static void addPatients(Statement stmt, String Patient_id, String first_name, String last_name, String gender, String marital_status, String date_of_birth, String street_name, String house_number, String state, String city, String pin, String home_phone, String mobile, String email)
    {
        try
        {
        	String query = "insert into MINE.PATIENTS_DETAILS(patient_id,First_Name,Last_name,gender,marital_status,date_of_birth,street_name,house_no,state,city,pin,home_phone,mobile,email) values ('"+Patient_id+"','"+first_name+"','"+last_name+"','"+gender+"','"+marital_status+"','"+date_of_birth+"','"+street_name+"','"+house_number+"','"+state+"','"+city+"','"+pin+"','"+home_phone+"','"+mobile+"','"+email+"')";
       
            stmt.execute(query);
            stmt.close();
        }
        catch (SQLException sqlExcept)
        {
            sqlExcept.printStackTrace();
        }
    }
    
    public static void deletePatient(Statement stmt,String patient_id){
    	try
        {
        	String query = "delete from MINE.PATIENTS_DETAILS where patient_id='"+patient_id+"'";
       
            stmt.execute(query);
            stmt.close();
        }
        catch (SQLException sqlExcept)
        {
            sqlExcept.printStackTrace();
        }
    }
    
    public static void addAppointment(Statement stmt,String app_id, String patient_id, String appointment_date, String appointment_time, String treatment_summary){
    	try
        {
        	String query = "insert into MINE.APPOINTMENTS(app_id,patient_id,appointment_date,appointment_time,treatment_summary) values('"+app_id+"','"+patient_id+"','"+appointment_date+"','"+appointment_time+"','"+treatment_summary+"')";
       
            stmt.execute(query);
            stmt.close();
        }
        catch (SQLException sqlExcept)
        {
            sqlExcept.printStackTrace();
        }
    }
    
    public static int getProcID(Statement stmt, String procName){
    	int procID = 0;
    	try
        {
        	String query = "select proc_id from mine.tblprocedure where proc_name='"+procName+"'";
       
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){
            	procID = rs.getInt(1);
            }
           // stmt.close();
        }
        catch (SQLException sqlExcept)
        {
            sqlExcept.printStackTrace();
        }
		return procID;
    	
    }
    
    public static int getProcCost(Statement stmt, int procID){
    	int procCost = 0;
    	try
        {
        	String query = "select proc_cost from mine.tblprocedure where proc_id="+procID;
       
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){
            	procCost = rs.getInt(1);
            }
           // stmt.close();
        }
        catch (SQLException sqlExcept)
        {
            sqlExcept.printStackTrace();
        }
		return procCost;
    	
    }
    
    public static void insertPLan(Statement stmt, String Patient_ID, int proc_id, String Plan_Name, String proc_name, String Surface, int tooth_num, int proc_cost, String Status){
    	try
        {
        	String query = "insert into MINE.TREATMENT_PLAN(patient_id,proc_id,plan_name,proc_name,surface,tooth_no,proc_cost,Status) values('"+Patient_ID+"',"+proc_id+",'"+Plan_Name+"','"+proc_name+"','"+Surface+"',"+tooth_num+","+ proc_cost+",'"+Status+"')";
       
            stmt.execute(query);
            stmt.close();
        }
        catch (SQLException sqlExcept)
        {
            sqlExcept.printStackTrace();
        }
    }
    
    public static void addProcedure(Statement stmt,String proc_name, int proc_cost){
    	try
        {
        	String query = "insert into mine.tblprocedure(proc_name,proc_cost) values('"+proc_name+"',"+proc_cost+")";
       
            stmt.execute(query);
            stmt.close();
        }
        catch (SQLException sqlExcept)
        {
            sqlExcept.printStackTrace();
        }
    }
    
    public static void shutdown()
    {
        try
        {
            if (stmt != null)
            {
                stmt.close();
            }
            if (conn != null)
            {
                DriverManager.getConnection(dbURL + ";shutdown=true");
                conn.close();
            }           
        }
        catch (SQLException sqlExcept)
        {
            
        }

    }
    
}
