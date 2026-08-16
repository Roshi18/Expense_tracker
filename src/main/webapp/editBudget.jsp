<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<body>
<%
    String id = request.getParameter("id");
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    double limitAmount = 0;
    String category = "";

    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/expense_g", "root", "");

    ps = con.prepareStatement("SELECT category, limit_amount FROM budgets WHERE budget_id=?");
    ps.setString(1, id);
    rs = ps.executeQuery();
    if (rs.next()) {
        category = rs.getString("category");
        limitAmount = rs.getDouble("limit_amount");
    }
%>
<form action="updateBudget.jsp" method="post" style="background-color:#e8f5e9;padding:15px;border-radius:10px;width:300px;margin:auto;margin-top:30px;">
    <h3>?? Edit Budget</h3>
    <input type="hidden" name="id" value="<%= id %>">
    <label>Category:</label><br>
    <input type="text" name="category" value="<%= category %>" readonly><br><br>
    <label>Limit Amount:</label><br>
    <input type="number" name="limit_amount" value="<%= limitAmount %>" required><br><br>
    <button type="submit" style="background-color:#4CAF50;color:white;padding:8px;border:none;border-radius:5px;">Update</button>
</form>
</body>
</html>