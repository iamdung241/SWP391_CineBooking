<%-- 
    Document   : Footer
    Created on : May 20, 2024, 9:10:42 AM
    Author     : thanh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Footer</title>
        <style>
            .bg-footer {
                background-color: #000;
            }
        </style>
    </head>
    <body>
        <section id="footer" class="p_3 bg-footer">
            <div class="container-xl">
                <div class="row footer_2 mt-4 pt-4">
                    <div class="col-md-2">
                        <div class="footer_2i">
                            <h5 class="text-uppercase col_red mb-3">PlayShow</h5>
                            <ul class="mb-0 row">
                                <li class="mt-2 col-md-12 col-6 p-0"><a class="text-muted" href="/CineBooking/home">Homepage</a></li>
                                <li class="mt-2 col-md-12 col-6 p-0"><a class="text-muted" href="/CineBooking/views/homepage/About.jsp">Rules</a></li>
                                <li class="mt-2 col-md-12 col-6 p-0"><a class="text-muted" href="/CineBooking/showtiming">Cinema</a></li>
                                <li class="mt-2 col-md-12 col-6 p-0"><a class="text-muted" href="/CineBooking/concession">Concession</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="footer_2i">
                            <h5 class="text-uppercase col_red mb-3">SUPPORT</h5>
                            <ul class="mb-0 row">
                                <li class="mt-2 col-md-12 col-6 p-0"><a class="text-muted" href="/CineBooking/views/homepage/About.jsp">About PlayShow</a></li>
                                <li class="mt-2 col-md-12 col-6 p-0"><a class="text-muted" href="/CineBooking/showtiming">Showtimings</a></li>
                                <li class="mt-2 col-md-12 col-6 p-0"><a class="text-muted" href="/CineBooking/views/homepage/About.jsp">Ticket booking instructions</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="footer_b">
            <div class="container-xl">
                <div class="row footer_b1 text-center">
                    <div class="col-md-12">
                        <p class="mb-0 text-muted">Website buy cinema ticket online | Design by <span class="col_red">SE1847.JS2-G3</span></p>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
