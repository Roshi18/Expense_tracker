/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.servlet.files;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;

@WebServlet("/CategoryAdvice")
public class CategoryAdviceServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        int user_id = (int) session.getAttribute("user_id");

        String url = "jdbc:mysql://localhost:3306/expense_g"; // change DB name
        String dbUser = "root";
        String dbPass = ""; // change this

        String highestCategory = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, dbUser, dbPass);

            String sql = "SELECT category, SUM(amount) AS total " +
                         "FROM expenses WHERE user_id = ? " +
                         "GROUP BY category ORDER BY total DESC LIMIT 1";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, user_id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                highestCategory = rs.getString("category");
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        String tip;
        if (highestCategory == null) {
            tip = "Start adding expenses to get personalized savings advice!";
        } else {
            switch (highestCategory.toLowerCase()) {
                case "food":
                    tip = "Try cooking at home more often to cut food costs.";
                    break;
                case "phone":
                    tip = "Check if your mobile plan has unnecessary add-ons.";
                    break;
                case "water":
                    tip = "Fix leaks and reuse water when possible.";
                    break;
                case "electricity":
                    tip = "Turn off unused appliances and switch to LED bulbs.";
                    break;
                case "cable":
                    tip = "Consider switching to cheaper streaming services.";
                    break;
                default:
                    tip = "Track your spending regularly to identify saving opportunities.";
                    break;
            }
        }

        request.setAttribute("tip", tip);
        RequestDispatcher rd = request.getRequestDispatcher("categoryAdvice.jsp");
        rd.forward(request, response);
    }
}