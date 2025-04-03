    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Data.SqlClient;
    using System.Data;
    using System.IO;
    using System.Configuration;


    namespace Fruitables_project.Admin
    {
        public partial class AdminRegister : System.Web.UI.Page
        {
            SqlConnection con;
            SqlDataAdapter da;
            SqlCommand cmd;
            DataSet ds;

            Account_class cs;
            protected void Page_Load(object sender, EventArgs e)
            {
                cs = new Account_class();
            }

            protected void RegisterButton_Click(object sender, EventArgs e)
            {
                if (string.IsNullOrEmpty(txtName.Text) || string.IsNullOrEmpty(txtEmail.Text) ||
                    string.IsNullOrEmpty(txtCity.Text) || string.IsNullOrEmpty(txtAddress.Text) ||
                    string.IsNullOrEmpty(txtPassword.Text) || string.IsNullOrEmpty(txtConfirmPassword.Text) ||
                    ddlGender.SelectedValue == "")
                {
                    lblMessage.Text = "Please fill all fields.";
                    return;
                }

                if (txtPassword.Text != txtConfirmPassword.Text)
                {
                    lblMessage.Text = "Passwords do not match!";
                    return;
                }

                // Check if user already exists
                int existingUser = cs.AdminVerifyRegister(txtName.Text, txtEmail.Text);
                if (existingUser > 0)
                {
                    lblMessage.Text = "Username or email already registered!";
                    return;
                }

                // Insert into DB
                cs.AdminInsertReg(txtName.Text, ddlGender.SelectedValue, txtEmail.Text, txtCity.Text, txtAddress.Text, txtPassword.Text);

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Registration successful!";
            }
        }
    }