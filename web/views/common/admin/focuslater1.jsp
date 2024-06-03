<%-- 
    Document   : focuslater
    Created on : 18 May 2024, 10:50:48
    Author     : Son
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="row g-4">       
                
                <!-- Number Orders Widget-->
                <div class="col-12 col-sm-6 col-xxl-3">
                    <div class="card h-100">
                        <div class="card-header justify-content-between align-items-center d-flex border-0 pb-0">
                            <h6 class="card-title m-0 text-muted fs-xs text-uppercase fw-bolder tracking-wide">Monthly Income</h6>
                        </div>
                        <div class="card-body">
                            <div class="row gx-4 mb-3 mb-md-1">
                                <div class="col-12 col-md-6">
                                    <p class="fs-3 fw-bold d-flex align-items-center"><span class="fs-9 me-1">$</span> 567,99</p>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="chart chart-sm">
                                        <canvas id="chartMonthlyIncome"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex align-items-center">
                                <span class="f-w-7 f-h-7 p-2 bg-success-faded text-success rounded-circle d-flex align-items-center justify-content-center">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-100"><polyline points="23 6 13.5 15.5 8.5 10.5 1 18"></polyline><polyline points="17 6 23 6 23 12"></polyline></svg>
                                </span>
                                <span class="fw-bold text-success fs-9 ms-2">+ 10.2%</span>
                            </div>
                        </div>
                    </div>                </div>
                <!-- / Number Orders Widget-->

                <!-- Average Orders Widget-->
                <div class="col-12 col-sm-6 col-xxl-3">
                    <div class="card h-100">
                        <div class="card-header justify-content-between align-items-center d-flex border-0 pb-0">
                            <h6 class="card-title m-0 text-muted fs-xs text-uppercase fw-bolder tracking-wide">Average Order</h6>
                        </div>
                        <div class="card-body">
                            <div class="row gx-4 mb-3 mb-md-1">
                                <div class="col-12 col-md-6">
                                    <p class="fs-3 fw-bold d-flex align-items-center"><span class="fs-9 me-1">$</span> 193,99</p>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="chart chart-sm">
                                        <canvas id="chartAvgOrders"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex align-items-center">
                                <span class="f-w-7 f-h-7 p-2 bg-danger-faded text-danger rounded-circle d-flex align-items-center justify-content-center">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-100"><polyline points="23 18 13.5 8.5 8.5 13.5 1 6"></polyline><polyline points="17 18 23 18 23 12"></polyline></svg>
                                </span>
                                <span class="fw-bold text-danger fs-9 ms-2">- 23.5%</span>
                            </div>
                        </div>
                    </div>                </div>
                <!-- / Average Orders Widget-->

                <!-- Pageviews Widget-->
                <div class="col-12 col-sm-6 col-xxl-3">
                    <div class="card h-100">
                        <div class="card-header justify-content-between align-items-center d-flex border-0 pb-0">
                            <h6 class="card-title m-0 text-muted fs-xs text-uppercase fw-bolder tracking-wide">Daily Pageviews</h6>
                        </div>
                        <div class="card-body">
                            <div class="row gx-4 mb-3 mb-md-1">
                                <div class="col-12 col-md-6">
                                    <p class="fs-3 fw-bold">95,456</p>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="chart chart-sm">
                                        <canvas id="chartPageviews"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex align-items-center">
                                <span class="f-w-7 f-h-7 p-2 bg-success-faded text-success rounded-circle d-flex align-items-center justify-content-center">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-100"><polyline points="23 6 13.5 15.5 8.5 10.5 1 18"></polyline><polyline points="17 6 23 6 23 12"></polyline></svg>
                                </span>
                                <span class="fw-bold text-success fs-9 ms-2">+ 1.1%</span>
                            </div>
                        </div>
                    </div>                </div>
                <!-- / Pageviews Widget-->

                <!-- Number Refunds Widget-->
                <div class="col-12 col-sm-6 col-xxl-3">
                    <div class="card h-100">
                        <div class="card-header justify-content-between align-items-center d-flex border-0 pb-0">
                            <h6 class="card-title m-0 text-muted fs-xs text-uppercase fw-bolder tracking-wide">Refund Issued</h6>
                        </div>
                        <div class="card-body">
                            <div class="row gx-4 mb-3 mb-md-1">
                                <div class="col-12 col-md-6">
                                    <p class="fs-3 fw-bold d-flex align-items-center"><span class="fs-9 me-1">$</span> 12,340</p>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="chart chart-sm">
                                        <canvas id="chartNumRefunds"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex align-items-center">
                                <span class="f-w-7 f-h-7 p-2 bg-success-faded text-success rounded-circle d-flex align-items-center justify-content-center">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-100"><polyline points="23 6 13.5 15.5 8.5 10.5 1 18"></polyline><polyline points="17 6 23 6 23 12"></polyline></svg>
                                </span>
                                <span class="fw-bold text-success fs-9 ms-2">+ 7.5%</span>
                            </div>
                        </div>
                    </div>                </div>
                <!-- / Number Refunds Widget--> 


                <!-- Latest Events-->
                <div class="col-12 col-md-6">
                <div class="card h-100 bg-primary border-primary">
                    <div class="card-header bg-transparent justify-content-between align-items-center d-flex border-0 pb-0">
                        <div class="d-flex align-items-center flex-shrink-0">
                            <i class="ri-calendar-line me-2 text-white opacity-75 ri-lg"></i>
                            <h6 class="card-title m-0 text-light fs-xs text-uppercase fw-bolder tracking-wide">Upcoming Events</h6>
                        </div>
                        <div class="swiper-announcement-pagination text-end text-white opacity-75 fw-bold fs-9"></div>
                    </div>
                    <div class="card-body mt-3">
                        <div class="d-flex flex-grow-1 overflow-hidden text-white">
                            <!-- Swiper Latest -->
                            <div class="swiper-container overflow-hidden w-auto" data-swiper data-options='{
                                "spaceBetween": 10,
                                "loop": true,
                                "slidesPerView": 1,
                                "observeParents": true,
                                "observer": true,
                                "autoplay": {
                                "delay": 6000,
                                "disableOnInteraction": false
                                },
                                "pagination": {
                                    "el": ".swiper-announcement-pagination",
                                    "clickable": true,
                                    "type": "fraction"
                                }
                            }'>
                                <div class="swiper-wrapper">
                                            <div class="swiper-slide text-white">
                
                                                <!-- Event Date & Title-->
                                                <div class="d-flex mb-4 align-items-start">
                                                    <div class="me-3 text-center pe-3 border-end-white-opacity">
                                                        <span class="d-block text-uppercase small fw-bolder tracking-wide lh-1">Wed</span>
                                                        <span class="d-block fs-3 text-uppercase fw-bold tracking-wide lh-1 mt-1">12</span>
                                                    </div>
                                                    <div>
                                                        <p class="mb-0 fs-5 fw-bolder lh-1">Quarterly Staff Review</p>
                                                        <small class="d-block lh-1 opacity-75 mt-2">Review sales staff with Mike, John, Sally</small>
                                                    </div>
                                                </div>
                                                <!-- / Event Date & Title-->
                                                
                                                <!-- Event Location-->
                                                <div class="d-flex align-items-start mb-5">
                                                    <button class="btn-icon bg-white opacity-25 me-3"><i class="ri-map-pin-line"></i></button>
                                                    <div>
                                                        <span class="d-block fw-bolder fs-6">Piccadily Circus</span>
                                                        <small class="d-block opacity-75">London, SW12 3RT</small>
                                                    </div>
                                                </div>
                                                <!-- / Event Location-->
                
                                                <!-- Attendees & CTA-->
                                                <div class="d-flex justify-content-start align-items-start flex-column flex-lg-row justify-content-lg-between">
                                                    <div class="avatar-group me-4">
                                                        <picture class="avatar-group-img">
                                                            <img class="f-w-10 rounded-circle border-primary" src="${pageContext.request.contextPath}/./assets/images/profile-small.jpeg"
                                                            alt="">
                                                        </picture>
                                                        <picture class="avatar-group-img">
                                                            <img class="f-w-10 rounded-circle border-primary" src="${pageContext.request.contextPath}/./assets/images/profile-small-2.jpeg"
                                                            alt="">
                                                        </picture>
                                                        <picture class="avatar-group-img">
                                                            <img class="f-w-10 rounded-circle border-primary" src="${pageContext.request.contextPath}/./assets/images/profile-small-3.jpeg"
                                                            alt="">
                                                        </picture>
                                                        <picture class="avatar-group-img">
                                                            <img class="f-w-10 rounded-circle border-primary" src="${pageContext.request.contextPath}/./assets/images/profile-small-4.jpeg"
                                                            alt="">
                                                        </picture>
                                                        <span class="small fw-bolder ms-2 text-white opacity-90">+ 12 more</span>
                                                    </div>
                
                                                    <div class="mt-3 mt-lg-0">
                                                        <button class="btn btn-sm btn-white">Attending</button>
                                                        <button class="btn btn-sm btn-link text-white fw-bolder opacity-75">Cancel</button>
                                                    </div>
                                                </div>
                                                <!-- Attendees & CTA-->
                                            </div>
                                            <div class="swiper-slide text-white">
                
                                                <!-- Event Date & Title-->
                                                <div class="d-flex mb-4 align-items-start">
                                                    <div class="me-3 text-center pe-3 border-end-white-opacity">
                                                        <span class="d-block text-uppercase small fw-bolder tracking-wide lh-1">Thu</span>
                                                        <span class="d-block fs-3 text-uppercase fw-bold tracking-wide lh-1 mt-1">22</span>
                                                    </div>
                                                    <div>
                                                        <p class="mb-0 fs-5 fw-bolder lh-1">Yearly Budget Review</p>
                                                        <small class="d-block lh-1 opacity-75 mt-2">Budget meeting with Patrick and Debbie</small>
                                                    </div>
                                                </div>
                                                <!-- / Event Date & Title-->
                                                
                                                <!-- Event Location-->
                                                <div class="d-flex align-items-start mb-5">
                                                    <button class="btn-icon bg-white opacity-25 me-3"><i class="ri-map-pin-line"></i></button>
                                                    <div>
                                                        <span class="d-block fw-bolder fs-6">South Bank Events Hall</span>
                                                        <small class="d-block opacity-75">London, SE4 7EH</small>
                                                    </div>
                                                </div>
                                                <!-- / Event Location-->
                
                                                <!-- Attendees & CTA-->
                                                <div class="d-flex justify-content-start align-items-start flex-column flex-lg-row justify-content-lg-between">
                                                    <div class="avatar-group me-4">
                                                        <picture class="avatar-group-img">
                                                            <img class="f-w-10 rounded-circle border-primary" src="${pageContext.request.contextPath}/./assets/images/profile-small.jpeg"
                                                            alt="">
                                                        </picture>
                                                        <picture class="avatar-group-img">
                                                            <img class="f-w-10 rounded-circle border-primary" src="${pageContext.request.contextPath}/./assets/images/profile-small-2.jpeg"
                                                            alt="">
                                                        </picture>
                                                        <picture class="avatar-group-img">
                                                            <img class="f-w-10 rounded-circle border-primary" src="${pageContext.request.contextPath}/./assets/images/profile-small-3.jpeg"
                                                            alt="">
                                                        </picture>
                                                        <picture class="avatar-group-img">
                                                            <img class="f-w-10 rounded-circle border-primary" src="${pageContext.request.contextPath}/./assets/images/profile-small-4.jpeg"
                                                            alt="">
                                                        </picture>
                                                        <span class="small fw-bolder ms-2 text-white opacity-90">+ 8 more</span>
                                                    </div>
                
                                                    <div class="mt-3 mt-lg-0">
                                                        <button class="btn btn-sm btn-white">Attending</button>
                                                        <button class="btn btn-sm btn-link text-white fw-bolder opacity-75">Cancel</button>
                                                    </div>
                                                </div>
                                                <!-- Attendees & CTA-->
                                            </div>
                                            <div class="swiper-slide text-white">
                
                                                <!-- Event Date & Title-->
                                                <div class="d-flex mb-4 align-items-start">
                                                    <div class="me-3 text-center pe-3 border-end-white-opacity">
                                                        <span class="d-block text-uppercase small fw-bolder tracking-wide lh-1">Mon</span>
                                                        <span class="d-block fs-3 text-uppercase fw-bold tracking-wide lh-1 mt-1">28</span>
                                                    </div>
                                                    <div>
                                                        <p class="mb-0 fs-5 fw-bolder lh-1">Summer Staff Party</p>
                                                        <small class="d-block lh-1 opacity-75 mt-2">Yearly company summer party</small>
                                                    </div>
                                                </div>
                                                <!-- / Event Date & Title-->
                                                
                                                <!-- Event Location-->
                                                <div class="d-flex align-items-start mb-5">
                                                    <button class="btn-icon bg-white opacity-25 me-3"><i class="ri-map-pin-line"></i></button>
                                                    <div>
                                                        <span class="d-block fw-bolder fs-6">8 Northumberland Avenue</span>
                                                        <small class="d-block opacity-75">London, SW12 3RT</small>
                                                    </div>
                                                </div>
                                                <!-- / Event Location-->
                
                                                <!-- Attendees & CTA-->
                                                <div class="d-flex justify-content-start align-items-start flex-column flex-lg-row justify-content-lg-between">
                                                    <div class="avatar-group me-4">
                                                        <picture class="avatar-group-img">
                                                            <img class="f-w-10 rounded-circle border-primary" src="${pageContext.request.contextPath}/./assets/images/profile-small.jpeg"
                                                            alt="">
                                                        </picture>
                                                        <picture class="avatar-group-img">
                                                            <img class="f-w-10 rounded-circle border-primary" src="${pageContext.request.contextPath}/./assets/images/profile-small-2.jpeg"
                                                            alt="">
                                                        </picture>
                                                        <picture class="avatar-group-img">
                                                            <img class="f-w-10 rounded-circle border-primary" src="${pageContext.request.contextPath}/./assets/images/profile-small-3.jpeg"
                                                            alt="">
                                                        </picture>
                                                        <picture class="avatar-group-img">
                                                            <img class="f-w-10 rounded-circle border-primary" src="${pageContext.request.contextPath}/./assets/images/profile-small-4.jpeg"
                                                            alt="">
                                                        </picture>
                                                        <span class="small fw-bolder ms-2 text-white opacity-90">+ 32 more</span>
                                                    </div>
                
                                                    <div class="mt-3 mt-lg-0">
                                                        <button class="btn btn-sm btn-white">Attending</button>
                                                        <button class="btn btn-sm btn-link text-white fw-bolder opacity-75">Cancel</button>
                                                    </div>
                                                </div>
                                                <!-- Attendees & CTA-->
                                            </div>
                                </div>
                
                            </div>
                            <!-- / Swiper Latest-->
                        </div>
                    </div>
                </div>                </div>
                <!-- /Latest Events-->

                <!-- Refer A Friend-->
                <div class="col-12 col-md-6">
                <div class="card h-100">
                    <div class="card-body overflow-hidden">
                        <div class="row gx-2 h-100">
                            <div class="col-3 d-none d-xl-flex h-100 align-items-center">
                                <picture>
                                    <img class="w-100" src="${pageContext.request.contextPath}/./assets/images/refer.svg" alt="HTML Bootstrap Admin Template by Pixel Rocket">
                                </picture>
                            </div>
                            <div class="col-12 col-xl-6 d-flex flex-column justify-content-center align-items-center text-center h-100">
                                <p class="fw-bold fs-5">Refer a friend and get one month's pro subscription free</p>
                                <p class="text-muted">We'll give you a month's pro subscription for every friend that signs up to Apollo.</p>
                                <a href="#" class="btn btn-outline-secondary btn-sm text-body"><i class="ri-file-copy-line align-middle"></i> Copy invite code</a>
                            </div>
                            <div class="col-3 d-none d-xl-flex h-100 align-items-center">
                                <picture>
                                    <img class="w-100" src="${pageContext.request.contextPath}/./assets/images/refer-2.svg" alt="HTML Bootstrap Admin Template by Pixel Rocket">
                                </picture>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
                <!-- /Refer A Friend-->               

            </div>
                                