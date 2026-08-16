<%-- 
    Document   : saveReminder
    Created on : 18 Oct 2025, 1:39:13 am
    Author     : roshi
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Reminder Saved</title>
    <style>
        .confirmation-box {
            background-color: #fffde7;
            padding: 20px;
            border-radius: 10px;
            margin: 30px auto;
            width: 400px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            font-family: Arial, sans-serif;
        }
        h2 {
            color: #ff8f00;
        }
        p {
            font-size: 16px;
        }
    </style>
</head>
<body>

<div class="confirmation-box">
    <h2>✅ Reminder Added</h2>

    <%
        // Get the data from the form submission
        String billName = request.getParameter("billName");
        String dueDate = request.getParameter("dueDate");
        String amount = request.getParameter("amount");
    %>

    <p>💡 <strong><%= billName %></strong> is due on 
       <strong><%= dueDate %></strong> for 
       <strong>₹<%= amount %></strong>.</p>

    <p style="color:green;">We’ll remind you before the due date!</p>

    <a href="billReminder.jsp" 
       style="text-decoration:none; color:white; background-color:#ffb300; padding:10px 15px; border-radius:5px;">
       ➕ Add Another Reminder
    </a>
</div>

</body>
</html>