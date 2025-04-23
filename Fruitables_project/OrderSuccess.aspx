<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderSuccess.aspx.cs" Inherits="Fruitables_project.OrderSuccess" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Successful</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        .success-container {
            margin: 100px auto;
            text-align: center;
            max-width: 600px;
            background-color: #f0fff0;
            border: 2px solid #28a745;
            padding: 30px;
            border-radius: 10px;
        }

        .btn-home {
            margin-top: 20px;
            background-color: #28a745;
            color: white;
            padding: 10px 25px;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            text-decoration: none;
        }

        .btn-home:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="success-container">
            <asp:Label ID="lblSuccessTitle" runat="server" Text="🎉 Order Placed Successfully!" CssClass="h2 text-success"></asp:Label>
            <br />
            <asp:Label ID="lblSuccessMessage" runat="server" Text="Thank you for shopping with us. Your order has been confirmed." CssClass="mt-2 d-block"></asp:Label>
            <br /><br />
            <asp:Button ID="btnGoHome" runat="server" Text="Go to Home" CssClass="btn-home" OnClick="btnGoHome_Click" />
            <br /><br />
            <asp:Button ID="btnViewOrders" runat="server" Text="View Order History" CssClass="btn-home" OnClick="btnViewOrders_Click" />
        </div>
    </form>
</body>
</html>
