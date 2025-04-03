<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/add_product.Master" AutoEventWireup="true" CodeBehind="add_product.aspx.cs" Inherits="Fruitables_project.Admin.add_product1" %>
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
                        <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i><a href="#" class="text-white">123 Street, New York</a></small> <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="#" class="text-white">Email@Example.com</a></small>
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
                            <a href="index.html" class="nav-item nav-link">Home</a> 
                            <a href="shop.html" class="nav-item nav-link">Shop</a> 
                            <a href="shop-detail.html" class="nav-item nav-link">Shop Detail</a>
                            <a href="add_product.aspx" class="nav-item nav-link">Add Product</a>
                            <a href="contact.html" class="nav-item nav-link">Contact</a>
                        </div>
                        <div class="d-flex m-3 me-0">
                            <button class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4" data-bs-toggle="modal" data-bs-target="#searchModal">
                                <i class="fas fa-search text-primary"></i>
                            </button>
                            <a href="#" class="position-relative me-4 my-auto"><i class="fa fa-shopping-bag fa-2x"></i><span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" style="top: -5px; left: 15px; height: 20px; min-width: 20px;">3</span> </a><a href="#" class="my-auto"><i class="fas fa-user fa-2x"></i></a>
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
     

   <br />
    <br />
    <br />
    <br />
    <br />
  <!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product Form</title>
</head>
<body>

    <div style="max-width: 500px; margin: 50px auto; background: #fff; padding: 25px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1);">
        <h3 style="text-align: center; margin-bottom: 20px; color: #333;">Add Product</h3>

        <p><b>Product Name</b></p>
        <asp:TextBox ID="txtProName" runat="server" placeholder="Enter Product Name" 
                     style="width:100%; padding: 12px; margin-bottom: 15px; border: 1px solid #ccc; border-radius: 5px;">
        </asp:TextBox>

        <p><b>Product Description</b></p>
        <asp:TextBox ID="txtProDescription" runat="server" TextMode="MultiLine" Rows="4" placeholder="Enter Product Description" 
                     style="width:100%; padding: 12px; margin-bottom: 15px; border: 1px solid #ccc; border-radius: 5px;">
        </asp:TextBox>

        <p><b>Product Price</b></p>
        <asp:TextBox ID="txtProPrice" runat="server" placeholder="Enter Product Price" 
                     style="width:100%; padding: 12px; margin-bottom: 15px; border: 1px solid #ccc; border-radius: 5px;">
        </asp:TextBox>

        <p><b>Product Image</b></p>
        <asp:FileUpload ID="fileProImage" runat="server" 
                        style="width:100%; padding: 12px; margin-bottom: 20px; border: 1px solid #ccc; border-radius: 5px;" />

        <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" type="submit" 
                    style="width:100%; padding: 12px; background: #28a745; color: #fff; border: none; border-radius: 5px; cursor: pointer;" 
                    OnClick="btnAddProduct_Click" />

    </div>
    <center>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#28a745" BorderColor="#28a745" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" CellSpacing="2"  HeaderStyle-BackColor="#28a745" HeaderStyle-ForeColor="White" RowStyle-BackColor="#fff8f0" RowStyle-ForeColor="#333" OnRowCommand="GridView1_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="Id">
                <ItemStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="#28a745" />
            <HeaderStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="#28a745" />
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Pro_Name">
                <ItemStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="#28a745" />
            <HeaderStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="#28a745" />
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Pro_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Pro_Description">
                <ItemStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="#28a745" />
            <HeaderStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="#28a745" />
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Pro_Description") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Pro_Price">
                <ItemStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="#28a745" />
            <HeaderStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="#28a745" />
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Pro_Price") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Pro_Image">
                <ItemStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="#28a745" />
            <HeaderStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="#28a745" />
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="100" Width="100" ImageUrl='<%# Eval("Pro_Image") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Edit">
                <ItemStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="#28a745" />
            <HeaderStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="#28a745" />
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="cmd_edt" CommandArgument='<%# Eval("Id") %>'>Edit</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="#28a745" />
            <HeaderStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="#28a745" />
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="cmd_del" CommandArgument='<%# Eval("Id") %>'>Delete</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FFF1D4" />
        <SortedAscendingHeaderStyle BackColor="#B95C30" />
        <SortedDescendingCellStyle BackColor="#F1E5CE" />
        <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        </center>
</body>
</html>
           </asp:Content>
<asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolder3">
                
            </asp:Content>

