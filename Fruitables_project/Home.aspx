﻿    <%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Fruitables_project.WebForm1" %>
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
                        <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                            <div class="navbar-nav mx-auto">
                                <a href="Home.aspx" class="nav-item nav-link active">Home</a> 
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
                                <%--<a href="Contact.aspx" class="nav-item nav-link">Contact</a>--%>
                                <a href="Contact2_3T.aspx" class="nav-item nav-link">Contact</a>
                                  <a href="UserOrders.aspx" class="nav-item nav-link">Orders</a>
                            </div>
                            <div class="d-flex m-3 me-0">
                               
                                <%--<a href="Account.aspx" class="my-auto">
                                    <i class="fas fa-user fa-2x"></i></a>--%>

                               <div style="display: flex; justify-content: space-between; align-items: center; padding: 10px; background-color: #f8f9fa;">
                                    <div>
                                        <asp:LinkButton ID="UserProfileButton" runat="server" Text="My Profile" OnClick="UserProfileButton_Click" CssClass="profile-button" />
                                    </div>
                                </div>
                                <style>
    .profile-button {
        padding: 8px 16px;
        background-color: #30cb11;
        color: white;
        text-decoration: none;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    .profile-button:hover {
    }
</style>

                               
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

      <asp:Panel ID="ProfilePopup" runat="server" CssClass="modal-box" Visible="false">
    <div class="content">
        <h3 class="modal-title">User Profile</h3>
        <p><asp:Label ID="lblUserName" runat="server" Text="Name: John Doe" /></p>
        <p><asp:Label ID="lblUserEmail" runat="server" Text="Email: john.doe@example.com" /></p>
        <p><asp:Label ID="lblUserCity" runat="server" Text="City: Rajkot" /></p>
        <p><asp:Label ID="lblUserAddress" runat="server" Text="Address: Tramba" /></p>
        <div class="modal-buttons">
            <asp:Button ID="btnEdit" runat="server" Text="Edit Profile" OnClick="btnEdit_Click" CssClass="edit-button" />
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="logout-button" />
        </div>
    </div>
</asp:Panel>


<style>
    /* Modal box styling */
    .modal-box {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 350px; /* Compact square box */
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
        padding: 20px;
        z-index: 1050;
        font-family: Arial, sans-serif;
        text-align: center;
    }

    /* Title styling */
    .modal-title {
        font-size: 20px;
        font-weight: bold;
        margin-bottom: 10px;
        color: #333333;
    }

    /* Profile field styling */
    .modal-box p {
        font-size: 16px;
        color: #555555;
        margin: 5px 0;
    }

    /* Button styling */
    .modal-buttons {
        margin-top: 20px;
    }

    .edit-button,
    .logout-button {
        padding: 10px 14px;
        margin: 5px;
        border: none;
        border-radius: 5px;
        font-size: 14px;
        cursor: pointer;
        width: 120px;
    }

    .edit-button {
        background-color: #30cb11;
        color: #ffffff;
        transition: background-color 0.3s ease;
    }

    .edit-button:hover {
        background-color: #0056b3;
    }

    .logout-button {
        background-color: #FF4D4D;
        color: #ffffff;
        transition: background-color 0.3s ease;
    }

    .logout-button:hover {
        background-color: #CC0000;
    }
</style>









            <!-- Hero Start -->
            <div class="container-fluid py-5 mb-5 hero-header">
                <div class="container py-5">
                    <div class="row g-5 align-items-center">
                        <div class="col-md-12 col-lg-7">
                            <h4 class="mb-3 text-secondary">100% Organic Foods</h4>
                            <h1 class="mb-5 display-3 text-primary">Organic Veggies & Fruits Foods</h1>
                            <%--<div class="position-relative mx-auto">
                                <input class="form-control border-2 border-secondary w-75 py-3 px-4 rounded-pill" type="number" placeholder="Search">
                                <button type="submit" class="btn btn-primary border-2 border-secondary py-3 px-4 position-absolute rounded-pill text-white h-100" style="top: 0; right: 25%;">
                                    Submit Now
                                </button>
                            </div>--%>
                        </div>
                        <div class="col-md-12 col-lg-5">
                            <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                                <div class="carousel-inner" role="listbox">
                                    <div class="carousel-item active rounded">
                                        <img src="img/hero-img-1.png" class="img-fluid w-100 h-100 bg-secondary rounded" alt="First slide"> <a href="#" class="btn px-4 py-2 text-white rounded">Fruites</a>
                                    </div>
                                    <div class="carousel-item rounded">
                                        <img src="img/hero-img-2.jpg" class="img-fluid w-100 h-100 rounded" alt="Second slide"> <a href="#" class="btn px-4 py-2 text-white rounded">Vesitables</a>
                                    </div>
                                </div>
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span><span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span><span class="visually-hidden">Next</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
            <!-- Hero End -->


            <!-- Featurs Section Start -->
            <div class="container-fluid featurs py-5">
                <div class="container py-5">
                    <div class="row g-4">
                        <div class="col-md-6 col-lg-3">
                            <div class="featurs-item text-center rounded bg-light p-4">
                                <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                    <i class="fas fa-car-side fa-3x text-white"></i>
                                </div>
                                <div class="featurs-content text-center">
                                    <h5>Free Shipping</h5>
                                    <p class="mb-0">
                                        Free on order over $300</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <div class="featurs-item text-center rounded bg-light p-4">
                                <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                    <i class="fas fa-user-shield fa-3x text-white"></i>
                                </div>
                                <div class="featurs-content text-center">
                                    <h5>Security Payment</h5>
                                    <p class="mb-0">
                                        100% security payment</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <div class="featurs-item text-center rounded bg-light p-4">
                                <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                    <i class="fas fa-exchange-alt fa-3x text-white"></i>
                                </div>
                                <div class="featurs-content text-center">
                                    <h5>30 Day Return</h5>
                                    <p class="mb-0">
                                        30 day money guarantee</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <div class="featurs-item text-center rounded bg-light p-4">
                                <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                    <i class="fa fa-phone-alt fa-3x text-white"></i>
                                </div>
                                <div class="featurs-content text-center">
                                    <h5>24/7 Support</h5>
                                    <p class="mb-0">
                                        Support every time fast</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
            <!-- Featurs Section End -->


            <!-- Fruits Shop Start-->
            <div class="container-fluid fruite py-5">
                <div class="container py-5">
                    <div class="tab-class text-center">
                        <div class="row g-4">
                            <div class="col-lg-4 text-start">
                                <h1>Our Organic Products</h1>
                            </div>
                            <div class="col-lg-8 text-end">
                                <ul class="nav nav-pills d-inline-flex text-center mb-5">
                                    <li class="nav-item"><a class="d-flex m-2 py-2 bg-light rounded-pill active" data-bs-toggle="pill" href="#tab-1"><span class="text-dark" style="width: 130px;">Vegetables</span> </a></li>
                              
                                </ul>
                            </div>
                        </div>
                        <div class="tab-content">
                            <div id="tab-1" class="tab-pane fade show p-0 active">
                                <div class="row g-4">
                                    <div class="col-lg-12">
                                        <div class="row g-4">
                                    
                                            <style>
    .product-card {
        border: 1px solid #eee;
        border-radius: 15px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        padding: 15px;
        text-align: center;
        margin: 10px;
        width: 250px;
        display: inline-block;
        vertical-align: top;
        position: relative;
        background: #fff;
    }

    .product-image img {
        width: 100%;
        height: 180px;
        border-radius: 10px 10px 0 0;
        object-fit: cover;
    }

    .category-badge {
        position: absolute;
        background: orange;
        color: white;
        font-size: 12px;
        padding: 4px 8px;
        border-radius: 5px;
        top: 10px;
        left: 10px;
    }

    .product-info {
        padding: 10px 0;
    }

    .product-price {
        font-weight: bold;
        color: #333;
    }

    /* View Details Button */
    .view-details-btn {
        display: block;
        padding: 5px 15px;
        border: 1px solid blue;
        color: blue;
        border-radius: 20px;
        text-decoration: none;
        font-size: 14px;
        cursor: pointer;
        background: #fff;
        margin-bottom: 5px;
    }

    .view-details-btn:hover {
        background: blue;
        color: white;
    }

    /* Add to Cart Button */
    .add-to-cart-btn {
        display: block;
        padding: 5px 15px;
        border: 1px solid green;
        color: green;
        border-radius: 20px;
        text-decoration: none;
        font-size: 14px;
        cursor: pointer;
        background: #fff;
    }

    .add-to-cart-btn:hover {
        background: green;
        color: white;
    }

    /* Pagination */
    .pagination-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 20px;
        padding: 10px;
    }

    .pagination-button {
        padding: 10px 20px;
        border: 1px solid #ccc;
        /*background-color: #58c20e;*/
        color: #333;
        text-decoration: none;
        border-radius: 5px;
        font-size: 14px;
        cursor: pointer;
    }

    .pagination-button:hover {
        background-color: #e0e0e0;
    }
