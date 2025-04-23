<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminOrderManagement.aspx.cs" Inherits="Fruitables_project.Admin.AdminOrderManagement" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Order Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
        /* Global Styles */
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f5f5;
        }

        /* Sidebar styles */
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            background: #343a40;
            padding-top: 20px;
            overflow-y: auto;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .sidebar a {
            padding: 10px;
            text-decoration: none;
            font-size: 18px;
            color: white;
            display: block;
        }
        .sidebar a:hover {
            background: #575d63;
        }
        .content {
            margin-left: 260px;
            padding: 20px;
        }

        /* Header Styles */
        h2 {
            color: #343a40;
            margin-bottom: 20px;
        }

        /* Button Styles */
        .btn-primary, .btn-info, .btn-warning, .btn-success, .btn-secondary {
            border-radius: 5px;
            padding: 8px 15px;
        }

        /* GridView styles */
        .table-bordered {
            border-collapse: collapse;
            width: 100%;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }
        .table-bordered th {
            background-color: #343a40; /* Dark header */
            color: white; /* White text */
            text-align: center;
            padding: 10px;
        }
        .table-bordered td {
            text-align: center;
            padding: 10px;
            border-color: #ddd;
            background-color: #f9f9f9;
        }
        .table-bordered tr:nth-child(even) {
            background-color: #f2f2f2; /* Light gray for even rows */
        }
        .table-bordered tr:nth-child(odd) {
            background-color: #ffffff; /* White for odd rows */
        }
        .table-bordered tr:hover {
            background-color: #d1ecf1; /* Light blue on hover */
        }

        /* Panel Styles */
        .border {
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        /* Filter Buttons */
        .mb-3 {
            margin-bottom: 20px;
        }

        /* Custom Colors */
        .pending {
            background-color: #ff9900; /* Orange for pending */
            color: white;
            padding: 5px;
            border-radius: 5px;
        }
        .confirmed {
            background-color: #34c759; /* Green for confirmed */
            color: white;
            padding: 5px;
            border-radius: 5px;
        }
        .shipped {
            background-color: #007bff; /* Blue for shipped */
            color: white;
            padding: 5px;
            border-radius: 5px;
        }
        .delivered {
            background-color: #28a745; /* Green for delivered */
            color: white;
            padding: 5px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       <!-- Sidebar -->
        <div class="sidebar">
            <h4 class="text-white text-center">Admin Panel</h4>
            <a href="AdminDashboard.aspx"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
            <a href="ManageProducts.aspx"><i class="fas fa-box"></i> Manage Products</a>
            <a href="AdminOrderManagement.aspx"><i class="fas fa-shopping-cart"></i> Orders</a>
            <a href="ManageUsers.aspx"><i class="fas fa-users"></i> Users</a>
            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-danger mt-3 w-100" OnClick="LinkButton1_Click">
                <i class="fas fa-sign-out-alt"></i> Logout
            </asp:LinkButton>
            <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label> <!-- Message for logout feedback -->
        </div>

        <!-- Main Content -->
        <div class="content">
            <h2>Order Management</h2>

            <!-- Filter Buttons -->
            <div class="mb-3">
                <asp:Button ID="btnShowPending" runat="server" Text="Pending Orders" CssClass="btn btn-warning me-2" OnClick="btnShowPending_Click" />
                <asp:Button ID="btnShowConfirmed" runat="server" Text="Confirmed Orders" CssClass="btn btn-success me-2" OnClick="btnShowConfirmed_Click" />
                <asp:Button ID="report" runat="server" Text="Report" CssClass="btn btn-success me-2" OnClick="report_Click" />
                <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" ReuseParameterValuesOnRefresh="True" />
            </div>

            <!-- Orders Grid -->
            <asp:GridView ID="GridViewOrders" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered shadow-sm rounded-lg"
                OnRowCommand="GridViewOrders_RowCommand" OnRowDataBound="GridViewOrders_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="OrderId" HeaderText="Order ID" />
                    <asp:BoundField DataField="UserName" HeaderText="Customer Name" />
                    <asp:BoundField DataField="TotalAmount" HeaderText="Total Amount (₹)" DataFormatString="{0:N2}" />
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>' CssClass='' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Update Status">
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-select">
                                <asp:ListItem Text="Pending" Value="Pending" />
                                <asp:ListItem Text="Confirmed" Value="Confirmed" />
                                <asp:ListItem Text="Shipped" Value="Shipped" />
                                <asp:ListItem Text="Delivered" Value="Delivered" />
                            </asp:DropDownList>
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="UpdateStatus"
                                CommandArgument='<%# Eval("OrderId") %>' CssClass="btn btn-primary mt-2" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="btnView" runat="server" Text="View Details" CommandName="ViewDetails"
                                CommandArgument='<%# Eval("OrderId") %>' CssClass="btn btn-info" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <!-- Order Details Panel -->
            <asp:Panel ID="PanelOrderDetails" runat="server" Visible="false" CssClass="mt-4 p-3 border rounded-lg shadow-sm">
                <h4>Order Details for Order ID: <asp:Label ID="lblSelectedOrderId" runat="server" /></h4>
                <asp:GridView ID="GridViewOrderDetails" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered shadow-sm rounded-lg">
                    <Columns>
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ProductImage") %>' Height="60px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                        <asp:BoundField DataField="Price" HeaderText="Price (₹)" DataFormatString="{0:N2}" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                        <asp:BoundField DataField="Total" HeaderText="Total (₹)" DataFormatString="{0:N2}" />
                    </Columns>
                </asp:GridView>
                <asp:Button ID="btnCloseDetails" runat="server" Text="Close" CssClass="btn btn-secondary" OnClick="btnCloseDetails_Click" />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
