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
     public partial class Login : System.Web.UI.Page
    { 
         SqlConnection con;
        SqlDataAdapter da;
        SqlCommand cmd;
        DataSet ds;

        Account_class cs;
        int i;
        TextBox lem = new TextBox();

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();

            if (Session["UserLoggedIn"] != null && (bool)Session["UserLoggedIn"])
            {
                Response.Redirect("Home.aspx");
            }

        }
        void getcon()
        {
            cs = new Account_class();
            cs.startcon();
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnect"].ToString());
            con.Open();
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            //getcon();
            //cmd = new SqlCommand("select count(*) from registration_tbl where email ='" + lemtxt.Text + "' and password = '" + lpwdtxt.Text + "'", cs.startcon());
            //i = Convert.ToInt16(cmd.ExecuteScalar());

            //if (i > 0)
            //{
            //    Session["UserLoggedIn"] = true;
            //    Session["email"] = lemtxt.Text; // Store email in session

            //    Response.Redirect("Home.aspx"); // Redirect after successful login
            //}
            //else
            //{
            //    Response.Write("<script>alert('Invalid Email or Password!');</script>");
            //}
            // Example login logic
            // Ensure secure parameterized query
            SqlCommand cmd = new SqlCommand("SELECT Id FROM Registration_tbl WHERE Email=@Email AND Password=@Password", cs.startcon());
            cmd.Parameters.AddWithValue("@Email", lemtxt.Text); // Assuming lemtxt is the email textbox ID
            cmd.Parameters.AddWithValue("@Password", lpwdtxt.Text); // Assuming lpwdtxt is the password textbox ID

            // Execute query and fetch user ID
            object userId = cmd.ExecuteScalar();
            if (userId != null)
            {
                Session["UserLoggedIn"] = true;
                Session["UserId"] = Convert.ToInt32(userId);  // ✅ Important for Add to Cart
                Response.Redirect("Home.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid email or password');</script>");
            }
        }
    }
}