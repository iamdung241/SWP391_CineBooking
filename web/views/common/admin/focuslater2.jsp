<%-- 
    Document   : focuslater2
    Created on : 18 May 2024, 10:54:59
    Author     : Son
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
                <!-- Monthly Expenses-->
                <div class="col-12 col-lg-4">
                    <div class="card mb-4 h-100">
                        <div class="card-header justify-content-between align-items-center d-flex">
                            <h6 class="card-title m-0">Monthly expenses</h6>
<!--                            <div class="dropdown">
                                <button class="btn btn-link dropdown-toggle dropdown-toggle-icon fw-bold p-0" type="button"
                                    id="dropdownExpenses" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="ri-more-2-line"></i>
                                </button>
                                <ul class="dropdown-menu dropdown" aria-labelledby="dropdownExpenses">
                                    <li><a class="dropdown-item" href="#">Action</a></li>
                                    <li><a class="dropdown-item" href="#">Another action</a></li>
                                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                                </ul>
                            </div>-->
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
                        </div>
                    </div>                </div>
                <!-- /Monthly Expenses-->

                <!-- Yearly Income-->
                <div class="col-12 col-lg-8">
                    <div class="card mb-4 h-100">
                        <div class="card-header justify-content-between align-items-center d-flex">
                            <h6 class="card-title m-0">Yearly income</h6>
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
                    </div>                
                </div>
                <!-- Yearly Income-->
