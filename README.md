# 💰 Expense Tracker

A web-based **Expense Tracker** application developed using Java, JSP, Servlets, and MySQL. It helps users keep track of their expenses, manage budgets, set bill reminders, view spending through graphs, and manage their personal information.

## ✨ Features

### 👤 User Management

* User registration
* User login
* User profile
* Edit profile details
* Logout

### 💸 Expense Management

* Add expenses
* View expenses
* Edit expenses
* Delete expenses
* Categorize expenses
* Record expense amount, purpose, and date

### 📊 Expense Graph

* View expenses graphically
* Analyze spending based on expense categories

### 💰 Budget Planner

* Create a budget
* View budget summary
* Edit budget
* Delete budget

### 🔔 Bill Reminder

* Add bill reminders
* View reminders
* Edit reminders
* Update reminders
* Delete reminders

### 💡 Category Advice

* Provides advice based on spending categories
* Identifies the category with higher spending
* Displays suggestions related to the user's spending

### 💵 Salary

* Add or update salary information

### 📚 Financial Information

The application contains information related to:

* Savings
* Fixed Deposits
* Recurring Deposits
* Mutual Funds
* Property
* Stocks

## 🛠️ Technologies Used

| Technology     | Usage                     |
| -------------- | ------------------------- |
| **Java**       | Application logic         |
| **JSP**        | Web pages                 |
| **Servlets**   | Request processing        |
| **MySQL**      | Database                  |
| **JDBC**       | Database connectivity     |
| **HTML**       | Page structure            |
| **CSS**        | Styling                   |
| **JavaScript** | Client-side functionality |
| **Bootstrap**  | UI components             |

## 🏗️ Application Flow

```text
                    ┌──────────────┐
                    │    Login /   │
                    │  Registration│
                    └──────┬───────┘
                           │
                           ▼
                    ┌──────────────┐
                    │  Home Page   │
                    └──────┬───────┘
                           │
          ┌────────────────┼────────────────┐
          │                │                │
          ▼                ▼                ▼
     💸 Expenses      💰 Budget       🔔 Reminders
          │                │                │
          ▼                ▼                ▼
     View / Add /     Budget         Add / Edit /
     Edit / Delete    Summary        Delete
          │
          ▼
     📊 Expense Graph
          │
          ▼
     💡 Category Advice

          ┌────────────────┐
          │ Salary /       │
          │ Profile        │
          └────────────────┘
```

## 📂 Project Structure

```text
Expense_tracker/
│
├── src/
│   └── main/
│       ├── java/
│       │   └── com/servlet/files/
│       │       ├── CategoryAdviceServlet.java
│       │       ├── DatabaseConnection.java
│       │       ├── DeleteExpenseServlet.java
│       │       ├── ExpenseCalculator.java
│       │       ├── ExpenseGraphServlet.java
│       │       ├── LoginServlet.java
│       │       ├── ProcessExpensesServlet.java
│       │       ├── RegiterServlet.java
│       │       ├── ReminderScheduler.java
│       │       ├── SaveReminderServlet.java
│       │       ├── UpdateExpenseServlet.java
│       │       ├── UpdateReminderServlet.java
│       │       ├── UpdateSalaryServlet.java
│       │       ├── UserInfoServlet.java
│       │       └── ...
│       │
│       └── webapp/
│           ├── login.jsp
│           ├── register.jsp
│           ├── home.jsp
│           ├── editExpense.jsp
│           ├── budgetPlanner.jsp
│           ├── budgetSummary.jsp
│           ├── billReminder.jsp
│           ├── categoryAdvice.jsp
│           ├── editBudget.jsp
│           ├── editProfile.jsp
│           ├── editReminder.jsp
│           └── ...
│
├── build/
├── dist/
├── nbproject/
└── build.xml
```

## ⚙️ How It Works

The application follows a simple flow:

**Register/Login → Home → Manage Expenses → Manage Budget & Reminders → View Expense Graph → Get Category Advice**

Users can manage their expenses and budgets while also keeping track of bills, salary, and profile information.

## 🚀 Running the Project

### Requirements

* Java
* Apache NetBeans
* Apache Tomcat
* MySQL

### Steps

1. Clone the repository:

```bash
git clone https://github.com/Roshi18/Expense_tracker.git
```

2. Open the project in **Apache NetBeans**.

3. Configure the MySQL database connection in the project.

4. Configure **Apache Tomcat** as the server.

5. Build and run the project.

## 👩‍💻 Author

**Roshika S**

[GitHub](https://github.com/Roshi18)
