<%-- 
    Document   : MovieDetail
    Created on : May 21, 2024, 9:33:45 AM
    Author     : thanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .detail{
                margin-top: 100px;
                margin-bottom: 30px;
            }
            .navbarDetail{
                background-color: #000;
            }
            .nameDetail{
                font-size: 50px;
                font-weight: bold;
                margin-left: 20px;
            }
            ul{
                font-family: sans-serif;
            }
            span{
                font-weight: bold;
                font-size: 17px;
            }
            .bookTicket {
                color: rgb(240,240,240);
                background-color: red;
                border-style: solid;
                padding: 6px;
                font-size: 20px;
                border-radius: 5px;               
            }
        </style>
    </head>
    <body>
        <div class="main clearfix position-relative">
            <div class="main_1 clearfix position-absolute top-0 w-100 navbarDetail">
                <jsp:include page="/views/homepage/Header.jsp"></jsp:include>
            </div>
            <section id="exep" class="p_3 bg-light">
                    <div class="container-xl detail">
                        <div class="row exep1">
                            <div class="col-5">
                                <div class="exep1l">
                                    <div class="grid clearfix">
                                        
                                            <img height="450px" src="${m.getPost_img()}" class="w-100" alt="abc">
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="col-7">
                                <div class="exep1r">
                                    <p class="mb-0 nameDetail">${m.getMovie_name()}</p>                                       
                                </div>
                                <hr/>
                                <div>
                                    <ul>
                                        <li>
                                            <span>Duration:</span>&nbsp&nbsp ${m.getDuration()} minutes
                                        </li>
                                        <li>
                                            <span>Date published:</span>&nbsp&nbsp ${m.getDate_published()}
                                        </li>
                                        <li>
                                            <span>Category:</span>&nbsp&nbsp ${m.getType_name()}
                                        </li>
                                        <li>
                                            <span>Description:</span>&nbsp&nbsp ${m.getDecription()}
                                        </li>
                                        <hr/>
                                        <li>
                                            <a class="bookTicket" href="movietrailer?trailer=${m.trailer}&ID=${m.getMovie_id()}"><i class="fa fa-youtube-play me-1"></i>Watch Trailer</a>
                                            <a class="bookTicket" href="#">Book Tickets</a>
                                        </li>
                                    </ul>
                                </div>
                                
                            </div>
                        </div>
                    </div>
            </section>
        </div>
        
        <jsp:include page="/views/homepage/Footer.jsp"></jsp:include>
    </body>
</html>
