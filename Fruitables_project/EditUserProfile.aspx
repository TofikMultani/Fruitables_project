<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditUserProfile.aspx.cs" Inherits="Fruitables_project.EditUserProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <style>
    /* Main container for profile edit form */
    .profile-edit-container {
        max-width: 450px; /* Compact and centered form */
        margin: 40px auto;
        padding: 25px;
        background: #b2c3a5;
        border-radius: 10px;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        text-align: center;
        font-family: 'Arial', sans-serif;
    }

    /* Title styling */
    .profile-title {
        font-size: 22px;
        font-weight: bold;
        color: #333;
        margin-bottom: 20px;
    }

    /* Input fields styling */
    .input-field {
        width: 100%;
        padding: 14px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 6px;
        font-size: 15px;
        box-sizing: border-box;
    }

    .input-field:focus {
        border-color: #007BFF;
        outline: none;
        box-shadow: 0px 0px 5px rgba(0, 123, 255, 0.5);
    }

    /* Button styling */
    .save-button {
        width: 100%;
        padding: 12px;
        margin-top: 15px;
        background-color: #30cb11;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .save-button:hover {
        background-color: #0056b3;
    }
</style>
         <div class="profile-edit-container">
    <h2 class="profile-title">Edit User Profile</h2>
    
    <asp:TextBox ID="txtUserName" runat="server" Placeholder="Full Name" CssClass="input-field" />
    <asp:TextBox ID="txtUserEmail" runat="server" Placeholder="Email Address" CssClass="input-field" />
    <asp:TextBox ID="txtUserCity" runat="server" Placeholder="City" CssClass="input-field" />
    <asp:TextBox ID="txtUserAddress" runat="server" Placeholder="Address" CssClass="input-field" />
    
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Placeholder="New Password" CssClass="input-field" />
    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" Placeholder="Confirm Password" CssClass="input-field" />

    <asp:Button ID="btnSaveChanges" runat="server" Text="Save Changes" OnClick="btnSaveChanges_Click" CssClass="save-button" />
</div>


        </div>
    </form>
</body>
</html>
