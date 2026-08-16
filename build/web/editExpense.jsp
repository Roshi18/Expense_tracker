<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    int expenseId = Integer.parseInt(request.getParameter("id"));
    //HttpSession session = request.getSession();
    Integer user_id = (Integer) session.getAttribute("user_id");
    if(user_id == null) response.sendRedirect("login.jsp");

    String purpose = "", category = "";
    double amount = 0;
    Date expenseDate = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/expense_g", "root", "");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM expenses WHERE id=? AND user_id=?");
        ps.setInt(1, expenseId);
        ps.setInt(2, user_id);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            purpose = rs.getString("purpose");
            category = rs.getString("category");
            amount = rs.getDouble("amount");
            expenseDate = rs.getDate("expense_date");
        } else {
            response.sendRedirect("viewExpenses.jsp");
        }
        rs.close();
        ps.close();
        conn.close();
    } catch(Exception e){
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Expense</title>
</head>
<body>
<h2>Edit Expense</h2>

<form action="UpdateExpenseServlet" method="post">
    <input type="hidden" name="id" value="<%= expenseId %>">

    <label>Purpose:</label>
    <input type="text" name="purpose" value="<%= purpose %>" required><br><br>

    <label>Category:</label>
    <input type="text" name="category" value="<%= category %>" required><br><br>

    <label>Amount:</label>
    <input type="number" step="0.01" name="amount" value="<%= amount %>" required><br><br>

    <label>Date:</label>
    <input type="date" name="expenseDate" value="<%= expenseDate %>" required><br><br>

    <input type="submit" value="Update Expense">
</form>

</body>
</html>
