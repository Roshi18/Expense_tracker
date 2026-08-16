<%-- 
    Document   : budgetPlanner
    Created on : 18 Oct 2025, 1:37:08 am
    Author     : roshi
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
    <div class="budget-box" style="background-color:#e8f5e9; padding:15px; border-radius:10px; margin-top:20px;">
        <h4>💰 Budget Planning & Goal Setting</h4>
        <form action="saveBudget.jsp" method="post">
            <label>Monthly Income:</label><br>
            <input type="number" name="income" placeholder="Enter your monthly income" required><br><br>

            <label>Set Budget for Essentials:</label><br>
            <input type="number" name="essentials" placeholder="E.g. rent, food, utilities" required><br><br>

            <label>Set Budget for Entertainment:</label><br>
            <input type="number" name="entertainment" placeholder="Movies, dining, etc."><br><br>

            <label>Saving Goal:</label><br>
            <input type="text" name="goal" placeholder="E.g. New phone, vacation"><br><br>

            <label>Target Amount:</label><br>
            <input type="number" name="target" placeholder="Amount to save for goal"><br><br>

            <button type="submit" style="background-color:#4CAF50; color:white; border:none; padding:10px; border-radius:5px;">Save Plan</button>
        </form>
        <!-- View Budgets Button -->
        <form action="budgetSummary.jsp" method="get">
            <button type="submit" class="btn-secondary">📊 View Saved Budgets</button>
        </form>
    </div>
</body>
</html>
