<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Budget Summary</title>
    <style>
        body { font-family: Arial; background-color:#f9fff6; }
        table { border-collapse: collapse; width: 90%; margin: 20px auto; background:#fff; }
        th, td { padding: 10px; border: 1px solid #ccc; text-align:center; }
        th { background-color:#c8e6c9; }
        a.button { background:#4CAF50; color:white; padding:5px 10px; border-radius:5px; text-decoration:none; }
        a.delete { background:#e53935; color:white; }
        progress { width: 100px; }
    </style>
</head>
<body>
    <h2 style="text-align:center;">? Your Budget Plans</h2>
    <div style="text-align:center; margin-bottom:15px;">
        <a href="budgetPlanner.jsp" class="button">? Add New Budget</a>
    </div>

    <%
        Integer userIdObj = (Integer) session.getAttribute("user_id");
        if (userIdObj == null) {
            out.println("<p style='color:red; text-align:center;'>Please log in first.</p>");
            return;
        }
        int userId = userIdObj;

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/expense_g", "root", "");

            ps = con.prepareStatement("SELECT budget_id, category, limit_amount, month_year, created_on FROM budgets WHERE user_id=? ORDER BY created_on DESC");
            ps.setInt(1, userId);
            rs = ps.executeQuery();

            if (!rs.isBeforeFirst()) {
                out.println("<p style='text-align:center;'>No budgets found. Add one now!</p>");
            } else {
    %>
    <table>
        <tr>
            <th>Category</th>
            <th>Limit (?)</th>
            <th>Month</th>
            <th>Created On</th>
            <th>Progress</th>
            <th>Action</th>
        </tr>
    <%
                while (rs.next()) {
                    int id = rs.getInt("budget_id");
                    String category = rs.getString("category");
                    double limit = rs.getDouble("limit_amount");

                    // Assume some dummy 'spent' value just for visualization
                    double spent = Math.random() * limit; 
                    int percent = (int)((spent / limit) * 100);
    %>
        <tr>
            <td><%= category %></td>
            <td><%= limit %></td>
            <td><%= rs.getString("month_year") %></td>
            <td><%= rs.getTimestamp("created_on") %></td>
            <td>
                <progress value="<%= spent %>" max="<%= limit %>"></progress>
                <%= percent %>%
            </td>
            <td>
                <a href="editBudget.jsp?id=<%= id %>" class="button">Edit</a>
                <a href="deleteBudget.jsp?id=<%= id %>" class="button delete">Delete</a>
            </td>
        </tr>
    <%
                }
    %>
    </table>
    <%
            }
        } catch (Exception e) {
            out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
    %>
</body>
</html>