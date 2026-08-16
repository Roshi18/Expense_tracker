<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Expense Tracker</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@latest/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@latest/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@latest/font/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600;700&family=Open+Sans&display=swap"
        rel="stylesheet">
    <link href="bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="bootstrap-icons.css" type="text/css" rel="stylesheet">
    <link href="templatemo-topic-listing.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css"> 
</head>

<body id="top">

    <main>

<nav class="navbar navbar-expand-lg" style="background-image: linear-gradient(15deg, #13547a 0%, #80d0c7 100%);">
    <div class="container">
        <a class="navbar-brand" href="index.html">
            <i class="bi-back"></i>
            <span style="color: black;">Expense Tracker</span>
        </a>
        <div class="d-lg-none ms-auto me-4">
            <a href="#top" class="navbar-icon bi-person smoothscroll"></a>
        </div>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-lg-5 me-lg-auto"> 
                <li class="nav-item"> 
                    <a class="nav-link click-scroll" href="index.html" style="color: white;">  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link click-scroll" href="register.jsp" style="color: white;">Register</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link click-scroll" href="login.jsp" style="color: white;">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link click-scroll" href="#section_5" style="color: white;">Contact</a>
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

        <section class="hero-section d-flex justify-content-center align-items-center" id="section_1" style="padding-top: 80px; padding-bottom: 80px;">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-15 mx-auto">
                        <h1 class="text-white text-center">Master Your Money with Ease.</h1> <br>
                        <h6 class="text-center">Platform for Tracking your day to day Expense 🌟</h6>
                    </div>
                </div>
            </div>
        </section> 
        
<section class="additional-content-section" style="background-image: linear-gradient(15deg, #13547a 0%, #80d0c7 100%); color: white; padding: 80px 0;">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-12">
                <h2 class="section-title" style="color: black;">Empowering Your Financial Journey</h2>
                <p class="section-subtitle" style="color: black;">At Expense Tracker, we are committed to helping you achieve financial success and freedom. Here's what sets us apart:</p>
            </div>
            <div class="col-lg-6 col-12">
                <div class="row">
                    <div class="col-md-6 col-12 mb-4 mb-md-0">
                        <div class="feature-item">
                            <i class="bi bi-shield-check"></i>
                            <h3 class="feature-title">Reliable Security</h3>
                            <p class="feature-description" style="color: black;">Your financial data is our top priority. We implement robust security measures to ensure your information is safe and secure.</p>
                        </div>
                    </div>

                    <div class="col-md-6 col-12 mb-4 mb-md-0">
                        <div class="feature-item">
                            <i class="bi bi-award"></i>
                            <h3 class="feature-title">Award-Winning App</h3>
                            <p class="feature-description" style="color: black;">Expense Tracker has been recognized for its excellence in financial management. Join a community of satisfied users.</p>
                        </div>
                    </div>

                    <div class="col-md-6 col-12 mb-4 mb-md-0">
                        <div class="feature-item">
                            <i class="bi bi-chat-dots"></i>
                            <h3 class="feature-title">User Support</h3>
                            <p class="feature-description" style="color: black;"> Our dedicated support team is always ready to assist you. Have questions or concerns? We're here to help!</p>
                        </div>
                    </div>

                    <div class="col-md-6 col-12 mb-4 mb-md-0">
                        <div class="feature-item">
                            <i class="bi bi-people"></i>
                            <h3 class="feature-title">Thriving Community</h3>
                            <p class="feature-description" style="color: black;">Join a vibrant community of users who share tips, insights, and success stories on their financial journeys.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
        
<section class="featured-section" style="background-color: #80d0c7; padding-top: 120px;">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-10 col-12 text-center">
                <br>
                <h2 class="section-title" style="color: black;">Why Choose Expense Tracker?</h2>
                <br>
                <p class="section-subtitle" style="color: black;">Discover the features that make Expense Tracker the perfect companion for your financial journey.</p>
                <br>
                <br> <br>
            </div>
        </div>
        <br>
        <br>
        <br>
        <div class="row justify-content-center">
            <div class="col-lg-3 col-12 mb-4 mb-lg-0">
                <div class="feature-item">
                    <i class="bi bi-bar-chart"></i>
                    <h3 class="feature-title"> Smart Expense Tracking</h3> <br>
                    <p class="feature-description">Effortlessly monitor and manage your expenses. Gain insights into your spending patterns and take control of your finances.</p>
                </div>
            </div>

            <div class="col-lg-3 col-12 mb-4 mb-lg-0">
                <div class="feature-item">
                    <i class="bi bi-briefcase"></i>
                    <h3 class="feature-title">Savings Goals</h3> <br>
                    <p class="feature-description">Set financial goals and let Expense Tracker guide you towards achieving them. Plan for your dreams and financial security.</p>
                </div>
            </div>

            <div class="col-lg-3 col-12">
                <div class="feature-item">
                    <i class="bi bi-lock"></i>
                    <h3 class="feature-title">Security & Privacy</h3> <br>
                    <p class="feature-description">Your financial data is securely stored and encrypted. We prioritize your privacy and peace of mind.</p>
                </div>
            </div>
        </div>
        <BR> <BR> <BR> <BR> <BR> <BR>
        <div class="row justify-content-center">
            <div class="col-lg-8 col-12 text-center">
                <a href="home.jsp" class="cta-button">Get Started</a>
            </div>
        </div>
    </div>
</section>

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
    </main>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    <script src="js/click-scroll.js"></script>
    <script src="js/custom.js"></script>

</body>

</html>
