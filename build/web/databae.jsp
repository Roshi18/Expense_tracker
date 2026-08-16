<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.servlet.files.DatabaseConnection" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Database Connection Test</title>
</head>
<body>
    <%
        Connection connection = null;
        try {
            connection = DatabaseConnection.getConnection();
            // Display a confirmatory message once the connection is established
            out.println("<p style='color: green;'>Database connection successfully established!</p>");
            // Now you can use the 'connection' object to perform database operations
            // For example, execute SQL queries and display results here
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p style='color: red;'>Error establishing the database connection.</p>");
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
    <h1>Database Connection Test</h1>
    <!-- Display your HTML content here -->

</body>
</html>