</style>
<br /><br /><br /><br /><br /><br />
<!-- Add ScriptManager at the top of the page -->
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

<!-- Wrap Content Inside UpdatePanel -->
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" RepeatLayout="Flow">
            <ItemTemplate>
                <div class="product-card">
                    <div class="product-image">
                        <span class="category-badge">Vegetables</span>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Pro_Image") %>' />
                    </div>
                    <div class="product-info">
                        <h4><%# Eval("Pro_Name") %></h4>
                        <div class="product-price"> ₹ <%# Eval("Pro_Price") %></div>

                        <!-- View Details Button -->
                        <asp:LinkButton ID="LinkButton2" CssClass="view-details-btn" runat="server" CommandArgument='<%# Eval("Id") %>' OnCommand="LinkButton2_Command" OnClick="LinkButton2_Click">
                            <i class="fa fa-eye"></i> View Details
                        </asp:LinkButton>
                         
                        <!-- Add to Cart Button -->
                        <asp:LinkButton ID="LinkButton1" CssClass="add-to-cart-btn" runat="server" CommandArgument='<%# Eval("Id") %>' OnCommand="LinkButton1_Command" OnClick="LinkButton1_Click">
                            <i class="fa fa-shopping-bag"></i> Add to cart
                        </asp:LinkButton>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>

        <br /><br /><br /><br /><br /><br />
        <!-- Popup Section -->
