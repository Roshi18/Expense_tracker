package com.servlet.files;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/SaveReminderServlet")
public class SaveReminderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String billName = request.getParameter("billName");
        String dueDate = request.getParameter("dueDate");
        String amount = request.getParameter("amount");

        // ✅ Optional: email can come from session or form
        HttpSession session = request.getSession();
        Integer user_id = (Integer) session.getAttribute("user_id");
        String email = (String) session.getAttribute("email");

        // fallback for testing/demo
        if (user_id == null) user_id = 1;
        if (email == null) email = "testuser@example.com";

        try {
            // 1️⃣ Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 2️⃣ Connect to DB
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/expense_g", "root", "");

            // 3️⃣ Insert new reminder
            String sql = "INSERT INTO bill_reminders (user_id, email, bill_name, due_date, amount) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.setString(2, email);
            ps.setString(3, billName);
            ps.setString(4, dueDate);
            ps.setString(5, amount);

            int result = ps.executeUpdate();

            // 4️⃣ Success output
            if (result > 0) {
                out.println("<html><body style='font-family:Arial; text-align:center; margin-top:50px;'>");
                out.println("<h2 style='color:green;'>✅ Reminder Saved Successfully!</h2>");
                out.println("<p><b>Bill:</b> " + billName + "</p>");
                out.println("<p><b>Due Date:</b> " + dueDate + "</p>");
                out.println("<p><b>Amount:</b> ₹" + amount + "</p>");
                out.println("<br><a href='billReminder.jsp'>Add Another Reminder</a>");
                out.println("<br><a href='viewReminders.jsp'>View All Reminders</a>");
                out.println("</body></html>");
            } else {
                out.println("<p style='color:red;'>Error saving reminder. Please try again.</p>");
            }

            ps.close();
            conn.close();

        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
            e.printStackTrace(out);
        }
    }
}