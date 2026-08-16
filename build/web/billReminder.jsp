<%-- 
    Document   : billReminder
    Created on : 18 Oct 2025, 1:38:45 am
    Author     : roshi
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Bill Reminder</title>
    <style>
        .reminder-box {
            background-color: #fff8e1;
            padding: 20px;
            border-radius: 10px;
            margin: 30px auto;
            width: 400px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            font-family: Arial, sans-serif;
        }
        input, button {
            width: 100%;
            padding: 8px;
            margin: 8px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        button {
            background-color: #ffb300;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #ffa000;
        }
    </style>
</head>
<body>

<div class="reminder-box">
    <h2> Bill Reminders & Notifications</h2>
<form action="SaveReminderServlet" method="post">
    <label for="billName">Bill Name:</label>
    <input type="text" id="billName" name="billName" required>

    <label for="dueDate">Due Date:</label>
    <input type="date" id="dueDate" name="dueDate" required>

    <label for="amount">Amount:</label>
    <input type="number" id="amount" name="amount" required>

    <input type="submit" value="Add Reminder">
</form>
<form action="viewReminders.jsp" method="get">
    <button type="submit" class="btn-secondary">📊 View Saved Reminders</button>
</form>
</div>

</body>
</html>

