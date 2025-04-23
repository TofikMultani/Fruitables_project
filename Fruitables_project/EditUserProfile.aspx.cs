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
namespace Fruitables_project
{
    public partial class EditUserProfile : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand cmd;
        DataSet ds;
        Account_class cs;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Fetch user data to pre-fill input fields
                Account_class cs = new Account_class();
                DataTable dt = cs.GetUserProfile(Convert.ToInt32(Session["UserId"]));
                // Session["UserID"] holds the logged-in user's ID

                if (dt.Rows.Count > 0)
                {
                    txtUserName.Text = dt.Rows[0]["Name"].ToString();
                    txtUserEmail.Text = dt.Rows[0]["Email"].ToString();
                    txtUserCity.Text = dt.Rows[0]["City"].ToString();
                    txtUserAddress.Text = dt.Rows[0]["Address"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Error fetching user data.');</script>");
                }
            }




        }

        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {
            // Ensure passwords match if provided
            if (!string.IsNullOrEmpty(txtPassword.Text) && txtPassword.Text != txtConfirmPassword.Text)
            {
                Response.Write("<script>alert('Passwords do not match!');</script>");
                return;
            }

            // Update user profile
            Account_class cs = new Account_class();
            cs.UpdateUserProfile(
                Convert.ToInt32(Session["UserID"]),
                txtUserName.Text,
                txtUserEmail.Text,
                txtUserCity.Text,
                txtUserAddress.Text,
                !string.IsNullOrEmpty(txtPassword.Text) ? txtPassword.Text : null // Pass password only if it's provided
            );

            Response.Write("<script>alert('Profile updated successfully!');</script>");
            Response.Redirect("Home.aspx");


        }


    }
}