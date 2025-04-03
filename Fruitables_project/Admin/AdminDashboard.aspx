<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Fruitables_project.Admin.AdminDashboard" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Admin Dashboard</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>

    <style>
        /* Sidebar styles */
        .sidebar {
            height: 100vh; /* Full height of the viewport */
            width: 250px;
            position: fixed;
            background: #343a40;
            padding-top: 20px;
            overflow-y: auto; /* Enable vertical scrolling */
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

        /* Profile Popup styles */
        #profilePopup {
            display: none;
            position: fixed;
            top: 20%;
            left: 30%;
            width: 40%;
            background: #fff;
            border: 1px solid #ddd;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            z-index: 999;
            padding: 15px;
            border-radius: 5px;
        }
        #profileEditPopup {
            display: none;
            position: fixed;
            top: 10%; /* Adjusted to leave vertical space */
            left: 30%;
            width: 40%;
            max-height: 80%; /* Limit height for scrollbar */
            overflow-y: auto; /* Enable vertical scrolling */
            background: #fff;
            border: 1px solid #ddd;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            z-index: 999;
            padding: 15px;
            border-radius: 5px;
        }
        .popup-header {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 15px;
        }
        .action-buttons {
            margin-top: 15px;
            display: flex;
            justify-content: space-between;
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
            <a href="ManageOrders.aspx"><i class="fas fa-shopping-cart"></i> Orders</a>
            <a href="ManageUsers.aspx"><i class="fas fa-users"></i> Users</a>
            <%--<a href="Logout.aspx"><i class="fas fa-sign-out-alt"></i> Logout</a>--%>
            <!-- Add Logout link here -->
            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-danger" OnClick="btnLogout_Click">
    <i class="fas fa-sign-out-alt"></i> Logout
</asp:LinkButton>
            <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label> <!-- Message for logout feedback -->

        </div>

        <!-- Main Content -->
        <div class="content">
            <!-- Profile Button -->
            <div class="d-flex justify-content-end">
                <button class="btn btn-primary" type="button" onclick="toggleProfilePopup()">
                    <i class="fas fa-user-circle"></i> Profile
                </button>
            </div>

            <!-- Profile Popup -->
            
            <div id="profilePopup">
                 <h5 class="popup-header">Profile Details</h5>
                 <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                <h4>Welcome, <%= Session["AdminName"] %></h4>
                        <p><strong>Name:</strong> <asp:Label ID="txtName" runat="server"></asp:Label></p>
                        <p><strong>Gender:</strong> <asp:Label ID="txtGender" runat="server"></asp:Label></p>
                        <p><strong>Email:</strong> <asp:Label ID="txtEmail" runat="server"></asp:Label></p>
                        <p><strong>City:</strong> <asp:Label ID="txtCity" runat="server"></asp:Label></p>
                        <p><strong>Address:</strong> <asp:Label ID="txtAddress" runat="server"></asp:Label></p>
                    <div class="action-buttons">
                    <%--<button type="button" class="btn btn-danger" onclick="logout()">Logout</button>--%>
                    <asp:Button ID="btnLogout" class="btn btn-danger" runat="server" Text="LogOut" OnClick="btnLogout_Click" />
                    <button type="button" class="btn btn-secondary" onclick="toggleProfileEditPopup()">Edit</button>
                </div>
            </div>

            <!-- Profile Edit Popup -->
            <div id="profileEditPopup">
                <h5 class="popup-header">Edit Profile</h5>
                <div class="mb-3">
                    <label for="txtEditName" class="form-label">Name</label>
                    <asp:TextBox ID="txtEditName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtEditGender" class="form-label">Gender</label>
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-select">
                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                        <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label for="txtEditEmail" class="form-label">Email</label>
                    <asp:TextBox ID="txtEditEmail" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtEditCity" class="form-label">City</label>
                    <asp:TextBox ID="txtEditCity" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtEditAddress" class="form-label">Address</label>
                    <asp:TextBox ID="txtEditAddress" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtEditPassword" class="form-label">Password</label>
                    <asp:TextBox ID="txtEditPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtConfirmPassword" class="form-label">Confirm Password</label>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="action-buttons">
                    <asp:Button ID="btnSaveChanges" runat="server" CssClass="btn btn-success" Text="Save Changes" OnClientClick="return validatePassword();" OnClick="btnSaveChanges_Click" />
                    <button type="button" class="btn btn-secondary" onclick="toggleProfileEditPopup()">Cancel</button>
                </div>
            </div>

            <!-- Dashboard Section -->
            <h2>Admin Dashboard</h2>
             <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label> <!-- Message for general feedback -->
    <!-- Dashboard cards and metrics -->

            <div class="row">
    <div class="col-md-4">
        <div class="card p-3">
            <h5>Total Products</h5>
            <asp:Label ID="lblTotalProducts" runat="server" Text="0"></asp:Label>
        </div>
    </div>

     <div class="col-md-4">
        <div class="card p-3">
            <h5>Total Orders</h5>
            <asp:Label ID="lblTotalOrders" runat="server" Text="0"></asp:Label>
        </div>
    </div>

    <div class="col-md-4">
        <div class="card p-3">
            <h5>Total Users</h5>
            <asp:Label ID="lblTotalUsers" runat="server" Text="0"></asp:Label>
        </div>
    </div>
</div>

        </div>
    </form>

    <!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- JavaScript for Popups and Validation -->
<script>
    // Toggle the Profile Popup visibility
    function toggleProfilePopup() {
        const profilePopup = document.getElementById('profilePopup');
        profilePopup.style.display = profilePopup.style.display === 'none' ? 'block' : 'none';
    }

    // Toggle the Edit Profile Popup visibility
    function toggleProfileEditPopup() {
        const profileEditPopup = document.getElementById('profileEditPopup');
        profileEditPopup.style.display = profileEditPopup.style.display === 'none' ? 'block' : 'none';
    }

    // Password Validation
    function validatePassword() {
        // Get password and confirm password field values
        const password = document.getElementById('<%= txtEditPassword.ClientID %>').value;
        const confirmPassword = document.getElementById('<%= txtConfirmPassword.ClientID %>').value;

        // Check if both match
        if (password !== confirmPassword) {
            alert("Password and Confirm Password do not match.");
            return false; // Prevent form submission
        }
        return true; // Allow form submission
    }

    // Logout functionality
    function logout() {
        // Inform the user they're logging out
        alert("You have been logged out.");
        // Redirect the user to a logout page (optional)
        window.location.href = "Logout.aspx";
    }
</script>