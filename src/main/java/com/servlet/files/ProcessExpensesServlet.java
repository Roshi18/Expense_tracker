package com.servlet.files;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet("/ProcessExpensesServlet")
public class ProcessExpensesServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form inputs
        String purpose = request.getParameter("purpose");
        BigDecimal amount = new BigDecimal(request.getParameter("amount"));
        String expenseDateStr = request.getParameter("expense-date"); // expected in dd-MM-yyyy

        // Parse date (dd-MM-yyyy -> java.sql.Date)
        Date expenseDate;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = sdf.parse(expenseDateStr);
            expenseDate = new Date(parsedDate.getTime());
        } catch (ParseException e) {
            response.getWriter().println("Invalid date format. Please use yyyy-MM-dd.");
            return;
        }

        // Get logged-in user ID from session
        Integer user_id = (Integer) request.getSession().getAttribute("user_id");
        if (user_id == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Optional: Use purpose as category if no separate category input
        String category = purpose;

        // Insert into database
        String jdbcURL = "jdbc:mysql://localhost:3306/expense_g";
        String dbUser = "root";
        String dbPassword = "";

        try (Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
            conn.setAutoCommit(true); 
            // id is AUTO_INCREMENT, remove it from INSERT
            String sql = "INSERT INTO expenses(user_id, purpose, category, amount, expense_date) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, user_id);
                ps.setString(2, purpose);
                ps.setString(3, category);
                ps.setBigDecimal(4, amount);
                ps.setDate(5, expenseDate);
                ps.executeUpdate();
            }

            response.sendRedirect("home.jsp?msg=Expense Added Successfully");

        } catch (SQLException e) {
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }
}