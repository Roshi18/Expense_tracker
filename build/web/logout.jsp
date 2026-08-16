<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Expense Tracker</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: lavender;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: lavender;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #333;
            font-size: 24px;
            margin-top: 0;
        }

        p {
            color: #666;
            font-size: 16px;
            margin-bottom: 20px;
        }

        .menu {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: space-between;
        }

        .menu li {
            margin-right: 10px;
        }

        .menu li a {
            color: #333;
            text-decoration: none;
            font-size: 16px;
            padding: 5px 10px;
            border-radius: 5px;
            background-color: lavender;
        }

        .menu li a:hover {
            background-color: lavender;
        }

        /* Add a style for the top-right corner */
        .user-info {
            text-align: right;
            font-size: 16px;
            color: #333;
        }

        .details-container {
            position: absolute;
            left: 348px;
            top: 158px;
            width: 830px;
            height: 100%;
            background-color: lavender;
            border: 1px solid #000;
        }

        /* Style for the frame */
        .expense-frame-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 348px;
            height: 100%;
            background-color: lavender;
            padding: 20px;
            border-right: 1px solid #ccc;
            box-sizing: border-box;
        }

        /* Define styles for the frame content */
        .expense-frame-content {
            display: block;
            margin-bottom: 10px;
        }

        /* Style for radio buttons */
        .radio-group {
            margin-top: 10px;
        }

        .radio-group label {
            margin-right: 10px;
        }

        /* Style text boxes */
        input[type="text"] {
            padding: 10px;
            width: 100%;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        /* Style dropdowns */
        select {
            padding: 10px;
            width: 100%;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            appearance: none;
            -webkit-appearance: none;
            background: url("dropdown-arrow.png") no-repeat right center;
        }

        /* Style dropdown options */
        select option {
            background-color: #fff;
        }

        /* Style for login message */
        .login-message {
            text-align: center;
            font-size: 18px;
            color: #333;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 5px;
            margin-top: 20px;
            backdrop-filter: blur(5px);
        }

        .login-message h2 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .login-message a {
            text-decoration: none;
            background-color: lavender;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .login-message a:hover {
            background-color: lavender;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="user-info">
        <a href="home.jsp">Home</a>
    </div>
    <h1>SDK Expense Tracker</h1>
    <p>Welcome to the SDK Expense Tracker app. Keep track of your expenses easily!</p>
    <ul class="menu">
        <li><a href="login.jsp">Login</a></li>
        <li><a href="register.jsp">Sign Up</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Usage</a></li>
    </ul>
</div>

<!-- Add your expenses frame -->
<div class="expense-frame-container">
    <div class="expense-frame-content">
        <h1>SDK Expense Tracker</h1><hr>
        <h2>Add your expenses</h2>

        <form action="ProcessExpensesServlet" method="post">
            <label for="expense-purpose">Expense Purpose:</label>
            <select id="expense-purpose" name="purpose">
                <option value="electricity">Electricity Bill</option>
                <option value="phone">Phone Bill</option>
                <option value="water">Water Bill</option>
                <option value="cable">Cable Bill</option>
                <option value="other-purpose">Other Purpose</option>
            </select>

            <!-- Text field for custom purpose -->
            <div id="other-purpose" style="display: none;">
                <label for="custom-purpose">Other Purpose:</label>
                <input type="text" id="custom-purpose" name="custom-purpose">
            </div>

            <!-- Amount input -->
            <label for="expense-amount">Amount:</label>
            <input type="text" id="expense-amount" name="amount" required>

            <br>
            <div class="radio-group">
                <label>
                    <input type="radio" name="duration" value="1month"> 1 Month
                </label><br>
                <label>
                    <input type="radio" name="duration" value="3months"> 3 Months
                </label><br>
                <label>
                    <input type="radio" name="duration" value="6months"> 6 Months
                </label><br>
                <label>
                    <input type="radio" name="duration" value="12months"> 12 Months
                </label><br>
            </div>

            <input type="submit" value="Add Expense">
        </form>
    </div>
</div>

<div class="details-container">
    <c:forEach var="UserInfo" items="${UserInfoList}">
        <tr>
            <td>${UserInfo.fullname}</td>
            <td>${UserInfo.email}</td>
            <td>${UserInfo.age}</td>
            <td>${UserInfo.salary}</td>
        </tr>
    </c:forEach>
</div>
</body>
</html>
