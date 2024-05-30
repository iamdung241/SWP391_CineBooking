<%-- 
    Document   : About
    Created on : May 19, 2024, 6:29:07 PM
    Author     : thanh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>About</title>
        <link href="../../css/bootstrap.min.css" rel="stylesheet" >
        <link href="../../css/font-awesome.min.css" rel="stylesheet" >
        <link href="../../css/global.css" rel="stylesheet">
        <link href="../../css/about.css" rel="stylesheet">
        <link href="../../css/index.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Overpass&display=swap" rel="stylesheet">
        <script src="js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="main clearfix position-relative">
            <div class="main_1 clearfix position-absolute top-0 w-100">
                <jsp:include page="/views/homepage/Header.jsp"></jsp:include>
                </div>
                <div class="main_about clearfix">
                    <section id="center" class="center_blog">
                        <div class="container-xl">
                            <div class="row center_o1">
                                <div class="col-md-12">
                                    <h2 class="text-white">About Us</h2>
                                    <h6 class="mb-0 mt-3 fw-normal col_red"><a class="text-light" href="/CineBooking/home">Home</a> <span class="mx-2 text-muted">/</span> About Us</h6>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>

            </div>

            <section id="feature" class="p_3">
                <div class="container-xl">
                    <div class="feature_1 row">
                        <div class="col-md-6">
                            <div class="feature_1l clearfix">                              
                                <h2>Information about PlayShow cinema</h2>
                                <p>PlayShow Cinema is a small-scale, high-quality movie theater, established in 2024. With the goal of bringing the best movie-watching moments and experiences to customers, PlayShow combines booking Online tickets via website with basic operations, suitable for all ages.</p>
                                <p>The cinema is fully and thoroughly equipped with sound and image systems, professional and friendly staff, providing a comfortable, clean space and a realistic experience for users.</p>
                                <div class="feature_1li1 row">
                                    <div class="col-md-6">
                                        <div class="feature_1li1l clearfix">
                                            <h4>Cinema Rom</h4>
                                            <p>Coming to the PlayShow theater, customers will enjoy the latest international blockbusters from Hollywood. With 5 projection rooms and a Digital system that meets international standards, along with modern facilities.</p>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="feature_1li1l clearfix">
                                            <h4>Payment</h4>
                                            <p>To save customers time, we created a website to buy movie tickets online. Customers can choose seats, screening times, and pay immediately via QR code.</p>
                                        </div>
                                    </div>
                                </div>
                                <p class="mb-0">Our PlayShow team is committed to giving customers the best experience when coming to PlayShow cinema.</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="feature_1r clearfix">
                                <div class="grid clearfix">
                                    <figure class="effect-jazz mb-0">
                                        <img width="200px" height="600px" src="/CineBooking/img/about1.JPG" class="w-100" alt="posterAbout">
                                    </figure>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section id="contact_h" class="p_3 bg-light">
                <div class="container-xl">
                    <div class="row contact_h_1">                      
                        <div class="col-md-5">
                            <div class="contact_h_1l">
                                <div class="grid clearfix">
                                    <figure class="effect-jazz mb-0">
                                        <img height="500px" src="/CineBooking/img/about2.jpg" class="w-100" alt="abc">
                                    </figure>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-7">
                            <div class="contact_h_1r bg-white">
                                <h3>PlayShow Rules</h3>
                                <ul>
                                    <li>- No filming or taking photos.</li>
                                    <li>- Turn off the phone ringer.</li>
                                    <li>- No smoking.</li>
                                    <li>- Do not cause disorder.</li>
                                    <li>- Do not bring pets into the theater.</li>
                                    <li>- Carefully preserve personal property.</li>
                                    <li>- Only food and drinks purchased at PlayShow Cinema are allowed into the theater.</li>
                                    <li>- Do not use wine, beer, alcoholic beverages (of any alcohol content), or other stimulants within the PlayShow Cinema premises.</li>
                                    <li>- PlayShow Cinema contains security cameras</li>
                                    <li>- If you book tickets online, you must complete all steps and pay before entering the theater.</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        <jsp:include page="/views/homepage/Footer.jsp"></jsp:include>
        <script>
            window.onscroll = function () {
                myFunction()
            };

            var navbar_sticky = document.getElementById("navbar_sticky");
            var sticky = navbar_sticky.offsetTop;
            var navbar_height = document.querySelector('.navbar').offsetHeight;

            function myFunction() {
                if (window.pageYOffset >= sticky + navbar_height) {
                    navbar_sticky.classList.add("sticky")
                    document.body.style.paddingTop = navbar_height + 'px';
                } else {
                    navbar_sticky.classList.remove("sticky");
                    document.body.style.paddingTop = '0'
                }
            }
        </script>

    </body>

</html>
