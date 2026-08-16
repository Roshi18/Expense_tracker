<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Entries</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        
        <link rel="preconnect" href="https://fonts.gstatic.com">

		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@latest/font/bootstrap-icons.min.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@latest/font/bootstrap.min.css">
		
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600;700&family=Open+Sans&display=swap" rel="stylesheet">
                        
        <link href="bootstrap.min.css" type="text/css" rel="stylesheet">

        <link href="bootstrap-icons.css" type="text/css" rel="stylesheet">

        <link href="templatemo-topic-listing.css" type="text/css" rel="stylesheet"> 
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            font-family: 'Montserrat', sans-serif;
            background-image: linear-gradient(100deg, #13547a 10%, #80d0c7 100%);
        }
        table {
            border-collapse: collapse;
            width: 50%;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: rgba(172, 247, 210, 0.53);
        }
    </style>
</head>
<body>
<div id="sticky-wrapper" class="sticky-wrapper" style= "height:75px">

            <nav class="navbar navbar-expand-lg">
                <div class="container">
                    <a class="navbar-brand" href="index.html">
                        <i class="bi-back"></i>
                        <span>Expense Tracker</span>
                    </a>

                    <div class="d-lg-none ms-auto me-4">
                        <a href="#top" class="navbar-icon bi-person smoothscroll"></a>
                    </div>
    
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
    
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav ms-lg-5 me-lg-auto">
                            <li class="nav-item">
                                <a class="nav-link click-scroll" href="index.html"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Home</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link click-scroll" href="About.jsp">about</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link click-scroll" href="home.jsp">Usage</a>
                            </li>

                        </ul>
                    </div>
                </div>
            </nav>
                    </div>
    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        ResultSet rs1 = null;

        try {
            // Establish a database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/expense", "root", "Sneha@.03");

            // Query to get total entries and user information
            String query = "SELECT username, salary FROM users GROUP BY username, salary";
            String query1 = "SELECT count(*) as count11 FROM users";

            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);

            int entry = 0;
    %>

    
    <table>
        <tr>
            <th>Username</th>
            <th>Salary</th>
        </tr>

        <%
            while (rs.next()) {
                String username = rs.getString("username");
                int salary = rs.getInt("salary");
        %>

        <tr>
            <td><%= username %></td>
            <td><%= salary %></td>
        </tr>
       
        <%
            }
        rs1 = stmt.executeQuery(query1);
        if (rs1.next()){
        entry= rs1.getInt("count11");   
        } 
        out.println("<h3>"+"Total Number of Entries:"+ entry+"</h3> <br>" ); 
        %>
        

       <% } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (rs1 != null) rs1.close();
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        %>
    </table>
</body>
</html>