<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="Fruitables_project.Admin.ManageUsers" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
    
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
            overflow-y: auto;
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

         .grid-bordered {
        border-collapse: collapse;
        width: 100%;
    }
    
    .grid-bordered th, .grid-bordered td {
        border: 2px solid black;
        padding: 8px;
        text-align: center;
    }
    
    .grid-bordered th {
        background-color: #1C5E55;
        color: white;
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
            <a href="ManageUsers.aspx" class="active"><i class="fas fa-users"></i> Users</a>
            <%--<asp:LinkButton ID="btnLogout" runat="server" CssClass="btn btn-danger m-3" OnClick="btnLogout_Click">
                <i class="fas fa-sign-out-alt"></i> Logout
            </asp:LinkButton>--%>
            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-danger" OnClick="btnLogout_Click">
    <i class="fas fa-sign-out-alt"></i> Logout
</asp:LinkButton>
        </div>
        <style>.btn-report {
    background-color: #4CAF50; /* Green background */
    color: white;              /* White text */
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
}

.btn-report:hover {
    background-color: #45a049; /* Darker green on hover */
}
</style>
        <!-- Main Content -->
        <div class="content">
            <h2>Manage Users</h2>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

            <asp:Button ID="usershowreport" runat="server" Text="Report" CssClass="btn-report" OnClick="usershowreport_Click" />

            <!-- User Table -->
            <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
            <div class="table-responsive">
                <asp:GridView ID="gvUsers" runat="server" CssClass="grid-bordered"
    AutoGenerateColumns="False" DataKeyNames="Id" 
    CellPadding="4" ForeColor="#333333" Width="997px">

    <AlternatingRowStyle BackColor="White" />
    
    <Columns>
        <asp:TemplateField HeaderText="ID">
            <ItemTemplate>
                <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Name">
            <ItemTemplate>
                <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Gender">
            <ItemTemplate>
                <asp:Label ID="lblGender" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Email">
            <ItemTemplate>
                <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="City">
            <ItemTemplate>
                <asp:Label ID="lblCity" runat="server" Text='<%# Eval("City") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Address">
            <ItemTemplate>
                <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Password">
            <ItemTemplate>
                <asp:Label ID="lblPassword" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>

    <EditRowStyle BackColor="#7C6F57" />
    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#E3EAEB" />
    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F8FAFA" />
    <SortedAscendingHeaderStyle BackColor="#246B61" />
    <SortedDescendingCellStyle BackColor="#D4DFE1" />
    <SortedDescendingHeaderStyle BackColor="#15524A" />
</asp:GridView>



            </div>
        </div>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
