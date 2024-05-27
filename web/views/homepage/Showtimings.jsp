<%-- 
    Document   : Cinema
    Created on : May 19, 2024, 7:01:32 PM
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
        <title>Play Show</title>
        <link href="../../css/bootstrap.min.css" rel="stylesheet" >
        <link href="../../css/font-awesome.min.css" rel="stylesheet" >
        <link href="../../css/global.css" rel="stylesheet">
        <link href="../../css/blog.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Overpass&display=swap" rel="stylesheet">
        <script src="js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="main clearfix position-relative">
            <div class="main_1 clearfix position-absolute top-0 w-100">
                <jsp:include page="/views/homepage/Header.jsp"></jsp:include>
                </div>
                <div class="main_blog_dt clearfix">
                    <section id="center" class="center_blog">
                        <div class="container-xl">
                            <div class="row center_o1">
                                <div class="col-md-12">
                                    <h2 class="text-white">Cinema</h2>
                                    <h6 class="mb-0 mt-3 fw-normal col_red"><a class="text-light" href="home">Home</a> <span class="mx-2 text-muted">/</span> Cinema</h6>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>

            </div>

                <section id="contact_h" class="p_3 bg-light">
                    <div class="container-xl">
                    <c:forEach items = "${listM}" var = "m">  
                        <div class="row contact_h_1">                      
                            <div class="col-md-3">
                                <div class="contact_h_1l">
                                    <div class="grid clearfix">
                                        <figure class="effect-jazz mb-0">
                                            <a href="#"><img height="300px" src="${m.getPost_img()}" class="w-100" alt="abc"></a>
                                        </figure>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-9">
                                <div class="contact_h_1r bg-white">
                                    <h3>${m.getMovie_name()}</h3>
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
                    </c:forEach>
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