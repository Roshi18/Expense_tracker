package com.servlet.files;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

@WebServlet("/UpdateReminderServlet")
public class UpdateReminderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String billName = request.getParameter("billName");
        String dueDate = request.getParameter("dueDate");
        String amount = request.getParameter("amount");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/expense_g", "root", "");

            PreparedStatement ps = conn.prepareStatement(
                "UPDATE bill_reminders SET bill_name=?, due_date=?, amount=? WHERE id=?");
            ps.setString(1, billName);
            ps.setString(2, dueDate);
            ps.setString(3, amount);
            ps.setInt(4, id);

            int result = ps.executeUpdate();

            if (result > 0) {
                response.sendRedirect("viewReminders.jsp");
            } else {
                response.getWriter().println("Error updating reminder.");
            }

            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace(response.getWriter());
        }
    }
}