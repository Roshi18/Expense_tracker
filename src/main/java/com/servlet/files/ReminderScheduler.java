package com.servlet.files;

import java.sql.*;
import java.time.LocalDate;

public class ReminderScheduler {

    public static void main(String[] args) {
        checkAndSendReminders();
    }

    public static void checkAndSendReminders() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/expense_g", "root", "");

            LocalDate today = LocalDate.now();
            LocalDate upcoming = today.plusDays(3); // Remind 3 days before

            String sql = "SELECT * FROM bill_reminders WHERE due_date <= ? AND notified = false";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setDate(1, java.sql.Date.valueOf(upcoming));
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String email = rs.getString("email"); // Replace with actual user email from DB
                String billName = rs.getString("bill_name");
                Date dueDate = rs.getDate("due_date");
                double amount = rs.getDouble("amount");

                // Send Email
                EmailUtil.sendEmail(email,
                    "⚠️ Bill Reminder: " + billName,
                    "Your " + billName + " of ₹" + amount +
                    " is due on " + dueDate + ". Please pay on time.");

                // Mark as notified
                PreparedStatement update = conn.prepareStatement(
                    "UPDATE bill_reminders SET notified = true WHERE id = ?");
                update.setInt(1, rs.getInt("id"));
                update.executeUpdate();
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
