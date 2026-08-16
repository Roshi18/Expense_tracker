<!DOCTYPE html>
<html>
<head>
    <title>Error - Expense Tracker</title>
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            background-image: linear-gradient(100deg, #13547a 10%, #80d0c7 100%);
            text-align: center;
            padding: 50px;
        }
        .error-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.3);
            max-width: 500px;
            margin: 0 auto;
        }
        h1 {
            color: #d32f2f;
            margin-bottom: 20px;
        }
        p {
            color: #666;
            margin-bottom: 20px;
        }
        .back-button {
            background-color: #13547a;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            display: inline-block;
        }
        .back-button:hover {
            background-color: #0f4460;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>⚠️ Error Occurred</h1>
        <p>Sorry, there was an error processing your expense. This could be due to:</p>
        <ul style="text-align: left; color: #666;">
            <li>Database connection issues</li>
            <li>Invalid data format</li>
            <li>Server connectivity problems</li>
        </ul>
        <p>Please try again or contact support if the problem persists.</p>
        <a href="home.jsp" class="back-button">← Back to Home</a>
    </div>
</body>
</html>