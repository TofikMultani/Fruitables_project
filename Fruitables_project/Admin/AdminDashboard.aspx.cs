using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace Fruitables_project.Admin
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        Account_class cs;
        SqlCommand cmd;

        String s = ConfigurationManager.ConnectionStrings["dbconnect"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDashboardData();
                LoadAdminProfile();

                // Fetch total orders across all users
                Account_class account = new Account_class();
                int totalOrders = account.GetTotalOrders(); // New method for general orders
                lblTotalOrders.Text = "Total Orders: " + totalOrders.ToString();
            }

            // Display any query string message (optional)
            if (!IsPostBack && Request.QueryString["message"] != null)
            {
                lblMessage.Text = Request.QueryString["message"];
            }
        }


        protected void LoadAdminProfile()
        {
            try
            {
                if (Session["AdminID"] == null)
                {
                    Response.Redirect("AdminLogin.aspx");
                }

                Account_class account = new Account_class();
                DataTable dt = account.GetAdminProfile(Session["AdminID"].ToString());

                if (dt.Rows.Count > 0)
                {
                    txtName.Text = dt.Rows[0]["Name"]?.ToString() ?? "N/A";
                 //   txtName.Text = dt.Rows[0]["Name"].ToString();
                    txtGender.Text = dt.Rows[0]["Gender"].ToString();
                    txtEmail.Text = dt.Rows[0]["Email"].ToString();
                    txtCity.Text = dt.Rows[0]["City"].ToString();
                    txtAddress.Text = dt.Rows[0]["Address"].ToString();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading profile: " + ex.Message;
            }
        }

        private void LoadDashboardData()
        {
            Account_class obj = new Account_class();

            lblTotalProducts.Text = obj.GetTotalProducts().ToString();
           // lblTotalOrders.Text = obj.GetTotalOrders().ToString();
            lblTotalUsers.Text = obj.GetTotalUsers().ToString();
            // Fetch total orders and bind to label
            lblTotalOrders.Text = "Total Orders: " + obj.GetTotalOrders().ToString();
        

        // gvOrders.DataSource = obj.GetRecentOrders();
        // gvOrders.DataBind();
    }

    protected void btnSaveChanges_Click(object sender, EventArgs e)
        {
            string name = txtEditName.Text;
            string gender = ddlGender.SelectedValue;
            string email = txtEditEmail.Text;
            string city = txtEditCity.Text;
            string address = txtEditAddress.Text;
            string password = txtEditPassword.Text;

            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email))
            {
                lblMessage.Text = "Name and Email are required!";
                return;
            }

            Account_class account = new Account_class();
            account.UpdateAdminProfile(Session["AdminID"].ToString(), name, gender, email, city, address, password);

            // Update session variables to reflect new profile details
            Session["AdminName"] = name;
            Session["AdminEmail"] = email;
            Session["AdminCity"] = city;

            lblMessage.Text = "Profile updated successfully!";

            // Reload the updated profile details on the UI
            LoadAdminProfile();

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
           
                Session.Clear();
                Session.Abandon();
                Response.Redirect("AdminLogin.aspx?message=You have been logged out successfully");
            
        }
    }
}