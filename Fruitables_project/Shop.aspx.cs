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
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;


namespace Fruitables_project
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        private CrystalDecisions.CrystalReports.Engine.ReportDocument cr = new CrystalDecisions.CrystalReports.Engine.ReportDocument();

        static string Crypath = "";

        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand cmd;
        DataSet ds;
        PagedDataSource pg;
        int p, pid, row;
        Account_class cs;
        protected void Page_Load(object sender, EventArgs e)
        {
            //(!IsPostBack)
            //{
            //    ViewState["pid"] = 0;
            //}
            getcon();
            add_product_display();
            // Check if the user is authenticated
            if (Session["UserLoggedIn"] == null || !(bool)Session["UserLoggedIn"])
            {
                Response.Redirect("Login.aspx"); // Redirect to the login page if not logged in
            }
            if (!IsPostBack)
            {
                LoadProducts();
            }
        }
        private void LoadProducts()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString))
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("SELECT Id, Pro_Name, Pro_Price, Pro_Image FROM add_product", con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                DataList1.DataSource = dt;  // Ensure 'dlProducts' matches your DataList/GridView ID
                DataList1.DataBind();
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

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            int userId = Convert.ToInt32(Session["UserId"]);

            // ✅ Debugging: Print CommandArgument
            Response.Write("<script>alert('CommandArgument: " + e.CommandArgument + "');</script>");

            // ✅ Prevent crash by validating CommandArgument
            if (e.CommandArgument == null || string.IsNullOrEmpty(e.CommandArgument.ToString()))
            {
                Response.Write("<script>alert('Product ID is missing.');</script>");
                return;
            }

            int productId;
            if (!int.TryParse(e.CommandArgument.ToString(), out productId))
            {
                Response.Write("<script>alert('Invalid Product ID');</script>");
                return;
            }

            // ✅ Now productId is safe to use
            string checkQuery = "SELECT COUNT(*) FROM addtocart WHERE UserId = @UserId AND ProductId = @ProductId";

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString))
            {
                con.Open();
                using (SqlCommand checkCmd = new SqlCommand(checkQuery, con))
                {
                    checkCmd.Parameters.AddWithValue("@UserId", userId);
                    checkCmd.Parameters.AddWithValue("@ProductId", productId);
                    int count = Convert.ToInt32(checkCmd.ExecuteScalar());

                    if (count > 0)
                    {
                        Response.Write("<script>alert('Product already in cart');</script>");
                    }
                    else
                    {
                        string insertQuery = "INSERT INTO addtocart (UserId, ProductId, Quantity) VALUES (@UserId, @ProductId, 1)";
                        using (SqlCommand insertCmd = new SqlCommand(insertQuery, con))
                        {
                            insertCmd.Parameters.AddWithValue("@UserId", userId);
                            insertCmd.Parameters.AddWithValue("@ProductId", productId);
                            insertCmd.ExecuteNonQuery();
                        }
                        Response.Write("<script>alert('Product added to cart');</script>");
                    }
                }
            }
        }

        protected void ReportShop_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            // Initialize the connection using the string
            SqlConnection con = new SqlConnection(connStr);

            da = new SqlDataAdapter("select * from add_product ", con);
            ds = new DataSet();
            da.Fill(ds);
            string xml = @"D:/TOFIK ASP.NET/Fruitables_project/Fruitables_project/Fruitables_project/shop.xml";
            ds.WriteXmlSchema(xml);



            Crypath = @"D:/TOFIK ASP.NET/Fruitables_project/Fruitables_project/Fruitables_project/ShopReport.rpt";
            cr.Load(Crypath);
            cr.SetDataSource(ds);
            cr.Database.Tables[0].SetDataSource(ds);
            cr.Refresh();
            CrystalReportViewer1.ReportSource = cr;

            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Report");


        }

        protected void CrystalReportViewer1_Init(object sender, EventArgs e)
        {

        }

        void getcon()
        {
            cs = new Account_class();
            cs.startcon();
        }
        void add_product_display()
        {
            da = new SqlDataAdapter("select * from add_product", cs.startcon());
            ds = new DataSet();
            da.Fill(ds);
            row = ds.Tables[0].Rows.Count;
            pg = new PagedDataSource();
            pg.AllowPaging = true;
           // pg.PageSize = 3;
            //pg.CurrentPageIndex = Convert.ToInt32(ViewState["pid"]);
            pg.DataSource = ds.Tables[0].DefaultView;
            DataList1.DataSource = pg;
            DataList1.DataBind();
        }

    }
}