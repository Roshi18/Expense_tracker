<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Login</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@latest/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@latest/dist/css/bootstrap.min.css">

    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600;700&family=Open+Sans&display=swap" rel="stylesheet">

    <link href="templatemo-topic-listing.css" type="text/css" rel="stylesheet">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: linear-gradient(100deg, #13547a 10%, #80d0c7 100%);
        }

        h1 {
            font-family: Cambria;
            text-align: center;
            color: white;
            font-size: 40px;
        }

        form {
            max-width: 300px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.5s;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"] {
            width: 90%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        input[type="submit"] {
            width: 90%;
            background-color: #007bff;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        p.error-message {
            color: red;
            text-align: center;
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
            }

            100% {
                opacity: 1;
            }
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="index.html">Expense Tracker</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="index.html#section_1">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="About.jsp">About</a></li>
                    <li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>
                    <li class="nav-item"><a class="nav-link" href="#section_5">Contact</a></li>
                    <li class="nav-item"><a class="nav-link" href="home.jsp">Usage</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <h1>Login</h1>

    <form action="LoginServlet" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>
        <input type="submit" value="Login">
    </form>

    <% 
        String error = request.getParameter("error");
        if ("db".equals(error)) {
    %>
        <p class="error-message">Database error occurred. Please try again later.</p>
    <% 
        } else if (error != null) {
    %>
        <p class="error-message">Invalid username or password.</p>
    <% } %>

    <!-- Contact Section -->
    <section class="contact-section section-padding section-bg" id="section_5">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="mb-5">Get in touch</h2>
                </div>

                <div class="col-lg-3 col-md-6 mx-auto">
                    <h4 class="mb-3">Office</h4>
                    <p>Vellore Institute of Technology</p>
                    <hr>
                    <p class="d-flex align-items-center mb-1"><span class="me-2">Phone</span><a href="tel:9345604115" class="site-footer-link">9345604115</a></p>
                    <p class="d-flex align-items-center"><span class="me-2">Email</span><a href="mailto:roshika.s2022@vitstudent.ac.in" class="site-footer-link">roshika.s2022@vitstudent.ac.in</a></p>
                </div>

                <div class="col-lg-3 col-md-6 mb-3 mx-auto">
                    <h4 class="mb-3">Virtual Office</h4>
                    <hr>
                    <p class="d-flex align-items-center mb-1"><span class="me-2">Phone</span>
                        <a href="tel:+918754891109" class="site-footer-link">8754891109 ,</a><br>
                        <a href="tel:+919047547774" class="site-footer-link">9047547774</a>
                    </p>
                    <p class="d-flex align-items-center"><span class="me-2">Email</span>
                        <a href="mailto:roshika.s2022@vitstudent.ac.in" class="site-footer-link">uppuveda.aishwarya2022@vitstudent.ac.in</a>
                    </p>
                </div>
            </div>
        </div>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@latest/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
