using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Fruitables_project
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand cmd;
        DataSet ds;
        String s = ConfigurationManager.ConnectionStrings["dbconnect"].ToString();

        string fnm;
        String h1, h2, h3;
        String[] hb = new string[3];
        protected void Page_Load(object sender, EventArgs e)
        {
            
            fillgrid();
            // Check if the user is authenticated
            if (Session["UserLoggedIn"] == null || !(bool)Session["UserLoggedIn"])
            {
                Response.Redirect("Login.aspx"); // Redirect to the login page if not logged in
            }
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void uploading()
        {
            if (fldimg.HasFile)
            {
                fnm = "img/" + fldimg.FileName;
                fldimg.SaveAs(Server.MapPath(fnm));
            }
        }
        public DataSet select(int Id)
        {
            getcon();
            da = new SqlDataAdapter("Select * from emp_db_tbl where Id='" + Id + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        void empty()
        {
            txtunm.Text = "";
            txtadd.Text = "";
            rdbgen.ClearSelection();
            drpct.ClearSelection();
            chkhb.ClearSelection();

            Button1.Text = "submit";
        }
        void filltext()
        {
            getcon();
            ds = new DataSet();
            ds = select(Convert.ToInt16(ViewState["Id"]));

            txtunm.Text = ds.Tables[0].Rows[0][1].ToString();
            txtadd.Text = ds.Tables[0].Rows[0][7].ToString();
            rdbgen.Text = ds.Tables[0].Rows[0][2].ToString();
            drpct.SelectedValue = ds.Tables[0].Rows[0][6].ToString();


            string[] hobbies = {
                ds.Tables[0].Rows[0]["Hobbie1"].ToString(),
                ds.Tables[0].Rows[0]["Hobbie2"].ToString(),
                ds.Tables[0].Rows[0]["Hobbie3"].ToString()
            };

            foreach (ListItem item in chkhb.Items)
            {
                item.Selected = hobbies.Contains(item.Text);
            }

        }
        void fillgrid()
        {
            getcon();
            da = new SqlDataAdapter("select * from emp_db_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void cmd_edt(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                int Id = Convert.ToInt16(e.CommandArgument);
                ViewState["Id"] = Id;
                filltext();
                Button1.Text = "Update";
            }
            //delete Part in else if part s 
            else if (e.CommandName == "cmd_del")
            {
                int Id = Convert.ToInt32(e.CommandArgument);
                ViewState["Id"] = Id;  // Ensure ViewState holds the correct Id
                getcon();
                cmd = new SqlCommand("delete from emp_db_tbl where Id='" + ViewState["Id"] + "'", con);
                cmd.ExecuteNonQuery();
                fillgrid();
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
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Button1.Text == "submit")
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
                cmd = new SqlCommand("insert into emp_db_tbl(Name,Gender,Hobbie1,Hobbie2,Hobbie3,City,Address,Image)values('" + txtunm.Text + "','" + rdbgen.Text + "','" + h1 + "','" + h2 + "' , '" + h3 + "','" + drpct.SelectedValue + "','" + txtadd.Text + "','" + fnm + "')", con);
                cmd.ExecuteNonQuery();
                fillgrid();
                empty();
            }
            //Upadte Code in else part
            else
            {
                if (Button1.Text == "Update")
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
                    cmd = new SqlCommand("update emp_db_tbl set Name='" + txtunm.Text + "',Gender='" + rdbgen.Text + "',Hobbie1='" + h1 + "' ,Hobbie2='" + h2 + "',Hobbie3='" + h3 + "' ,City='" + drpct.SelectedValue + "',Address='" + txtadd.Text + "' where Id='" + ViewState["Id"] + "'  ", con);
                    cmd.ExecuteNonQuery();
                    empty();
                    fillgrid();
                }
            }
        }
    }
}