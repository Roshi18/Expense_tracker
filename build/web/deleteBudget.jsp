<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/expense_g", "root", "");
    PreparedStatement ps = con.prepareStatement("DELETE FROM budgets WHERE budget_id=?");
    ps.setString(1, id);
    ps.executeUpdate();
    ps.close();
    con.close();

    response.sendRedirect("budgetSummary.jsp");
%>
