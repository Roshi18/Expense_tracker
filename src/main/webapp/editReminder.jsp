<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Reminder</title>
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/expense_g", "root", "");
    PreparedStatement ps = conn.prepareStatement("SELECT * FROM bill_reminders WHERE id=?");
    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
%>
<form action="UpdateReminderServlet" method="post">
    <input type="hidden" name="id" value="<%= id %>">
    <label>Bill Name:</label><br>
    <input type="text" name="billName" value="<%= rs.getString("bill_name") %>" required><br><br>
    <label>Due Date:</label><br>
    <input type="date" name="dueDate" value="<%= rs.getDate("due_date") %>" required><br><br>
    <label>Amount:</label><br>
    <input type="number" name="amount" value="<%= rs.getDouble("amount") %>" required><br><br>
    <input type="submit" value="Update Reminder">
</form>
<%
    }
    rs.close();
    ps.close();
    conn.close();
%>
</body>
</html>