package com.servlet.files;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/ExpenseGraphServlet")
public class ExpenseGraphServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        int user_id = Integer.parseInt(request.getParameter("user_id"));
        String action = request.getParameter("action"); // "category" or "monthly"
        response.setContentType("application/json");

        JSONArray labels = new JSONArray();
        JSONArray data = new JSONArray();

        // Define all possible categories (match your dropdown)
        String[] allCategories = {"phone", "cable", "water", "electricity", "other-purpose"};

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/expense_g", "root", "");

            if ("category".equals(action)) {
                // Initialize totals map
                Map<String, Double> totalsMap = new HashMap<>();
                for (String cat : allCategories) totalsMap.put(cat, 0.0);

                String sql = "SELECT category, SUM(amount) as total FROM expenses WHERE user_id=? GROUP BY category";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, user_id);
                ResultSet rs = ps.executeQuery();

                while(rs.next()){
                    String cat = rs.getString("category");
                    double total = rs.getDouble("total");
                    if (totalsMap.containsKey(cat)) totalsMap.put(cat, total);
                    else totalsMap.put(cat, total); // for unexpected categories
                }
                rs.close();
                ps.close();

                // Prepare JSON arrays
                for (String cat : allCategories) {
                    labels.put(cat);
                    data.put(totalsMap.get(cat));
                }

            } else if ("monthly".equals(action)) {
                String sql = "SELECT DATE_FORMAT(expense_date, '%Y-%m') as month, SUM(amount) as total " +
                             "FROM expenses WHERE user_id=? GROUP BY month ORDER BY month ASC";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, user_id);
                ResultSet rs = ps.executeQuery();

                while(rs.next()){
                    labels.put(rs.getString("month"));
                    data.put(rs.getDouble("total"));
                }
                rs.close();
                ps.close();
            }

            conn.close();

        } catch(Exception e){
            e.printStackTrace();
        }

        JSONObject json = new JSONObject();
        json.put("labels", labels);
        json.put("data", data);

        PrintWriter out = response.getWriter();
        out.print(json.toString());
        out.flush();
    }
}