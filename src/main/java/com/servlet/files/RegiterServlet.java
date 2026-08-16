package com.servlet.files;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegiterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RegiterServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Move the existing doGet logic here
        String Fullname = request.getParameter("fullname");
        String Password = request.getParameter("password");
        int Age = Integer.parseInt(request.getParameter("age"));
        int Salary = Integer.parseInt(request.getParameter("salary"));
        String Email = request.getParameter("email");
        String Occupation = request.getParameter("occupation");
        String username = request.getParameter("username");
        int user_id = generateUniqueUserID();
    
        if (insertUserToDatabase(user_id, Fullname, Password, Age, Salary, Email, Occupation, username)) {
            response.sendRedirect("login.jsp");
        } else {
            response.sendRedirect("register.jsp?error=registration_failed");
        }
    }

    private int generateUniqueUserID() {
        Random rand = new Random();
        int user_id;
        do {
            user_id = rand.nextInt(1000000); 
        } while (isUserIDExistsInDatabase(user_id));

        return user_id;
    }

    private boolean isUserIDExistsInDatabase(int user_id) {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/expense_g", "root", "");
            String query = "SELECT user_id FROM users WHERE user_id = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, user_id);
            ResultSet rs = stmt.executeQuery();

            return rs.next();
        } catch (SQLException e) {
            return false;
        }
    }

    private boolean insertUserToDatabase(int user_id, String fullname, String password, int age, int salary,
            String email, String occupation, String username) {
        try {
            // Change from 'expense' to 'expense_g' and update credentials
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/expense_g", "root", "");

            String query = "INSERT INTO users (user_id, Fullname, Password, Age, Salary, Email, Occupation, username) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, user_id);
            stmt.setString(2, fullname);
            stmt.setString(3, password);
            stmt.setInt(4, age);
            stmt.setInt(5, salary);
            stmt.setString(6, email);
            stmt.setString(7, occupation);
            stmt.setString(8, username);

            int rowsInserted = stmt.executeUpdate();

            return rowsInserted > 0;
        } catch (SQLException e) {
            return false;
        }
    }
}
