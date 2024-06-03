<%-- 
    Document   : focuslater2
    Created on : 18 May 2024, 10:54:59
    Author     : Son
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Current Sales-->
                <div class="col-12 col-xxl-4">
                    <div class="card mb-4 h-100">
                        <div class="card-header justify-content-between align-items-center d-flex">
                            <h6 class="card-title m-0">Current Sales</h6>
                            <div class="dropdown">
                                <button class="btn btn-link dropdown-toggle dropdown-toggle-icon fw-bold p-0" type="button"
                                    id="dropdownExpenses" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="ri-more-2-line"></i>
                                </button>
                                <ul class="dropdown-menu dropdown" aria-labelledby="dropdownExpenses">
                                    <li><a class="dropdown-item" href="#">Action</a></li>
                                    <li><a class="dropdown-item" href="#">Another action</a></li>
                                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-start mb-4 mt-2">
                                <div class="d-flex align-items-center">
                                    <h4 class="fs-3 fw-bold mb-0 me-3">$123,668</h4>
                                    <span class="badge bg-success-faded text-success d-flex align-items-center ">
                                        <span class="f-w-4 d-block me-2">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-100"><polyline points="23 6 13.5 15.5 8.5 10.5 1 18"></polyline><polyline points="17 6 23 6 23 12"></polyline></svg>
                                        </span>
                                        + 13%
                                    </span>            </div>
                                <div class="d-flex align-items-center ms-2 d-xxl-none">
                                    <div class="d-flex align-items-center">
                                        <span class="f-w-2 f-h-2 bg-primary d-block rounded-circle me-2"></span>
                                        <span class="small text-muted">2021</span>
                                    </div>
                                    <div class="d-flex align-items-center ms-4">
                                        <span class="f-w-2 f-h-2 bg-secondary-faded d-block rounded-circle me-2"></span>
                                        <span class="small text-muted">2020</span>
                                    </div>
                                </div>
                            </div>
                            <div class="chart chart-md pt-2">
                                <canvas id="chartBar"></canvas>
                            </div>
                        </div>
                    </div>                </div>
                <!-- / Current Sales-->                 

                <!-- Users By Country-->
                <div class="col-12 col-lg-6 col-xxl-4">
                    <div class="card mb-4 h-100">
                        <div class="card-header justify-content-between align-items-center d-flex">
                            <h6 class="card-title m-0">Visitors By Country</h6>
                            <div class="dropdown">
                                <button class="btn btn-link dropdown-toggle dropdown-toggle-icon fw-bold p-0" type="button"
                                    id="dropdownExpenses" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="ri-more-2-line"></i>
                                </button>
                                <ul class="dropdown-menu dropdown" aria-labelledby="dropdownExpenses">
                                    <li><a class="dropdown-item" href="#">Action</a></li>
                                    <li><a class="dropdown-item" href="#">Another action</a></li>
                                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-body">
                            <ul class="list-unstyled m-0">
                                        <li class="d-flex justify-content-between py-2">
                                            <div class="d-flex align-items-center">
                                                <span class="flag-icon flag-icon-gb me-2"></span>
                                                <span class="fw-medium">United Kingdom</span>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-end">
                                                <span class="text-muted text-end small me-1 d-lg-none d-xxl-block">31.2%</span>
                                                    <span class="badge bg-transparent text-success d-flex align-items-center ">
                                                        <span class="f-w-4 d-block">
                                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-100"><polyline points="23 6 13.5 15.5 8.5 10.5 1 18"></polyline><polyline points="17 6 23 6 23 12"></polyline></svg>
                                                        </span>
                                                    </span>                        </div>
                                        </li>
                                        <li class="d-flex justify-content-between py-2">
                                            <div class="d-flex align-items-center">
                                                <span class="flag-icon flag-icon-us me-2"></span>
                                                <span class="fw-medium">United States</span>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-end">
                                                <span class="text-muted text-end small me-1 d-lg-none d-xxl-block">15.8%</span>
                                                    <span class="badge bg-transparent text-danger d-flex align-items-center ">
                                                        <span class="f-w-4 d-block">
                                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-100"><polyline points="23 18 13.5 8.5 8.5 13.5 1 6"></polyline><polyline points="17 18 23 18 23 12"></polyline></svg>
                                                        </span>
                                                    </span>                        </div>
                                        </li>
                                        <li class="d-flex justify-content-between py-2">
                                            <div class="d-flex align-items-center">
                                                <span class="flag-icon flag-icon-in me-2"></span>
                                                <span class="fw-medium">India</span>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-end">
                                                <span class="text-muted text-end small me-1 d-lg-none d-xxl-block">21.5%</span>
                                                    <span class="badge bg-transparent text-success d-flex align-items-center ">
                                                        <span class="f-w-4 d-block">
                                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-100"><polyline points="23 6 13.5 15.5 8.5 10.5 1 18"></polyline><polyline points="17 6 23 6 23 12"></polyline></svg>
                                                        </span>
                                                    </span>                        </div>
                                        </li>
                                        <li class="d-flex justify-content-between py-2">
                                            <div class="d-flex align-items-center">
                                                <span class="flag-icon flag-icon-br me-2"></span>
                                                <span class="fw-medium">Brazil</span>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-end">
                                                <span class="text-muted text-end small me-1 d-lg-none d-xxl-block">27.2%</span>
                                                    <span class="badge bg-transparent text-danger d-flex align-items-center ">
                                                        <span class="f-w-4 d-block">
                                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-100"><polyline points="23 18 13.5 8.5 8.5 13.5 1 6"></polyline><polyline points="17 18 23 18 23 12"></polyline></svg>
                                                        </span>
                                                    </span>                        </div>
                                        </li>
                                        <li class="d-flex justify-content-between py-2">
                                            <div class="d-flex align-items-center">
                                                <span class="flag-icon flag-icon-au me-2"></span>
                                                <span class="fw-medium">Australia</span>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-end">
                                                <span class="text-muted text-end small me-1 d-lg-none d-xxl-block">44.8%</span>
                                                    <span class="badge bg-transparent text-success d-flex align-items-center ">
                                                        <span class="f-w-4 d-block">
                                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-100"><polyline points="23 6 13.5 15.5 8.5 10.5 1 18"></polyline><polyline points="17 6 23 6 23 12"></polyline></svg>
                                                        </span>
                                                    </span>                        </div>
                                        </li>
                                        <li class="d-flex justify-content-between py-2">
                                            <div class="d-flex align-items-center">
                                                <span class="flag-icon flag-icon-ch me-2"></span>
                                                <span class="fw-medium">China</span>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-end">
                                                <span class="text-muted text-end small me-1 d-lg-none d-xxl-block">23.2%</span>
                                                    <span class="badge bg-transparent text-success d-flex align-items-center ">
                                                        <span class="f-w-4 d-block">
                                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-100"><polyline points="23 6 13.5 15.5 8.5 10.5 1 18"></polyline><polyline points="17 6 23 6 23 12"></polyline></svg>
                                                        </span>
                                                    </span>                        </div>
                                        </li>
                            </ul>
                        </div>
                    </div>                </div>
                <!-- / Users By Country-->

                <!-- Users By Operating System-->
                <div class="col-12 col-lg-6 col-xxl-4">
                    <div class="card mb-4 h-100">
                        <div class="card-header justify-content-between align-items-center d-flex">
                            <h6 class="card-title m-0">Users by OS</h6>
                            <div class="dropdown">
                                <button class="btn btn-link dropdown-toggle dropdown-toggle-icon fw-bold p-0" type="button"
                                    id="dropdownExpenses" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="ri-more-2-line"></i>
                                </button>
                                <ul class="dropdown-menu dropdown" aria-labelledby="dropdownExpenses">
                                    <li><a class="dropdown-item" href="#">Action</a></li>
                                    <li><a class="dropdown-item" href="#">Another action</a></li>
                                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-body">
                            <ul class="list-unstyled m-0">
                                        <li class="d-flex justify-content-between py-2">
                                            <div class="d-flex align-items-center">
                                                <span class="f-w-4 me-3 lh-1">
                                                    <picture>
                                                        <img class="img-fluid" src="${pageContext.request.contextPath}/./assets/images/logos/logo-17.svg" alt="">
                                                    </picture>
                                                </span>
                                                <span class="fw-medium">MacOS 11 Big Sur</span>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-end">
                                                <span class="text-muted text-end small d-lg-none d-xxl-block">144,678</span>
                                                <div class="progress f-w-12 m-0 ms-2 f-h-1">
                                                    <div class="progress-bar" role="progressbar" style="width: 45%" aria-valuenow="45"
                                                        aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="d-flex justify-content-between py-2">
                                            <div class="d-flex align-items-center">
                                                <span class="f-w-4 me-3 lh-1">
                                                    <picture>
                                                        <img class="img-fluid" src="${pageContext.request.contextPath}/./assets/images/logos/logo-18.svg" alt="">
                                                    </picture>
                                                </span>
                                                <span class="fw-medium">Ubuntu</span>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-end">
                                                <span class="text-muted text-end small d-lg-none d-xxl-block">132,568</span>
                                                <div class="progress f-w-12 m-0 ms-2 f-h-1">
                                                    <div class="progress-bar" role="progressbar" style="width: 32%" aria-valuenow="32"
                                                        aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="d-flex justify-content-between py-2">
                                            <div class="d-flex align-items-center">
                                                <span class="f-w-4 me-3 lh-1">
                                                    <picture>
                                                        <img class="img-fluid" src="${pageContext.request.contextPath}/./assets/images/logos/logo-19.svg" alt="">
                                                    </picture>
                                                </span>
                                                <span class="fw-medium">Windows 11</span>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-end">
                                                <span class="text-muted text-end small d-lg-none d-xxl-block">114,345</span>
                                                <div class="progress f-w-12 m-0 ms-2 f-h-1">
                                                    <div class="progress-bar" role="progressbar" style="width: 23%" aria-valuenow="23"
                                                        aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="d-flex justify-content-between py-2">
                                            <div class="d-flex align-items-center">
                                                <span class="f-w-4 me-3 lh-1">
                                                    <picture>
                                                        <img class="img-fluid" src="${pageContext.request.contextPath}/./assets/images/logos/logo-17.svg" alt="">
                                                    </picture>
                                                </span>
                                                <span class="fw-medium">MacOS 10.14 Mojave</span>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-end">
                                                <span class="text-muted text-end small d-lg-none d-xxl-block">98,445</span>
                                                <div class="progress f-w-12 m-0 ms-2 f-h-1">
                                                    <div class="progress-bar" role="progressbar" style="width: 15%" aria-valuenow="15"
                                                        aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="d-flex justify-content-between py-2">
                                            <div class="d-flex align-items-center">
                                                <span class="f-w-4 me-3 lh-1">
                                                    <picture>
                                                        <img class="img-fluid" src="${pageContext.request.contextPath}/./assets/images/logos/logo-17.svg" alt="">
                                                    </picture>
                                                </span>
                                                <span class="fw-medium">MacOS 10.15 Catalina</span>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-end">
                                                <span class="text-muted text-end small d-lg-none d-xxl-block">95,987</span>
                                                <div class="progress f-w-12 m-0 ms-2 f-h-1">
                                                    <div class="progress-bar" role="progressbar" style="width: 10%" aria-valuenow="10"
                                                        aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="d-flex justify-content-between py-2">
                                            <div class="d-flex align-items-center">
                                                <span class="f-w-4 me-3 lh-1">
                                                    <picture>
                                                        <img class="img-fluid" src="${pageContext.request.contextPath}/./assets/images/logos/logo-19.svg" alt="">
                                                    </picture>
                                                </span>
                                                <span class="fw-medium">Windows 10</span>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-end">
                                                <span class="text-muted text-end small d-lg-none d-xxl-block">77,562</span>
                                                <div class="progress f-w-12 m-0 ms-2 f-h-1">
                                                    <div class="progress-bar" role="progressbar" style="width: 8%" aria-valuenow="8"
                                                        aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                        </li>
                            </ul>
                        </div>
                    </div>                </div>
                <!-- / Users By Operating System-->               

                <!-- Monthly Expenses-->
                <div class="col-12 col-lg-4">
                    <div class="card mb-4 h-100">
                        <div class="card-header justify-content-between align-items-center d-flex">
                            <h6 class="card-title m-0">Monthly expenses</h6>
                            <div class="dropdown">
                                <button class="btn btn-link dropdown-toggle dropdown-toggle-icon fw-bold p-0" type="button"
                                    id="dropdownExpenses" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="ri-more-2-line"></i>
                                </button>
                                <ul class="dropdown-menu dropdown" aria-labelledby="dropdownExpenses">
                                    <li><a class="dropdown-item" href="#">Action</a></li>
                                    <li><a class="dropdown-item" href="#">Another action</a></li>
                                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="chart chart-lg">
                                <canvas id="chartDoughnut"></canvas>
                            </div>
                    
                            <div class="row g-1 mt-4">
                    
                                <div class="col-12 col-sm-4 d-flex flex-column align-items-center">
                                    <p class="fw-bolder mb-1">$1,456</p>
                                    <div class="d-flex align-items-center">
                                        <span class="f-w-2 f-h-2 bg-secondary-faded d-block rounded-circle me-2"></span>
                                        <span class="small text-muted">Rent</span>
                                    </div>
                                </div>
                    
                                <div class="col-12 col-sm-4 d-flex flex-column align-items-center">
                                    <p class="fw-bolder mb-1">$12,325</p>
                                    <div class="d-flex align-items-center">
                                        <span class="f-w-2 f-h-2 bg-primary d-block rounded-circle me-2"></span>
                                        <span class="small text-muted">Salaries</span>
                                    </div>
                                </div>
                    
                                <div class="col-12 col-sm-4 d-flex flex-column align-items-center">
                                    <p class="fw-bolder mb-1">$14,899</p>
                                    <div class="d-flex align-items-center">
                                        <span class="f-w-2 f-h-2 bg-warning d-block rounded-circle me-2"></span>
                                        <span class="small text-muted">Marketing</span>
                                    </div>
                                </div>
                            </div>
                    
                            <a href="#" class="btn btn-light d-table mx-auto mt-4">View full expenses</a>
                        </div>
                    </div>                </div>
                <!-- /Monthly Expenses-->

                <!-- Yearly Income-->
                <div class="col-12 col-lg-8">
                    <div class="card mb-4 h-100">
                        <div class="card-header justify-content-between align-items-center d-flex">
                            <h6 class="card-title m-0">Yearly income</h6>
                            <div class="dropdown">
                                <button class="btn btn-link dropdown-toggle dropdown-toggle-icon fw-bold p-0" type="button"
                                    id="dropdownYearly" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="ri-more-2-line"></i>
                                </button>
                                <ul class="dropdown-menu dropdown" aria-labelledby="dropdownYearly">
                                    <li><a class="dropdown-item" href="#">Action</a></li>
                                    <li><a class="dropdown-item" href="#">Another action</a></li>
                                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center mb-5">
                                <div class="d-flex align-items-center">
                                    <h4 class="fs-3 fw-bold mb-0 me-3">$145,778</h4>
                                    <span class="badge bg-success-faded text-success d-flex align-items-center ">
                                        <span class="f-w-4 d-block me-2">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-100"><polyline points="23 6 13.5 15.5 8.5 10.5 1 18"></polyline><polyline points="17 6 23 6 23 12"></polyline></svg>
                                        </span>
                                        + 35%
                                    </span>            </div>
                                <div class="d-flex align-items-center">
                                    <div class="d-flex align-items-center">
                                        <span class="f-w-4 rounded f-h-1 bg-primary d-block me-2"></span>
                                        <span class="small text-muted">2021</span>
                                    </div>
                                    <div class="d-flex align-items-center ms-4">
                                        <span class="f-w-4 rounded f-h-1 bg-secondary-faded d-block me-2"></span>
                                        <span class="small text-muted">2020</span>
                                    </div>
                                </div>
                            </div>
                            <div class="chart">
                                <div class="chart chart-lg">
                                    <canvas id="chartLine"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>                </div>
                <!-- Yearly Income-->
