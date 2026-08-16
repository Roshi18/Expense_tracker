package com.servlet.files;

import java.math.BigDecimal;

import jakarta.servlet.annotation.WebServlet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class RetrivalServlet
 */
@WebServlet("/RetrivalServlet")
public class RetrivalServlet{
	private static final long serialVersionUID = 1L;     
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/expense_g";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    // Constants for SQL queries
     public static double retrival(String username) {
        BigDecimal totalSpending = BigDecimal.ZERO;
        double floatValue=0.0;
        
        try {
            
            // Establish a database connection
            Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
            String sqlquery1 = "SELECT sum(amount * duration) as total FROM addexpenses WHERE username = ? and purpose='electricity'";
            String sqlquery2 = "SELECT sum(amount * duration) as total FROM addexpenses WHERE username = ? and purpose='cable'";
            String sqlquery3 = "SELECT sum(amount * duration) as total FROM addexpenses WHERE username = ? and purpose='phone'";
            String sqlquery4 = "SELECT sum(amount * duration) as total FROM addexpenses WHERE username = ? and purpose='water'";
            String sqlquery5 = "SELECT sum(amount * duration) as total FROM addexpenses WHERE username = ? and purpose!='electricity' and purpose!='cable' and purpose!='water' and purpose!='phone'";
           
            // Create a prepared statement for the SELECT query
            PreparedStatement preparedStatement = connection.prepareStatement(sqlquery1);
            preparedStatement.setString(1, username);
            ResultSet rs = preparedStatement.executeQuery();
            int electricity = 0;
            if (rs.next()) {
               electricity = rs.getInt("total");
            }
            preparedStatement = connection.prepareStatement(sqlquery2);
            preparedStatement.setString(1, username);
            rs = preparedStatement.executeQuery();
            int cable = 0;
            if (rs.next()) {
               cable = rs.getInt("total");
            }
            preparedStatement = connection.prepareStatement(sqlquery3);
            preparedStatement.setString(1, username);
            rs = preparedStatement.executeQuery();
            int phone = 0;
            if (rs.next()) {
               phone = rs.getInt("total");
            }
            preparedStatement = connection.prepareStatement(sqlquery4);
            preparedStatement.setString(1, username);
            rs = preparedStatement.executeQuery();
            int water = 0;
            if (rs.next()) {
               water = rs.getInt("total");
            }
            preparedStatement = connection.prepareStatement(sqlquery2);
            preparedStatement.setString(1, username);
            rs = preparedStatement.executeQuery();
            int op = 0;
            if (rs.next()) {
               op = rs.getInt("total");
            }
        } catch (SQLException e) {
        }
        return floatValue;
    }

}

