<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserOrders.aspx.cs" Inherits="Fruitables_project.UserOrders" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>My Orders</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .order-box {
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 25px;
        }
        .product-image {
            width: 80px;
            height: auto;
            object-fit: cover;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h2 class="text-center mb-4">My Order History</h2>

            <asp:Repeater ID="rptMyOrders" runat="server">
                <ItemTemplate>
                    <div class="order-box">
                        <div class="d-flex justify-content-between">
                            <div>
                                <strong>Order ID:</strong> <%# Eval("OrderId") %><br />
                                <strong>Date:</strong> <%# Eval("OrderDate", "{0:dd-MM-yyyy}") %><br />
                                <strong>Status:</strong> <%# Eval("Status") %>
                            </div>
                            <div>
                                <strong>Total:</strong> ₹<%# Eval("TotalAmount") %><br />
                                <strong>Shipping:</strong> <%# Eval("Address") %> - <%# Eval("PinCode") %>
                            </div>
                        </div>

                        <asp:Repeater ID="rptOrderItems" runat="server" DataSource='<%# Eval("Items") %>'>
                            <ItemTemplate>
                                <div class="row border-top pt-2 mt-2 align-items-center">
                                    <div class="col-md-2">
                                        <img src='<%# Eval("ProductImage") %>' class="product-image" />
                                    </div>
                                    <div class="col-md-10">
                                        <strong><%# Eval("ProductName") %></strong><br />
                                        Price: ₹<%# Eval("Price") %> | Qty: <%# Eval("Quantity") %> | Total: ₹<%# Eval("Total") %>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>