﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Account.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="Fruitables_project.Account1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
                <!DOCTYPE html>
    <html>
    <head>
        <meta charset="utf-8"><title>Fruitables - Vegetable Website Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>

        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status">
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar start -->
        <div class="container-fluid fixed-top">
            <div class="container topbar bg-primary d-none d-lg-block">
                <div class="d-flex justify-content-between">
                    <div class="top-info ps-2">
                            <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i><a href="#" class="text-white">KastuBadham Tramba</a></small> 
                            <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="#" class="text-white">fruitables@support.com</a></small>
                        </div> 
                    <div class="top-link pe-2">
                        <a href="#" class="text-white"><small class="text-white mx-2">Privacy Policy</small>/</a> <a href="#" class="text-white"><small class="text-white mx-2">Terms of Use</small>/</a> <a href="#" class="text-white"><small class="text-white ms-2">Sales and Refunds</small></a>
                    </div>
                </div>
            </div>
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="index.html" class="navbar-brand">
                    <h1 class="text-primary display-6">Fruitables</h1>
                    </a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="navbar-nav mx-auto">
                            <a href="Home.aspx" class="nav-item nav-link ">Home</a> 
                            <a href="Shop.aspx" class="nav-item nav-link">Shop</a> 
                            <%--<a href="ShopDetails.aspx" class="nav-item nav-link">Shop Detail</a>--%>
                            <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                            <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                <a href="Cart.aspx" class="dropdown-item">Cart</a> 
                                <a href="Chackout.aspx" class="dropdown-item">Chackout</a> 
                                <a href="Testimonial.aspx" class="dropdown-item">Testimonial</a> 
                                <a href="404 Page.aspx" class="dropdown-item">404 Page</a>
                                </div>
                            </div>
                            <a href="Contact.aspx" class="nav-item nav-link">Contact</a>
                            <a href="Contact2_3T.aspx" class="nav-item nav-link">Contact2</a>
                        </div>
                        <div class="d-flex m-3 me-0">
                            <button class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4" data-bs-toggle="modal" data-bs-target="#searchModal">
                                <i class="fas fa-search text-primary"></i>
                            </button>
                            <a href="Account.aspx" class="position-relative me-4 my-auto"><i class="fa fa-shopping-bag fa-2x"></i><span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" style="top: -5px; left: 15px; height: 20px; min-width: 20px;">3</span>

                            </a><a href="#" class="my-auto"><i class="fas fa-user fa-2x"></i></a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->
            </asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder2">

        <!-- Modal Search Start -->
        <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content rounded-0">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                        </button>
                    </div>
                    <div class="modal-body d-flex align-items-center">
                        <div class="input-group w-75 mx-auto d-flex">
                            <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1"> <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                        </div>
                    </div>
                </div>
            </div>
    </div>
        <!-- Modal Search End -->


    <br /><br /><br /><br /><br /><br /><br />

    <!DOCTYPE html>

    <br /><br /><br /><br /><br /><br /><br />

   
            </asp:Content>
<asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolder3">
                
            </asp:Content>

