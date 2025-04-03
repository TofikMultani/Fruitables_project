<%@ Page Title="" Language="C#" MasterPageFile="~/Account.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Fruitables_project.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
               <%-- <!DOCTYPE html>
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
        
        </div>
        <!-- Navbar End -->--%>
            </asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder3">
                <br />
    <br />
    <br />
    <br />
    <br />
    <%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Fruitables_project.Register" %>--%>

<!DOCTYPE html>


    <meta charset="UTF-8">
    <title>Register - Fruitables</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">


    <div style="max-width: 500px; margin: 50px auto; background: #fff; padding: 25px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1);">
        <h3 style="text-align: center; margin-bottom: 20px; color: #333;">Registration Form</h3>

        <p><b>Name</b></p>
<asp:TextBox ID="rtxtunm" runat="server" placeholder="Your Name" style="width:100%; padding: 12px; margin-bottom: 15px; border: 1px solid #ccc; border-radius: 5px;"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="rtxtunm" ErrorMessage="Name is required!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>


<p><b>Gender</b></p>
<asp:RadioButtonList ID="rrdb" runat="server" RepeatDirection="Horizontal" style="margin-bottom: 15px;">
    <asp:ListItem Value="Male">Male</asp:ListItem>
    <asp:ListItem Value="Female">Female</asp:ListItem>
</asp:RadioButtonList>

<p><b>Email</b></p>
<asp:TextBox ID="rem" runat="server" placeholder="Enter Your Email" style="width:100%; padding: 12px; margin-bottom: 15px; border: 1px solid #ccc; border-radius: 5px;"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="rem" ErrorMessage="Email is required!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="rem" ErrorMessage="Invalid email format!" ForeColor="Red" Display="Dynamic"
ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w+$"></asp:RegularExpressionValidator>

<p><b>City</b></p>
<asp:TextBox ID="rct" runat="server" placeholder="Enter Your City" style="width:100%; padding: 12px; margin-bottom: 15px; border: 1px solid #ccc; border-radius: 5px;"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="rct" ErrorMessage="City is required!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

<p><b>Address</b></p>
<asp:TextBox ID="radd" runat="server" placeholder="Your Address" style="width:100%; padding: 12px; margin-bottom: 15px; border: 1px solid #ccc; border-radius: 5px;"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="radd" ErrorMessage="Address is required!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

<p><b>Password</b></p>
<asp:TextBox ID="rpwd" runat="server" TextMode="Password" placeholder="Enter Your Password" style="width:100%; padding: 12px; margin-bottom: 15px; border: 1px solid #ccc; border-radius: 5px;"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="rpwd" ErrorMessage="Password is required!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="rpwd" ErrorMessage="Password must be at least 6 characters!" ForeColor="Red" Display="Dynamic"
ValidationExpression=".{6,}"></asp:RegularExpressionValidator>

<p><b>Confirm Password</b></p>
<asp:TextBox ID="rcpwd" runat="server" TextMode="Password" placeholder="Confirm Your Password" style="width:100%; padding: 12px; margin-bottom: 15px; border: 1px solid #ccc; border-radius: 5px;"></asp:TextBox>
<asp:CompareValidator ID="cvPassword" runat="server" ControlToValidate="rcpwd" ControlToCompare="rpwd" ErrorMessage="Passwords do not match!" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>

<!-- Register Button -->
<%--<asp:Button ID="RegisterButton" runat="server" Text="Register" type="submit" style="width:100%; padding: 12px; background: #007bff; color: #fff; border: none; border-radius: 5px; cursor: pointer;" OnClick="RegisterButton_Click1" />--%>
<asp:Button ID="RegisterButton" runat="server" Text="Register" style="width:100%; padding: 12px; background: #007bff; color: #fff; border: none; border-radius: 5px; cursor: pointer;" OnClick="RegisterButton_Click1" />

        <p class="text-center mt-3">Already have an account? <a href="Login.aspx">Login here</a></p>
    </div>


 
            </asp:Content>
<asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolder2">

    

            </asp:Content>

