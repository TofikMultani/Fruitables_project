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
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand cmd;
        DataSet ds;

        Account_class cs;
        int i;
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();

        }

        
            void getcon()
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnect"].ToString());
                con.Open();
            }

        
        void empty()
        {
            rtxtunm.Text = "";
            rrdb.ClearSelection();
            rem.Text = "";
            rct.Text = "";
            radd.Text = "";
            rpwd.Text = "";
            RegisterButton.Text = "Register";
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        { 
          
        }

        protected void RegisterButton_Click1(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string gender = rrdb.SelectedValue;

            // Ensure all fields are filled
            if (string.IsNullOrEmpty(rtxtunm.Text) || string.IsNullOrEmpty(rem.Text) ||
                string.IsNullOrEmpty(rct.Text) || string.IsNullOrEmpty(radd.Text) ||
                string.IsNullOrEmpty(rpwd.Text) || string.IsNullOrEmpty(gender))
            {
                Response.Write("<script>alert('Please fill all fields');</script>");
                return;
            }

            if (string.IsNullOrEmpty(rcpwd.Text) || rpwd.Text != rcpwd.Text)
            {
                Response.Write("<script>alert('Passwords do not match!');</script>");
                return;
            }

            cs = new Account_class();

            int i = cs.VerifyRegister(rtxtunm.Text, rem.Text);
            if (i > 0)
            {
                Response.Write("<script>alert('Username or email address is already registered!');</script>");
                return;
            }

            // Insert new user
            cs.insert(rtxtunm.Text, rrdb.SelectedValue, rem.Text, rct.Text, radd.Text, rpwd.Text);
            cs = null;
            empty();

            Response.Redirect("Login.aspx");
        }
    }
}