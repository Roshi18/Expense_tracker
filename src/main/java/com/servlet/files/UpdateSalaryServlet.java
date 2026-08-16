package com.servlet.files;

import java.io.IOException;
import java.io.PrintWriter;
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


@WebServlet("/UpdateSalaryServlet")
public class UpdateSalaryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String jdbcUrl = "jdbc:mysql://localhost:3306/expense_g";
        String dbUser = "root";
        String dbPassword = "";

        // JDBC variables for opening, closing, and managing connection
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // Establish a connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Retrieve existing salary from the database
            String selectQuery = "SELECT Salary FROM users WHERE username = ?";
            String username = (String) request.getSession().getAttribute("username");
            preparedStatement = connection.prepareStatement(selectQuery);
            preparedStatement.setString(1, username);
            resultSet = preparedStatement.executeQuery();

            int existingSalary = 0;

            if (resultSet.next()) {
                existingSalary = resultSet.getInt("Salary");
            }

            // Get the new salary value from the JSP form
            int newSalary = Integer.parseInt(request.getParameter("newSalary"));

            // Update the salary in the database
            String updateQuery = "UPDATE users SET Salary = ? WHERE username = ?";
            preparedStatement = connection.prepareStatement(updateQuery);
            preparedStatement.setInt(1, existingSalary + newSalary);
            preparedStatement.setString(2, username);
            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                out.println("<p>Salary updated successfully!</p>");
                HttpSession session = request.getSession();
                session.setAttribute("salary",existingSalary + newSalary);
                response.sendRedirect("success.jsp");


            } else {
                out.println("<p>Error updating salary.</p>");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            // Close JDBC objects
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
