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
    public partial class Contact2_3T1 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand cmd;
        DataSet ds;

        string fnm;
        string[] hb = new string[3];
        string h1, h2, h3;

        Contact2_3T_class cs; //class Object

       // String s = ConfigurationManager.ConnectionStrings["db"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            uploading();
           // fillgrid();
            // Check if the user is authenticated
            if (Session["UserLoggedIn"] == null || !(bool)Session["UserLoggedIn"])
            {
                Response.Redirect("Login.aspx"); // Redirect to the login page if not logged in
            }
        }
        void getcon()
        {
            cs = new Contact2_3T_class();
            cs.startcon();
        }

        protected void cmd_edt(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                int id = Convert.ToInt16(e.CommandArgument);
                ViewState["id"] = id;
                Button1.Text = "Update";
                filltext();//paring
            }
            else if (e.CommandName == "cmd_del")  // Handle Delete Command
            {
                getcon();
                int id = Convert.ToInt16(e.CommandArgument);
                ViewState["id"] = id;
                cs.delete(id);
             //   fillgrid();
            }
        }

        //void fillgrid()
        //{
        //    cs = new Contact2_3T_class();
        //    getcon();
        //    GridView1.DataSource = cs.filldata();
        //    GridView1.DataBind();
        //}

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Button1.Text == "Submit")
            {
                getcon();
                uploading();
                Hobbie();
                for (int i = 0; i < 1; i++)
                {
                    if (hb[i] == "Cricket")
                    {
                        h1 = "Cricket";
                        i++;
                    }
                    else
                    {
                        h1 = "Null";
                        i++;
                    }

                    if (hb[i] == "FootBall")
                    {
                        h2 = "FootBall";
                        i++;
                    }
                    else
                    {
                        h2 = "Null";
                        i++;
                    }

                    if (hb[i] == "Running")
                    {
                        h3 = "Running";
                        i++;
                    }
                    else
                    {
                        h3 = "Null";
                    }
                }
                cs.insert(txtunm.Text, rdbgen.Text, h1, h2, h3, drpct.SelectedValue, txtadd.Text, fnm);
               // fillgrid();
            }
            else
            {
                cs = new Contact2_3T_class();
                getcon();
                Hobbie();

                for (int i = 0; i < 1; i++)
                {
                    if (hb[i] == "Cricket")
                    {
                        h1 = "Cricket";
                        i++;
                    }
                    else
                    {
                        h1 = "Null";
                        i++;
                    }

                    if (hb[i] == "FootBall")
                    {
                        h2 = "FootBall";
                        i++;
                    }
                    else
                    {
                        h2 = "Null";
                        i++;
                    }

                    if (hb[i] == "Running")
                    {
                        h3 = "Running";
                        i++;
                    }
                    else
                    {
                        h3 = "Null";
                    }
                }
                cs.update(Convert.ToInt16(ViewState["id"]), txtunm.Text, rdbgen.Text, h1, h2, h3, drpct.SelectedValue, txtadd.Text);
                //fillgrid();
            }
        }

        void filltext()
        {
            cs = new Contact2_3T_class();
            getcon();
            ds = new DataSet();
            ds = cs.select(Convert.ToInt16(ViewState["id"]));
            txtunm.Text = ds.Tables[0].Rows[0][1].ToString();
            txtadd.Text = ds.Tables[0].Rows[0][7].ToString();
            drpct.SelectedValue = ds.Tables[0].Rows[0][6].ToString();


            if (ds.Tables[0].Rows[0][2].ToString() == "Male")
            {
                rdbgen.Items[0].Selected = true;
            }
            if (ds.Tables[0].Rows[0][2].ToString() == "Female")
            {
                rdbgen.Items[1].Selected = true;
            }


            if (ds.Tables[0].Rows[0][3].ToString() == "Cricket")
            {
                chkhb.Items[0].Selected = true;
            }
            else
            {
                chkhb.Items[0].Selected = false;
            }
            if (ds.Tables[0].Rows[0][4].ToString() == "FootBall")
            {
                chkhb.Items[1].Selected = true;
            }
            else
            {
                chkhb.Items[1].Selected = false;
            }
            if (ds.Tables[0].Rows[0][5].ToString() == "Running")
            {
                chkhb.Items[2].Selected = true;
            }
            else
            {
                chkhb.Items[2].Selected = false;
            }
        }

        protected void UserProfileButton_Click(object sender, EventArgs e)
        {
            // Fetch user profile details
            Account_class cs = new Account_class();
            DataTable dt = cs.GetUserProfile(Convert.ToInt32(Session["UserId"]));
            // Assuming "UserID" is stored in the session

            if (dt.Rows.Count > 0)
            {
                lblUserName.Text = "Name: " + dt.Rows[0]["Name"].ToString();
                lblUserEmail.Text = "Email: " + dt.Rows[0]["Email"].ToString();
                lblUserCity.Text = "City: " + dt.Rows[0]["City"].ToString();
                lblUserAddress.Text = "Address: " + dt.Rows[0]["Address"].ToString();

                ProfilePopup.Visible = true; // Show the popup
            }
            else
            {
                Response.Write("<script>alert('User data not found');</script>");
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditUserProfile.aspx"); // Redirect to edit profile page
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Clear session and redirect to login page
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        void uploading()
        {
            if (fldimg.HasFile)
            {
                fnm = "Image/" + fldimg.FileName;
                fldimg.SaveAs(Server.MapPath(fnm));
            }
        }
        void Hobbie()
        {
            for (int i = 0; i < hb.Length; i++)
            {
                if (chkhb.Items[i].Selected == true)
                {
                    hb[i] = chkhb.Items[i].Text;
                }
            }
        }
    }
}