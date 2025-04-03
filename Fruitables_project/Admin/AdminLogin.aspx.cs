using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fruitables_project.Admin
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        Account_class cs;
        protected void Page_Load(object sender, EventArgs e)
        {
            cs = new Account_class();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            {
                string email = txtEmail.Text.Trim();
                string password = txtPassword.Text.Trim();

                if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
                {
                    lblMessage.Text = "Please enter both email and password.";
                    return;
                }

                int adminId = cs.AdminVerifyLogin(email, password);

                if (adminId > 0)
                {
                    Session["AdminID"] = adminId;
                    Session["AdminEmail"] = email;
                    Response.Redirect("AdminDashboard.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid email or password!";
                }
            }
        }
    }
}