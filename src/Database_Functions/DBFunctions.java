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
