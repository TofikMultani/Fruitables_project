<%@ Page Title="Manage Products" Language="C#" AutoEventWireup="true" CodeBehind="ManageProducts.aspx.cs" Inherits="Fruitables_project.Admin.ManageProducts" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Products</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <style>
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            background: #343a40;
            padding-top: 20px;
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
        .card {
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
    </style>

</head>
<body>
    <form runat="server">
       <!-- Sidebar -->
        <div class="sidebar">
            <h4 class="text-white text-center">Admin Panel</h4>
            <a href="AdminDashboard.aspx"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
            <a href="ManageProducts.aspx"><i class="fas fa-box"></i> Manage Products</a>
            <%--<a href="ManageOrders.aspx"><i class="fas fa-shopping-cart"></i> Orders</a>--%>
            <a href="AdminOrderManagement.aspx"><i class="fas fa-shopping-cart"></i> Orders</a>
            <a href="ManageUsers.aspx"><i class="fas fa-users"></i> Users</a>
            <%--<a href="Logout.aspx"><i class="fas fa-sign-out-alt"></i> Logout</a>--%>
             <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-danger" OnClick="btnLogout_Click">
    <i class="fas fa-sign-out-alt"></i> Logout
</asp:LinkButton>
        </div>

        <!-- Main Content -->
        <div class="content">
            <div class="container mt-4">
                <h2 class="text-center mb-4">Manage Products</h2>
                
                <!-- Add Product Form -->
                <div class="card p-4 shadow-sm mb-4">
                    <h4 class="mb-3">Add Product</h4>
                    <div class="mb-3">
                        <label class="form-label">Product Name</label>
                        <asp:TextBox ID="txtProName" runat="server" CssClass="form-control" placeholder="Enter Product Name"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Product Description</label>
                        <asp:TextBox ID="txtProDescription" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="3" placeholder="Enter Product Description"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Product Price</label>
                        <asp:TextBox ID="txtProPrice" runat="server" CssClass="form-control" placeholder="Enter Product Price"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Product Image</label>
                        <asp:FileUpload ID="fileProImage" runat="server" CssClass="form-control" />
                    </div>
                    <asp:Button ID="btnAddProduct" runat="server" CssClass="btn btn-success w-100" Text="Add Product" OnClick="btnAddProduct_Click" />
                </div>

                <!-- Product Table -->
                <div class="card p-4 shadow-sm">
                    <h4 class="mb-3">Product List</h4>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover" OnRowCommand="GridView1_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="ID" />
                            <asp:BoundField DataField="Pro_Name" HeaderText="Name" />
                            <asp:BoundField DataField="Pro_Description" HeaderText="Description" />
                            <asp:BoundField DataField="Pro_Price" HeaderText="Price" />
                            <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Height="60" Width="60" ImageUrl='<%# Eval("Pro_Image") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                 <%--  <asp:LinkButton ID="lnkEdit" runat="server" CommandName="cmd_edt" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-primary btn-sm">Edit</asp:LinkButton>--%>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandName="cmd_del" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-danger btn-sm ms-2">Delete</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>