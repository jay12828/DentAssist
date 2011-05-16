package Servlets.Login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.apache.catalina.Session;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    HttpSession session;
    private static String dbURL = "jdbc:derby://localhost:1527/DentAssist;create=true";
    private static Connection conn = null;
    private static Statement stmt = null;
    public static String UserName;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }
    private static void createConnection()
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
    }
    
    private static boolean authenticateUser(String username, String password)
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
    
    private static void shutdown()
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
		String user_name = request.getParameter("uname");
		String pass_word = request.getParameter("pword");

		createConnection();
		if (authenticateUser(user_name, pass_word)){
			response.sendRedirect("Home.jsp");
		}
		else{
			response.sendRedirect("error.jsp");
		}
		shutdown();
		
		
	}

}
