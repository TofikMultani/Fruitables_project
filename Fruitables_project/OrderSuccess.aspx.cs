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
    public partial class OrderSuccess : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand cmd;
        DataSet ds;
        Account_class cs;

        string connStr = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is authenticated
            if (Session["UserLoggedIn"] == null || !(bool)Session["UserLoggedIn"])
            {
                Response.Redirect("Login.aspx"); // Redirect to the login page if not logged in
            }
        }

        protected void btnViewOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserOrders.aspx");
        }

        protected void btnGoHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}