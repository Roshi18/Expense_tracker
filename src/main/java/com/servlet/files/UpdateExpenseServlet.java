package com.servlet.files;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/UpdateExpenseServlet")
public class UpdateExpenseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String purpose = request.getParameter("purpose");
        String category = request.getParameter("category");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String expenseDate = request.getParameter("expenseDate");

        HttpSession session = request.getSession();
        int user_id = (Integer) session.getAttribute("user_id");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/expense_g", "root", "");

            String sql = "UPDATE expenses SET purpose=?, category=?, amount=?, expense_date=? WHERE id=? AND user_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, purpose);
            ps.setString(2, category);
            ps.setDouble(3, amount);
            ps.setDate(4, java.sql.Date.valueOf(expenseDate));
            ps.setInt(5, id);
            ps.setInt(6, user_id);

            ps.executeUpdate();
            ps.close();
            conn.close();

            response.sendRedirect("viewExpenses.jsp");

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}
