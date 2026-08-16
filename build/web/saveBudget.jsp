<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Budget Plan Saved</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fafafa;
        }
        .card {
            background-color: #f1f8e9;
            padding: 20px;
            border-radius: 12px;
            margin: 40px auto;
            width: 60%;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        a {
            text-decoration: none;
            color: #2e7d32;
            font-weight: bold;
        }
        .goal-section {
            background-color:#fff8e1;
            padding:20px;
            margin-top:25px;
            border-radius:12px;
            border-left:6px solid #ffa726;
            box-shadow:0 2px 8px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

<div class="card">
    <h3>✅ Budget Plan Saved</h3>

    <%
        // --- Step 1: Retrieve parameters from form ---
        String income = request.getParameter("income");
        String essentials = request.getParameter("essentials");
        String entertainment = request.getParameter("entertainment");
        String goal = request.getParameter("goal");
        String target = request.getParameter("target");

        // --- Step 2: Prepare DB connection ---
        Connection con = null;
        PreparedStatement ps = null;
        String message = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/expense_g", "root", "");

            // Get user_id from session (make sure it's set during login)
            Integer userIdObj = (Integer) session.getAttribute("user_id");
            if (userIdObj == null) {
                throw new Exception("User not logged in. Please log in to save your budget.");
            }
            int userId = userIdObj;

            String monthYear = new java.text.SimpleDateFormat("MMM-yyyy").format(new java.util.Date());

            // --- Step 3: Insert Essentials Budget ---
            ps = con.prepareStatement("INSERT INTO budgets (user_id, category, limit_amount, month_year) VALUES (?, ?, ?, ?)");
            ps.setInt(1, userId);
            ps.setString(2, "Essentials");
            ps.setBigDecimal(3, new java.math.BigDecimal(essentials));
            ps.setString(4, monthYear);
            ps.executeUpdate();

            // --- Step 4: Insert Entertainment Budget (if entered) ---
            if (entertainment != null && !entertainment.isEmpty()) {
                ps.setInt(1, userId);
                ps.setString(2, "Entertainment");
                ps.setBigDecimal(3, new java.math.BigDecimal(entertainment));
                ps.setString(4, monthYear);
                ps.executeUpdate();
            }

            // --- Step 5: Insert Saving Goal ---
            if (goal != null && !goal.isEmpty() && target != null && !target.isEmpty()) {
                ps.setInt(1, userId);
                ps.setString(2, goal); // treat goal name as category
                ps.setBigDecimal(3, new java.math.BigDecimal(target));
                ps.setString(4, monthYear);
                ps.executeUpdate();
            }

            message = "Budget data saved successfully!";
        } catch (Exception e) {
            message = "❌ Error: " + e.getMessage();
        } finally {
            try { if (ps != null) ps.close(); if (con != null) con.close(); } catch (Exception ex) {}
        }
    %>

    <!-- Budget Summary -->
    <p>💵 <b>Monthly Income:</b> ₹<%= income %></p>
    <p>🧾 <b>Essentials Budget:</b> ₹<%= essentials %></p>
    <p>🎉 <b>Entertainment Budget:</b> ₹<%= entertainment %></p>
    <p>🎯 <b>Saving Goal:</b> <%= goal %> — Target: ₹<%= target %></p>

    <p style="color:green; font-weight:bold;"><%= message %></p>

    <!-- Goal Analysis Section -->
    <%
        if (goal != null && !goal.isEmpty() && target != null && !target.isEmpty()) {
            try {
                double incomeVal = Double.parseDouble(income);
                double essentialVal = Double.parseDouble(essentials);
                double entertainmentVal = (entertainment != null && !entertainment.isEmpty()) ? Double.parseDouble(entertainment) : 0;
                double targetVal = Double.parseDouble(target);

                double monthlySaving = incomeVal - (essentialVal + entertainmentVal);

                if (monthlySaving > 0) {
                    int monthsNeeded = (int)Math.ceil(targetVal / monthlySaving);
                    double yearlySaving = monthlySaving * 12;
                    double progress = Math.min((monthlySaving / targetVal) * 100, 100);

                    double recommendedCut = 0;
                    String advice = "";

                    if (monthsNeeded > 12) {
                        recommendedCut = entertainmentVal * 0.2; // suggest cutting 20%
                        double newMonthlySaving = monthlySaving + recommendedCut;
                        int fasterMonths = (int)Math.ceil(targetVal / newMonthlySaving);
                        int improvement = monthsNeeded - fasterMonths;
                        advice = "If you reduce your entertainment by ₹" + (int)recommendedCut +
                                 ", you can reach your goal " + improvement + " months sooner 🎯";
                    } else if (monthsNeeded <= 6) {
                        advice = "Awesome! You’re on track to achieve your goal quickly. Keep it up 💪";
                    } else {
                        advice = "You’re doing well — a small tweak in your budget can speed things up 🚀";
                    }
    %>

    <div class="goal-section">
        <h3>📊 Savings & Goal Analysis</h3>
        <p>💰 <b>Monthly Savings:</b> ₹<%= monthlySaving %></p>
        <p>🗓️ <b>Estimated Time to Reach Goal:</b> <%= monthsNeeded %> months</p>
        <p>📆 <b>Yearly Savings Potential:</b> ₹<%= yearlySaving %></p>

        <div style="background-color:#e0e0e0; border-radius:8px; width:100%; height:15px; margin-top:10px;">
            <div style="background-color:#66bb6a; width:<%= progress %>%; height:100%; border-radius:8px; transition:width 0.5s;"></div>
        </div>

        <div style="background-color:#f1f8e9; padding:12px; border-radius:10px; margin-top:15px;">
            <h4>💡 Next Step</h4>
            <p style="color:#2e7d32;"><%= advice %></p>
        </div>
    </div>

    <%
                } else {
    %>
    <div class="goal-section" style="border-left:6px solid #d32f2f;">
        <h3>⚠️ Spending Alert</h3>
        <p>Your expenses are greater than or equal to your income.</p>
        <p>Try reducing your <b>Essentials</b> or <b>Entertainment</b> costs to start saving for <b><%= goal %></b>.</p>
    </div>
    <%
                }
            } catch (Exception e) {
    %>
    <p style="color:red;">Error in goal calculation: <%= e.getMessage() %></p>
    <%
            }
        }
    %>

    <br><a href="budgetSummary.jsp">📊 View All Saved Budgets</a>
</div>

</body>
</html>