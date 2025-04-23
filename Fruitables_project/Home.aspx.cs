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
        public partial class WebForm1 : System.Web.UI.Page
        {
            SqlConnection con;
            SqlDataAdapter da;
            SqlCommand cmd;
            DataSet ds;
            PagedDataSource pg;
            int p, pid, row;
            Account_class cs;
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    ViewState["pid"] = 0;
                }
                getcon();
                add_product_display();
                // Check if the user is authenticated
                if (Session["UserLoggedIn"] == null || !(bool)Session["UserLoggedIn"])
                {
                    Response.Redirect("Login.aspx"); // Redirect to the login page if not logged in
                }
            }
            protected void LinkButton3_Click(object sender, EventArgs e)
            {
                int currentPage = Convert.ToInt32(ViewState["pid"]);
                if (currentPage > 0)
                {
                    currentPage--;
                    ViewState["pid"] = currentPage;
                    display();
                }
            }

            protected void LinkButton4_Click(object sender, EventArgs e)
            {
                int currentPage = Convert.ToInt32(ViewState["pid"]);
                int totalPages = row / pg.PageSize;

                if (currentPage < totalPages)
                {
                    currentPage++;
                    ViewState["pid"] = currentPage;
                    display();
                }
            }
            public void display()
            {
                cs = new Account_class();
                da = new SqlDataAdapter("SELECT * FROM add_product", cs.startcon());

                ds = new DataSet();
                da.Fill(ds);

                row = ds.Tables[0].Rows.Count;
                pg = new PagedDataSource();

                pg.AllowPaging = true;
                pg.PageSize = 3;

                if (ViewState["pid"] == null)
                {
                    ViewState["pid"] = 0;
                }

                pg.CurrentPageIndex = Convert.ToInt32(ViewState["pid"]);
                pg.DataSource = ds.Tables[0].DefaultView;
                DataList1.DataSource = pg;
                DataList1.DataBind();

                // Disable Previous button on the first page
                LinkButton3.Enabled = pg.CurrentPageIndex > 0;

                // Disable Next button on the last page
                LinkButton4.Enabled = pg.CurrentPageIndex < (pg.PageCount - 1);
            }

            protected void LinkButton2_Command(object sender, CommandEventArgs e)
            {
                string temp = e.CommandArgument.ToString();

                Response.Redirect($"ShopDetails.aspx?productId={temp}");
            }

            protected void LinkButton2_Click(object sender, EventArgs e)
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
            int productId = Convert.ToInt32(e.CommandArgument);

            // Check if product is already in cart
            string checkQuery = "SELECT COUNT(*) FROM addtocart WHERE UserId = @UserId AND ProductId = @ProductId";

            cs = new Account_class();
            using (SqlConnection con = cs.startcon())
            {
                

                using (SqlCommand checkCmd = new SqlCommand(checkQuery, con))
                {
                    checkCmd.Parameters.AddWithValue("@UserId", userId);
                    checkCmd.Parameters.AddWithValue("@ProductId", productId);
                    int count = (int)checkCmd.ExecuteScalar();

                    if (count > 0)
                    {
                        // Update existing quantity
                        string updateQuery = "UPDATE addtocart SET Quantity = Quantity + 1 WHERE UserId = @UserId AND ProductId = @ProductId";
                        using (SqlCommand updateCmd = new SqlCommand(updateQuery, con))
                        {
                            updateCmd.Parameters.AddWithValue("@UserId", userId);
                            updateCmd.Parameters.AddWithValue("@ProductId", productId);
                            updateCmd.ExecuteNonQuery();
                        }
                    }
                    else
                    {
                        // Insert new item into cart
                        string insertQuery = "INSERT INTO addtocart (UserId, ProductId, Quantity) VALUES (@UserId, @ProductId, 1)";
                        using (SqlCommand insertCmd = new SqlCommand(insertQuery, con))
                        {
                            insertCmd.Parameters.AddWithValue("@UserId", userId);
                            insertCmd.Parameters.AddWithValue("@ProductId", productId);
                            insertCmd.ExecuteNonQuery();
                        }
                    }
                }

                con.Close();
            }

            // Redirect to cart page
            Response.Redirect("Cart.aspx");
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
                pg.PageSize = 3;
                pg.CurrentPageIndex = Convert.ToInt32(ViewState["pid"]);
                pg.DataSource = ds.Tables[0].DefaultView;
                DataList1.DataSource = pg;
                DataList1.DataBind();
            }
        }
    }