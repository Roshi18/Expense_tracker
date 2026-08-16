<!DOCTYPE html>
<html>
<head>
  <title>Registration</title>
          <link rel="preconnect" href="https://fonts.googleapis.com">
        
        <link rel="preconnect" href="https://fonts.gstatic.com">

		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@latest/font/bootstrap-icons.min.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@latest/font/bootstrap.min.css">
		
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600;700&family=Open+Sans&display=swap" rel="stylesheet">
                        
        <link href="bootstrap.min.css" type="text/css" rel="stylesheet">

        <link href="bootstrap-icons.css" type="text/css" rel="stylesheet">

        <link href="templatemo-topic-listing.css" type="text/css" rel="stylesheet">     
  <style>
    body {
      font-family: 'Montserrat', sans-serif;
      background-image: linear-gradient(100deg, #13547a 10%, #80d0c7 100%);
    }

    h1 {
      font-family: Cambria;
      text-align: center;
      color: white;
    }

    form {
      max-width: 400px;
      margin: 0 auto;
      padding: 20px;
      background-color: white;
      border-radius: 5px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
      animation: form-fade-in 1s ease-in-out;
    }

    @keyframes form-fade-in {
      0% {
        opacity: 0;
      }
      100% {
        opacity: 1;
      }
    }

    label {
      display: block;
      margin-bottom: 10px;
      font-weight: bold;
    }

    input[type="text"],
    input[type="password"],
    input[type="number"],
    input[type="email"] {
      width: 90%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 3px;
    }

    input[type="submit"] {
      background-color: #333;
      color: #fff;
      padding: 10px 20px;
      border: none;
      border-radius: 3px;
      cursor: pointer;
    }

    input[type="submit"]:hover {
      background-color: #555;
    }
  </style>
</head>
<body>
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
                                <a class="nav-link click-scroll" href="index.html#section_1"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Home</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link click-scroll" href="About.jsp">about</a>
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

                        </ul>

                        <div class="d-none d-lg-block">
                            <a href="#top" class="navbar-icon bi-person smoothscroll"></a>
                        </div>
                    </div>
                </div>
            </nav>
                    </div>
  <h1 style:color="white"><br> <br> Register </h1>
<form action="RegisterServlet" method="post">
    <label for="fullname">Full Name: <span style="color: red;">*</span></label>
    <input type="text" id="fullname" name="fullname" required><br>
    <label for="username">User Name: <span style="color: red;">*</span></label>
    <input type="text" id="username" name="username" required><br>
    <label for="password">Password: <span style="color: red;">*</span></label>
    <input type="password" id="password" name="password" required><br>
    <label for="age">Age: <span style="color: red;">*</span></label>
    <input type="number" id="age" name="age" required><br>
    <label for="salary">Salary (Per Annum): <span style="color: red;">*</span></label>
    <input type="number" id="salary" name="salary" required><br>
    <label for="email">Email: <span style="color: red;">*</span></label>
    <input type="email" id="email" name="email" required><br>
    <label for="occupation">Occupation: <span style="color: red;">*</span></label>
    <input type="text" id="occupation" name="occupation" required><br>
    <input type="submit" value="Register">
</form><br><br>

  
                  <section class="contact-section section-padding section-bg" id="section_5">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-12 col-12 text-center">
                            <h2 class="mb-5">Get in touch</h2>
                        </div>
                                              
                        <div class="col-lg-3 col-md-6 col-12 mx-auto">
                            <h4 class="mb-3">Office</h4>

                            <p>Vellore Institute of Technology</p>

                            <hr>

                            <p class="d-flex align-items-center mb-1">
                                <span class="me-2">Phone</span>

                                <a href="tel: 110-220-3400" class="site-footer-link">
                                    9345604115
                                </a>
                            </p>

                            <p class="d-flex align-items-center">
                                <span class="me-2">Email</span>

                                <a href="mailto:roshika.s2022@vitstudent.ac.in" class="site-footer-link">
                                    roshika.s2022@vitstudent.ac.in
                                </a>
                            </p>
                        </div>

                        <div class="col-lg-3 col-md-6 col-12 mb-3 mb-lg- mb-md-0 ms-auto">
                            <h4 class="mb-3">Virtual Office</h4>

                    

                            <hr>

                            <p class="d-flex align-items-center mb-1">
                                <span class="me-2">Phone</span>

                                <a href="tel: +918754891109" class="site-footer-link">
                                    8754891109 ,
                                </a>
                                <a href="tel: +919047547774" class="site-footer-link">
                                    9047547774
                                </a>
                            </p>

                            <p class="d-flex align-items-center">
                                <span class="me-2">Email</span>

                                <a href="mailto:roshika.s2022@vitstudent.ac.in" class="site-footer-link">
                                    roshika.s2022@vitstudent.ac.in
                                </a>
                            </p>
                        </div>

                    </div>
                </div>
            </section>
</body>
</html>