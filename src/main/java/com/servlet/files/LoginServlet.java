package com.servlet.files;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
    	System.out.println("-1");
    	
        try {
        	
	            // Fix: Change to expense_g database
	        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/expense_g", "root", "");
            if (connection != null) {
                String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, password);
               ResultSet resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                	// Fix: Change 'fullname' to 'Fullname' to match your database schema
                    int user_id = resultSet.getInt("user_id");
                    String fullname = resultSet.getString("Fullname");
                    String email = resultSet.getString("Email");
                    int age = resultSet.getInt("Age");
                    int salary = resultSet.getInt("Salary");

                    // You can set user information in the session and redirect to the dashboard
                    HttpSession session = request.getSession();
                    session.setAttribute("user_id", user_id);
                    session.setAttribute("username", username);
                    session.setAttribute("fullname", fullname);
                    session.setAttribute("email", email);
                    session.setAttribute("age", age);
                    session.setAttribute("salary", salary);
                    
                    response.sendRedirect("home.jsp");

                } else if ("username".equals(username) && "password".equals(password)) {
            	    response.sendRedirect("adminpage.jsp");
            	} else {
                    // If no rows are returned, it's an invalid login
                    response.sendRedirect("login.jsp?error=db");
                }
            }
           
            else {
                // Handle a failed database connection here
                response.sendRedirect("login.jsp?error=db");
            }
        } catch (SQLException e) {
            // Handle database-related exceptions here
            response.sendRedirect("login.jsp?error=db");
        } 
            
    }
}
