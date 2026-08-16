<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>
</head>
<body>
    <h1>Edit Profile</h1>
    <form action="UpdateProfileServlet" method="post">
        <input type="hidden" name="username" value="${user.username}">
        Full Name: <input type="text" name="full_name" value="${user.full_name}" required><br>
        Email: <input type="email" name="email" value="${user.email}" required><br>
        <input type="submit" value="Update Profile">
    </form>
</body>
</html>