<div id="productPopup" style="display:none;">
    <h5>Product Details</h5>
    <p><strong>Name:</strong> <asp:Label ID="lblProName" runat="server"></asp:Label></p>
    <p><strong>Description:</strong> <asp:Label ID="lblProDescription" runat="server"></asp:Label></p>
    <p><strong>Price:</strong> ₹ <asp:Label ID="lblProPrice" runat="server"></asp:Label></p>
    <p><strong>Image:</strong> <asp:Image ID="imgProduct" runat="server" Width="300px" /></p>
    <button onclick="closeProductPopup()">Close</button>
</div>

        <!-- Pagination Buttons -->
        <div class="pagination-container">
            <asp:LinkButton ID="LinkButton3" CssClass="pagination-button" runat="server" 
                OnClick="LinkButton3_Click">← Previous</asp:LinkButton>
            <asp:LinkButton ID="LinkButton4" CssClass="pagination-button" runat="server" 
                OnClick="LinkButton4_Click">Next →</asp:LinkButton>
        </div>

     
    </ContentTemplate>
</asp:UpdatePanel>

    <%--                                        <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" >
                                                <ItemTemplate>
                                                    <asp:Image ID="Image1"   Height="200px" Width="200px" runat="server" ImageUrl='<%# Eval("Pro_Image") %>' />
                                                    <br />
                                                    <asp:Label ID="Pro_Name" runat="server" Text='<%# Eval("Pro_Name") %>'></asp:Label>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Pro_Price" runat="server" Text='<%# Eval("Pro_Price") %>'></asp:Label>
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="Pro_Description" runat="server" Text='<%# Eval("Pro_Description") %>'></asp:Label>
                                                    <br />
                                                    <br />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:LinkButton ID="LinkButton1" class="btn border border-secondary rounded-pill px-3 text-primary"    runat="server">Add To Cart</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:DataList>--%>
                                                  
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="tab-2" class="tab-pane fade show p-0">
                                <div class="row g-4">
                                    <div class="col-lg-12">
                                        <div class="row g-4">
                                            <div class="col-md-6 col-lg-4 col-xl-3">
                                                <div class="rounded position-relative fruite-item">
                                                    <div class="fruite-img">
                                                        <img src="img/fruite-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                    </div>
                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">
                                                        Fruits                    <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                        <h4>Grapes</h4>
                                                        <p>
                                                            Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                                            <p class="text-dark fs-5 fw-bold mb-0">
                                                                $4.99 / kg</p>
                                                            <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i>Add to cart</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-lg-4 col-xl-3">
                                                <div class="rounded position-relative fruite-item">
                                                    <div class="fruite-img">
                                                        <img src="img/fruite-item-2.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                    </div>
                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">
                                                        Fruits</div>
                                                    <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                        <h4>Raspberries</h4>
                                                        <p>
                                                            Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                                            <p class="text-dark fs-5 fw-bold mb-0">
                                                                $4.99 / kg</p>
                                                            <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i>Add to cart</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="tab-3" class="tab-pane fade show p-0">
                                <div class="row g-4">
                                    <div class="col-lg-12">
                                        <div class="row g-4">
                                            <div class="col-md-6 col-lg-4 col-xl-3">
                                                <div class="rounded position-relative fruite-item">
                                                    <div class="fruite-img">
                                                        <img src="img/fruite-item-1.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                    </div>
                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">
                                                        Fruits</div>
                                                    <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                        <h4>Oranges</h4>
                                                        <p>
                                                            Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                                            <p class="text-dark fs-5 fw-bold mb-0">
                                                                $4.99 / kg</p>
                                                            <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i>Add to cart</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-lg-4 col-xl-3">
                                                <div class="rounded position-relative fruite-item">
                                                    <div class="fruite-img">
                                                        <img src="img/fruite-item-6.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                    </div>
                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">
                                                        Fruits</div>
                                                    <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                        <h4>Apple</h4>
                                                        <p>
                                                            Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                                            <p class="text-dark fs-5 fw-bold mb-0">
                                                                $4.99 / kg</p>
                                                            <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i>Add to cart</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="tab-4" class="tab-pane fade show p-0">
                                <div class="row g-4">
                                    <div class="col-lg-12">
                                        <div class="row g-4">
                                            <div class="col-md-6 col-lg-4 col-xl-3">
                                                <div class="rounded position-relative fruite-item">
                                                    <div class="fruite-img">
                                                        <img src="img/fruite-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                    </div>
                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">
                                                        Fruits</div>
                                                    <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                        <h4>Grapes</h4>
                                                        <p>
                                                            Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                                            <p class="text-dark fs-5 fw-bold mb-0">
                                                                $4.99 / kg</p>
                                                            <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i>Add to cart</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-lg-4 col-xl-3">
                                                <div class="rounded position-relative fruite-item">
                                                    <div class="fruite-img">
                                                        <img src="img/fruite-item-4.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                    </div>
                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">
                                                        Fruits</div>
                                                    <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                        <h4>Apricots</h4>
                                                        <p>
                                                            Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                                            <p class="text-dark fs-5 fw-bold mb-0">
                                                                $4.99 / kg</p>
                                                            <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i>Add to cart</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="tab-5" class="tab-pane fade show p-0">
                                <div class="row g-4">
                                    <div class="col-lg-12">
                                        <div class="row g-4">
                                            <div class="col-md-6 col-lg-4 col-xl-3">
                                                <div class="rounded position-relative fruite-item">
                                                    <div class="fruite-img">
                                                        <img src="img/fruite-item-3.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                    </div>
                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">
                                                        Fruits</div>
                                                    <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                        <h4>Banana</h4>
                                                        <p>
                                                            Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                                            <p class="text-dark fs-5 fw-bold mb-0">
                                                                $4.99 / kg</p>
                                                            <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i>Add to cart</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-lg-4 col-xl-3">
                                                <div class="rounded position-relative fruite-item">
                                                    <div class="fruite-img">
                                                        <img src="img/fruite-item-2.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                    </div>
                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">
                                                        Fruits</div>
                                                    <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                        <h4>Raspberries</h4>
                                                        <p>
                                                            Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                                            <p class="text-dark fs-5 fw-bold mb-0">
                                                                $4.99 / kg</p>
                                                            <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i>Add to cart</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-lg-4 col-xl-3">
                                                <div class="rounded position-relative fruite-item">
                                                    <div class="fruite-img">
                                                        <img src="img/fruite-item-1.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                    </div>
                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">
                                                        Fruits</div>
                                                    <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                        <h4>Oranges</h4>
                                                        <p>
                                                            Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                                            <p class="text-dark fs-5 fw-bold mb-0">
                                                                $4.99 / kg</p>
                                                            <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i>Add to cart</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
            <!-- Fruits Shop End-->


           


            



          


           


           


            <!-- Tastimonial Start -->
            <div class="container-fluid testimonial py-5">
                <div class="container py-5">
                    <div class="testimonial-header text-center">
                        <h4 class="text-primary">Our Testimonial</h4>
                        <h1 class="display-5 mb-5 text-dark">Our Client Saying!</h1>
                    </div>
                    <div class="owl-carousel testimonial-carousel">
                        <div class="testimonial-item img-border-radius bg-light rounded p-4">
                            <div class="position-relative">
                                <i class="fa fa-quote-right fa-2x text-secondary position-absolute" style="bottom: 30px; right: 0;"></i>
                                <div class="mb-4 pb-4 border-bottom border-secondary">
                                    <p class="mb-0">
                                        Lorem Ipsum is simply dummy text of the printing Ipsum has been the industry's standard dummy text ever since the 1500s,
                                    </p>
                                </div>
                                <div class="d-flex align-items-center flex-nowrap">
                                    <div class="bg-secondary rounded">
                                        <img src="img/testimonial-1.jpg" class="img-fluid rounded" style="width: 100px; height: 100px;" alt="">
                                    </div>
                                    <div class="ms-4 d-block">
                                        <h4 class="text-dark">Client Name</h4>
                                        <p class="m-0 pb-3">
                                            Profession</p>
                                        <div class="d-flex pe-5">
                                            <i class="fas fa-star text-primary"></i><i class="fas fa-star text-primary"></i><i class="fas fa-star text-primary"></i><i class="fas fa-star text-primary"></i><i class="fas fa-star"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="testimonial-item img-border-radius bg-light rounded p-4">
                            <div class="position-relative">
                                <i class="fa fa-quote-right fa-2x text-secondary position-absolute" style="bottom: 30px; right: 0;"></i>
                                <div class="mb-4 pb-4 border-bottom border-secondary">
                                    <p class="mb-0">
                                        Lorem Ipsum is simply dummy text of the printing Ipsum has been the industry's standard dummy text ever since the 1500s,
                                    </p>
                                </div>
                                <div class="d-flex align-items-center flex-nowrap">
                                    <div class="bg-secondary rounded">
                                        <img src="img/testimonial-1.jpg" class="img-fluid rounded" style="width: 100px; height: 100px;" alt="">
                                    </div>
                                    <div class="ms-4 d-block">
                                        <h4 class="text-dark">Client Name</h4>
                                        <p class="m-0 pb-3">
                                            Profession</p>
                                        <div class="d-flex pe-5">
                                            <i class="fas fa-star text-primary"></i><i class="fas fa-star text-primary"></i><i class="fas fa-star text-primary"></i><i class="fas fa-star text-primary"></i><i class="fas fa-star text-primary"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="testimonial-item img-border-radius bg-light rounded p-4">
                            <div class="position-relative">
                                <i class="fa fa-quote-right fa-2x text-secondary position-absolute" style="bottom: 30px; right: 0;"></i>
                                <div class="mb-4 pb-4 border-bottom border-secondary">
                                    <p class="mb-0">
                                        Lorem Ipsum is simply dummy text of the printing Ipsum has been the industry's standard dummy text ever since the 1500s,
                                    </p>
                                </div>
                                <div class="d-flex align-items-center flex-nowrap">
                                    <div class="bg-secondary rounded">
                                        <img src="img/testimonial-1.jpg" class="img-fluid rounded" style="width: 100px; height: 100px;" alt="">
                                    </div>
                                    <div class="ms-4 d-block">
                                        <h4 class="text-dark">Client Name</h4>
                                        <p class="m-0 pb-3">
                                            Profession</p>
                                        <div class="d-flex pe-5">
                                            <i class="fas fa-star text-primary"></i><i class="fas fa-star text-primary"></i><i class="fas fa-star text-primary"></i><i class="fas fa-star text-primary"></i><i class="fas fa-star text-primary"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
            <!-- Tastimonial End -->

                </div>
    </asp:Content>
    <asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolder3">
                
            <!-- Footer Start -->
            <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5">
                <div class="container py-5">
                    <div class="pb-4 mb-4" style="border-bottom: 1px solid rgba(226, 175, 24, 0.5) ;">
                        <div class="row g-4">
                            <div class="col-lg-3">
                                <a href="#">
                                <h1 class="text-primary mb-0">Fruitables</h1>
                                <p class="text-secondary mb-0">
                                    Fresh products</p>
                                </a>
                            </div>
                         <%--   <div class="col-lg-6">
                                <div class="position-relative mx-auto">
                                    <input class="form-control border-0 w-100 py-3 px-4 rounded-pill" type="number" placeholder="Your Email">
                                    <button type="submit" class="btn btn-primary border-0 border-secondary py-3 px-4 position-absolute rounded-pill text-white" style="top: 0; right: 0;">
                                        Subscribe Now
                                    </button>
                                </div>
                            </div>--%>
                            <div class="col-lg-3">
                                <div class="d-flex justify-content-end pt-3">
                                    
                                    <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href="https://www.facebook.com/tofik.multani.338">
                                        <i class="fab fa-facebook-f"></i>
                                    </a>
                                    <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href="https://www.youtube.com/@tofikmultani5057">
                                        <i class="fab fa-youtube"></i>
                                    </a>

                                    <a class="btn btn-outline-secondary btn-md-square rounded-circle" href="https://www.linkedin.com/in/tofik-multani-44b883249/">
                                        <i class="fab fa-linkedin-in"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row g-5">
                        <div class="col-lg-3 col-md-6">
                            <div class="footer-item">
                                <h4 class="text-light mb-3">Why People Like us!</h4>
                                <p class="mb-4">
                                    typesetting, remaining essentially unchanged. It was 
                                    popularised in the 1960s with the like Aldus PageMaker including of Lorem Ipsum.</p>
                                <%--<a href="" class="btn border-secondary py-2 px-4 rounded-pill text-primary">Read More</a>--%>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="d-flex flex-column text-start footer-item">
                                <h4 class="text-light mb-3">Shop Info</h4>
                                <a class="btn-link" href="Home.aspx">Home</a>
                                <a class="btn-link" href="Contact2_3T.aspx">Contact Us</a> 
                                <a class="btn-link" href="Shop.aspx">Shop</a> 
                                <%--<a class="btn-link" href="ShopDetails.aspx">Shop Details</a>--%> 
                                <%--<a class="btn-link" href="">Return Policy</a>--%> 
                                <%--<a class="btn-link" href="">FAQs & Help</a>--%>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="d-flex flex-column text-start footer-item">
                                <h4 class="text-light mb-3">Account</h4>
                                <a class="btn-link" href="EditUserProfile.aspx">My Account</a> 
                                <%--<a class="btn-link" href="">Shop details</a>--%> 
                                <a class="btn-link" href="Cart.aspx">Shopping Cart</a> 
                                <%--<a class="btn-link" href="">Wishlist</a>--%> 
                                <a class="btn-link" href="UserOrders.aspx">Order History</a>
                                <%--<a class="btn-link" href="">International Orders</a>--%>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="footer-item">
                                <h4 class="text-light mb-3">Contact</h4>
                                <p>
                                    Address: Kasturbadham Tramba</p>
                                <p>
                                    Email: fruitables@support.com</p>   
                                <p>
                                    Phone: +0123 4567 8910</p>
                                <p>
                                    Payment Accepted 
                                    :- Case
                                </p>
                                <%--<img src="img/payment.png" class="img-fluid" alt="">--%>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
            <!-- Footer End -->

            <!-- Copyright Start -->
            <div class="container-fluid copyright bg-dark py-4">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            <span class="text-light"><a href="#">
                                <i class="fas fa-copyright text-light me-2">


                                </i>FRUITABLE@2025</a>, All right reserved.</span>
                        </div>
                       
                    </div>
                </div>
        </div>
            <!-- Copyright End -->



            <!-- Back to Top -->
            <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   

        
        <!-- JavaScript Libraries -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/lightbox/js/lightbox.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        </body>

    </html>
                </asp:Content>

