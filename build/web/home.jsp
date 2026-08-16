<!DOCTYPE html>
<%@ page import="com.servlet.files.ExpenseCalculator" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="org.json.JSONArray" %>

<html>
<head>
    <title>Expense Tracker</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600;700&family=Open+Sans&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="templatemo-topic-listing.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
  <style>
    :root {
        --primary-color: #13547a;
        --secondary-color: #80d0c7;
        --accent-color: #74EBD5;
        --text-color: #333;
        --white: #ffffff;
        --shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    body {
        font-family: 'Montserrat', Arial, sans-serif;
        margin: 0;
        padding: 0;
        min-height: 100vh;
        overflow-y: auto;
        color: var(--text-color);
        background: linear-gradient(180deg, #2d91b5 0%, #6bc1d6 100%) !important; /* match all divs */
        overflow-y: auto;
    }

    .container-fluid {
        max-width: 1400px;
        margin: 0 auto;
        padding: 20px;
    }

    .navbar {
        background: rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(10px);
        box-shadow: var(--shadow);
    }

    .card {
        background: rgba(255, 255, 255, 0.9);
        border-radius: 15px;
        box-shadow: var(--shadow);
        transition: transform 0.3s ease;
        margin-bottom: 20px;
    }

    .card:hover {
        transform: translateY(-5px);
    }

    .chart-container {
        background: var(--white);
        border-radius: 15px;
        padding: 20px;
        margin-bottom: 20px;
        box-shadow: var(--shadow);
        height: 400px;
    }

    .expense-summary {
        background: rgba(255, 255, 255, 0.9);
        border-radius: 15px;
        padding: 20px;
        margin-bottom: 20px;
    }

    .btn-primary {
        background: var(--primary-color);
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        transition: all 0.3s ease;
    }

    .btn-primary:hover {
        background: var(--secondary-color);
        transform: translateY(-2px);
    }

    @media (max-width: 768px) {
        .container-fluid {
            padding: 10px;
        }
        
        .chart-container {
            height: 300px;
        }
    }
    

    h1 {
      color: #333;
      font-size: 24px;
      margin-top: 0;
    }

    th {
      text-align: center;
      color: rgba(0, 0, 0);
    }
    td {
      text-align: justify;
      color: rgba(0, 0, 0);
    }
    table {
            width: 350px;
            border-collapse: collapse;
            margin-top: 20px;
            border-spacing: 0; /* Set border-spacing to 0 to reduce space between columns */
        }

        th, td {
            padding: 5px;
            text-align: left;
        }

        td input, td select {
            margin-top: 3px;
        }
      td input[type="text"],
      td input[type="file"] {
        width: 100%;
        box-sizing: border-box;
      }
    
    h2 {
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
       background-image: linear-gradient(15deg, #13547a 0%, #80d0c7 100%);
    }

    .menu li {
      margin-right: 10px;
       background-image: linear-gradient(15deg, #13547a 0%, #80d0c7 100%);
    }

    .menu li a {
      color: #333;
      text-decoration: none;
      font-size: 16px;
      padding: 5px 10px;
      border-radius: 5px;
       background-image: linear-gradient(0deg, #13547a 0%, #80d0c7 100%);
    }

    .menu li a:hover {
       background-image: linear-gradient(0deg, #13547a 0%, #80d0c7 100%);
    }

    /* Responsive navigation styles */
    @media (max-width: 768px) {
        .navbar-nav {
            text-align: center;
        }
        
        .nav-item {
            padding: 10px 0;
        }
        
        .navbar-toggler {
            margin-right: 15px;
        }
        
        .details-container {
            position: relative;
            left: 0;
            width: 100%;
        }
        
        .expense-frame-container,
        .details-frame-container {
            position: relative;
            width: 100%;
            height: auto;
        }
    }

    /* Improved form styling */
    input[type="submit"] {
        background: var(--accent-gradient);
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        transition: opacity 0.3s;
    }

    input[type="submit"]:hover {
        opacity: 0.9;
    }

    /* Add a style for the top-right corner */
    .user-info {
      text-align: right;
      font-size: 16px;
      color: #333;
      top: 255px;
    }
    .details-container {
            position: absolute; /* Use absolute positioning */
            left: 348px; /* Set the starting horizontal position */
            top: 78px; /* Set the starting vertical position */
            width: 1020px; /* Set the container width */
            height: 1200px; /* Set the container height */
            background: linear-gradient(180deg, #2d91b5 0%, #6bc1d6 100%);
        }

    /* Style for the frame */
.expense-frame-container {
  position: absolute; /* CHANGED: from fixed ? absolute */
  top: 78px;
  left: 0;
  width: 348px;
  min-height: 100%; /* CHANGED: ensures full height */
  background: linear-gradient(180deg, #14759a 0%, #1b6783 100%); /* ? unified color */
  padding: 20px;
  box-sizing: border-box;
}
        /* Style for the frame */
.details-frame-container {
  position: absolute; /* CHANGED: from fixed ? absolute */
  float:right;
  top: 78px;
  right: 0;
  width: 520px;
  min-height: 100%;
  background: linear-gradient(180deg, #14759a 0%, #1b6783 100%); /* ? unified color */
  padding: 20px;
  box-sizing: border-box;
}
   .details-frame-container img {
        width: 100%; /* Set the desired width, in this case, 100% of the container */
        max-width: 400px; /* Optionally, set a maximum width to prevent images from becoming too large */
        height: auto; /* Maintain the aspect ratio of the images */
        display: block; /* Remove any extra spacing below the images */
        margin: 0 auto; /* Center the images horizontally within the container */
    }

    .expense-frame-content {
       display: block; /* Display each radio button on a new line */
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
        select {
            padding: 10px;
            width: 100%;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            appearance: none;
            -webkit-appearance: none;
            //background: url("dropdown-arrow.png") no-repeat right center;         }

        /* Style dropdown options */
        select option {
            background-color: #fff;
        }
        /* Style for login message */
        .login-message {
            text-align: center;
            font-size: 18px;
            color: #333;
            background-image: linear-gradient(0deg, #74EBD5 0%, #9FACE6 100%);
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
  background-image: linear-gradient(0deg, #74EBD5 0%, #9FACE6 100%);
  color: #fff;
  padding: 10px 20px;
  border-radius: 5px;
  font-weight: bold;
  transition: background-color 0.3s;
}

.login-message a:hover {
  background-image: linear-gradient(0deg, #74EBD5 0%, #9FACE6 100%);
}      
    #myLineChart .axis-label,
    #myLineChart .axis-title {
        color: black !important;  
    }
    
    /* Alert styles */
    .alert {
        padding: 15px;
        margin-bottom: 20px;
        border: 1px solid transparent;
        border-radius: 4px;
    }

    .alert-danger {
        color: #721c24;
        background-color: #f8d7da;
        border-color: #f5c6cb;
    }

    .alert-success {
        color: #155724;
        background-color: #d4edda;
        border-color: #c3e6cb;
    }
    #myPieChart {
      width: 750px !important;
      height: 750px !important;
    }

</style> 
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  </head>
<body>
      <div id="main-container">
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
                                <a class="nav-link click-scroll" href="index.html">Home</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link click-scroll" href="About.jsp">About</a>
                            </li>
    
                            <li class="nav-item">
                                <a class="nav-link click-scroll" href="register.jsp">Register</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link click-scroll" href="login.jsp">Login</a>
                            </li>
    
                            <li class="nav-item">
                                <a class="nav-link click-scroll" href="#section_5">Contact</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link click-scroll" href="home.jsp">Usage</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link click-scroll" href="viewExpenses.jsp" style="font-size: 15px;">View Expenses</a>
                            </li>
                        </ul>
                        <div class="d-none d-lg-block">
                            <a href="viewProfile.jsp" class="navbar-icon bi-person smoothscroll"></a>
                        </div>
                    </div>
                </div>
            </nav>
                    </div>
         
              <%
                  Integer user_id = (Integer) session.getAttribute("user_id"); // make sure it's Integer
                  if (user_id == null) {// optional: redirect to login if user not logged in
                  response.sendRedirect("login.jsp");
                  return; // stop further execution
                }
              %>                         

<div class="expense-frame-container">
    <div class="expense-frame-content">
        <h2>Add your expenses</h2>

        <form action="ProcessExpensesServlet" method="post" id="expenseForm" onsubmit="return validateExpenseForm()">
          <input type="hidden" name="user_id" value="<%= user_id %>">
          <label for="expense-purpose">Expense Purpose:</label>
            <select id="expense-purpose" name="purpose" required>
                <option value="">Select Purpose</option>
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

			<label for="expense-date">Expense Date:</label>
   			<input type="date" id="expense-date" name="expense-date" required>
         
            <input type="submit" value="Add Expense">
        </form><br>
        <h2>Add Additional Income </h2>
        <form action="UpdateSalaryServlet" method="post" onsubmit="return validateSalaryForm()">
    			<label for="newSalary">Additional Income</label>
    			<input type="number" id="newSalary" name="newSalary" required min="0" step="0.01" placeholder="Enter amount">
    			<br>
    			<input type="submit" value="Update Salary" class="btn btn-primary">
		</form>
    </div>
</div> 
<script>
    var purposeDropdown = document.getElementById("expense-purpose");
    var customPurposeField = document.getElementById("other-purpose");
    var customPurposeInput = document.getElementById("custom-purpose");

    purposeDropdown.addEventListener("change", function () {
        if (this.value === "other-purpose") {
            customPurposeField.style.display = "block";
        } else {
            customPurposeField.style.display = "none";
        }
    });
</script>
   
    <div class="details-container">
    <!-- Error message container -->
    <div id="errorContainer" class="alert alert-danger" style="display: none;"></div>
    <!-- Success message container -->
    <div id="successContainer" class="alert alert-success" style="display: none;"></div>
    <div class="user-info">
      <% 
      String username = (String) session.getAttribute("username"); 
      String email = null;
      String fullname = null;
      int age = 0;
      int salary = 0;
      int val = 0;
      double totalSpending = 0.0;

      if (username != null && !username.isEmpty()) { // changed check
          fullname = (String) session.getAttribute("fullname");
          email = (String) session.getAttribute("email");
          age = (int) session.getAttribute("age");
          salary = (int) session.getAttribute("salary");
          user_id = (Integer) session.getAttribute("user_id");
      %>
          <br>
          Logged in as : <%= fullname %>  <!-- optional: you can show fullname here -->
      <%
      } else {
      %>
          Login
      <%
      }
      %>
    </div>
    
    <%
if (username != null && !username.isEmpty()) {
      %>

        <table>
            <tr>
                <th>User Details</th>
            </tr>
            <tr>
                <td>Full Name:</td>
                <td><%=fullname%></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><%=email%></td>
            </tr>
            <tr>
                <td>Age:</td>
                <td><%=age%></td>
            </tr>
            <tr>
                <td>Salary:</td>
                <td><%=salary%></td>
            </tr>
        </table> <br>
<%			

            ExpenseCalculator calc = new ExpenseCalculator();
            totalSpending = calc.getTotalSpent(user_id);


            // Display total spending
            out.println("<p><font color=black>Total spending for " + username + ": \u20B9" + totalSpending + "</p>");
            BigDecimal salaryBigDecimal = new BigDecimal(String.valueOf(salary));
            BigDecimal totalSpendingBigDecimal = new BigDecimal(String.valueOf(totalSpending));

            BigDecimal remaining2 = salaryBigDecimal.subtract(totalSpendingBigDecimal);
            float remaining = remaining2.floatValue();

            out.println("<p ><font color=Purple>Remaining: " + remaining+"</p>");
            if(remaining>= salary *0.8){
				val=8;
                out.println("<p><font color=green> You've 80% of your income on. Now time to enjoy the benefits ! <br> Refer the options to your right to utilize your savings efficiently. </p>");}
			else if(remaining >= salary * 0.50 && remaining <= salary * 0.79){
				val=7;
	        	out.println("<p> <font color=blue> You've more than 50% of your income still ! Now make it more beneficial by utilizing the options to your right. </p>");
	        	}
			else if(remaining >= salary * 0.35 && remaining <= salary * 0.49) {
				val=5;
	        	out.println("<p> <font color=yellow> You still have more than 30% of your income ! Now make it more beneficial by utilizing the options to your right. </p>");
			}
			else {
				val = 3;
	        	out.println("<p> <font color=red> Your funds are getting drained ! Start your savings plan now. No ideas? Refer to your right side of the screen. </p>");
			}
%>

<%
        } else{
      %> 
       <a href='login.jsp'> Login</a>

 <%} %>
 <br><br>
 <p>User ID in session: <%= session.getAttribute("user_id") %></p>

<h1><b>Expense Chart :</b></h1>
<h2 align="center">Total Expense: <%= totalSpending %></h2>
<canvas id="myPieChart" width="350" height="350"></canvas>
<canvas id="myLineChart" width="600" height="400"></canvas>

<script>
document.addEventListener("DOMContentLoaded", function() {
    const user_id = <%= user_id %>; 

    // Define colors for categories
    const categoryColors = {
        "phone": "#FF6384",
        "cable": "#36A2EB",
        "water": "#FFCE56",
        "electricity": "#4BC0C0",
        "other-purpose": "#9966FF"
    };

    // Initialize Pie Chart with placeholder data
    const ctxPie = document.getElementById("myPieChart").getContext("2d");
    const pieChart = new Chart(ctxPie, {
        type: "pie",
        data: {
            labels: ["Loading..."],
            datasets: [{
                data: [1],
                backgroundColor: ["#ccc"]
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: { position: "bottom" },
                title: { display: true, text: "Expense by Category" }
            }
        }
    });

    // Initialize Line Chart with placeholder data
    const ctxLine = document.getElementById("myLineChart").getContext("2d");
    const lineChart = new Chart(ctxLine, {
        type: "line",
        data: {
            labels: ["Loading..."],
            datasets: [{
                label: "Monthly Expenses",
                data: [0],
                borderColor: "#FF6384",
                backgroundColor: "#FF6384",
                fill: false,
                tension: 0.4
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: { position: "bottom",labels: { color: "black" } },
                title: { display: true, text: "Expenses in Last 6 Months" ,color: "black" }
            },
            scales: { x: {
            ticks: { color: "black" }, // X-axis label color
            grid: { color: "#ddd" }    // optional: lighter grid lines
        },
        y: {
            beginAtZero: true,
            ticks: { color: "black" }, // Y-axis label color
            grid: { color: "#ddd" }    // optional: lighter grid lines
        } }
        }
    });

    // Fetch Pie Chart data
    fetch('<%= request.getContextPath() %>/ExpenseGraphServlet?action=category&user_id=' + user_id)
        .then(res => {
            if (!res.ok) throw new Error("Failed to fetch category data");
            return res.json();
        })
        .then(data => {
            if (data.labels.length === 0) {
                pieChart.data.labels = ["No Data"];
                pieChart.data.datasets[0].data = [1];
                pieChart.data.datasets[0].backgroundColor = ["#ccc"];
            } else {
                pieChart.data.labels = data.labels;
                pieChart.data.datasets[0].data = data.data;
                pieChart.data.datasets[0].backgroundColor = data.labels.map(
                    c => categoryColors[c] || "rgba(200,200,200,0.6)"
                );
            }
            pieChart.update();
        })
        .catch(err => console.error("Error fetching category data:", err));

    // Fetch Line Chart data
    fetch('<%= request.getContextPath() %>/ExpenseGraphServlet?action=monthly&user_id=' + user_id)
        .then(res => {
            if (!res.ok) throw new Error("Failed to fetch monthly data");
            return res.json();
        })
        .then(data => {
            if (data.labels.length === 0) {
                lineChart.data.labels = ["No Data"];
                lineChart.data.datasets[0].data = [0];
            } else {
                lineChart.data.labels = data.labels;
                lineChart.data.datasets[0].data = data.data;
            }
            lineChart.update();
        })
        .catch(err => console.error("Error fetching monthly data:", err));
});
</script>

    </div>
<div class="details-frame-container">
<h2> Recommendations</h2>
<%
String tip = "";
if (val == 8) {
    tip = "Great job! You?re saving more than 80% of your income ? consider investing in long-term assets like stocks or property.";
} else if (val == 7) {
    tip = "Nice work! With over 50% of your income left, think about fixed deposits or SIP investments.";
} else if (val == 5) {
    tip = "You?re doing okay ? try cutting small expenses and start a recurring deposit for steady savings.";
} else if (val == 3) {
    tip = "Careful! Your spending is high. Track expenses closely and start saving 10% right away.";
} else {
    tip = "Keep tracking your expenses regularly for better insights.";
}
request.setAttribute("tip", tip);
%>

<jsp:include page="categoryAdvice.jsp" />
<% if (val!=0){
	if(val==8){
        out.println("<ul> <li> <p> Stocks </p> </li> </ul>");

        // Adding images with redirection
        out.println("<a href=\"https://www.moneycontrol.com/stocksmarketsindia/\"><img src=\"stock.jpg\" alt=\"Stocks\"></a>");

        out.println("<ul> <li> <p> Mutual Funds </p> </li> </ul>");
        out.println("<a href=\"https://www.bajajfinserv.in/investments/mutual-funds-listing?utm_source=bing&utm_medium=cpc&utm_campaign=Bajaj_MF_Search_Generic_23Nov_M&msclkid=2757ff55e3f51fc394639a3c52d76c44\"><img src=\"Mutual funds.png\" alt=\"Mutual Funds\"></a>");

        out.println("<ul> <li> <p> Acquisition of Property </p> </li> </ul>");
        out.println("<a href=\"https://www.magicbricks.com/\"><img src=\"Property.png\" alt=\"Acquisition of Property\"></a>");

        out.println("<ul> <li> <p> Vacation </p> </li> </ul>");
        out.println("<a href=\"https://services.india.gov.in/service/detail/check-your-nearest-vaccination-center-and-slots-availability-1\"><img src=\"Vacation.jpg\" alt=\"Vacation\"></a>");

        }
	else if(val==7) {
		out.println("<ul> <li> <p> Acquisition of Property </p> </li> </ul>");
        out.println("<a href=\"https://www.magicbricks.com/\"><img src=\"Medium size property.jpg\" alt=\"Acquisition of Property\"></a>");

        out.println("<ul> <li> <p> Fixed Deposit </p> </li> </ul>");
        out.println("<a href=\"https://www.bajajfinserv.in/investments/fixed-deposit-application-form?utm_source=bingsearch_mktg&utm_medium=cpc&utm_campaign=WPB_FD_18072023_Bing_Pan_India_Generic&utm_term=bank%20fixed%20deposit_e_c_&utm_location=149915&utm_content=703457d64ee01174e95632bfff02c9cc&msclkid=703457d64ee01174e95632bfff02c9cc\"><img src=\"Fixed deposit.jpg\" alt=\"Fixed Deposit\"></a>");

        out.println("<ul> <li> <p> Vacation </p> </li> </ul>");
        out.println("<a href=\"https://services.india.gov.in/service/detail/check-your-nearest-vaccination-center-and-slots-availability-1\"><img src=\"Vacation-2.jpg\" alt=\"Vacation\"></a>");
    	
	}
	else if(val==5) {
		 out.println("<ul> <li> <p> Dining </p> </li> </ul>");
	        out.println("<a href=\"https://www.dineout.co.in/fine-dining-restaurants-near-me\"><img src=\"Dining.jpg\" alt=\"Dining\"></a>");
	        out.println("<ul> <li> <p> Recurring Deposit </p> </li> </ul>");
	        out.println("<a href=\"#\"><img src=\"Recurring Deposit.jpg\" alt=\"Recurring Deposit\"></a>");

	}
	else if(val==3) {
		out.println("<ul> <li> <p> Saving Time! </p> </li> </ul>");
        out.println("<a href=\"https://groww.in/recurring-deposit/rd-interest-rates\"><img src=\"Savings.jpg\" alt=\"Saving Money\"></a>");

	}	
} %>
<!-- Add after your advice or recommendations section -->
<jsp:include page="budgetPlanner.jsp" />
<jsp:include page="billReminder.jsp" />

</div>
</div>

<script>
function validateExpenseForm() {
    var purpose = document.getElementById('expense-purpose').value;
    var amount = document.getElementById('expense-amount').value;
    var customPurpose = document.getElementById('custom-purpose');

    if (purpose === '') {
        alert('Please select an expense purpose');
        return false;
    }

    if (purpose === 'other-purpose' && (!customPurpose.value || customPurpose.value.trim() === '')) {
        alert('Please enter a custom purpose');
        return false;
    }

    if (!amount || isNaN(amount) || parseFloat(amount) <= 0) {
        alert('Please enter a valid amount');
        return false;
    }

    

    return true;
}

function validateSalaryForm() {
    var newSalary = document.getElementById('newSalary').value;
    if (!newSalary || isNaN(newSalary) || parseFloat(newSalary) <= 0) {
        showError('Please enter a valid salary amount');
        return false;
    }
    return true;
}

function showError(message) {
    const errorContainer = document.getElementById('errorContainer');
    errorContainer.textContent = message;
    errorContainer.style.display = 'block';
    // Hide after 5 seconds
    setTimeout(() => {
        errorContainer.style.display = 'none';
    }, 5000);
}

function showSuccess(message) {
    const successContainer = document.getElementById('successContainer');
    successContainer.textContent = message;
    successContainer.style.display = 'block';
    // Hide after 5 seconds
    setTimeout(() => {
        successContainer.style.display = 'none';
    }, 5000);
}

// Add event listeners to forms
document.addEventListener('DOMContentLoaded', function() {
    const expenseForm = document.getElementById('expenseForm');
    if (expenseForm) {
        expenseForm.addEventListener('submit', function(e) {
            if (!validateExpenseForm()) {
                e.preventDefault();
            } else {
                showSuccess('Expense added successfully!');
            }
        });
    }
});
</script>
</body>
</html>