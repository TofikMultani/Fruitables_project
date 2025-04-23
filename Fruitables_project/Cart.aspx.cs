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
    public partial class WebForm4 : System.Web.UI.Page
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

            if (!IsPostBack)
            {
                LoadCart(); // Load cart only on the first page load
            }
        }
        private void LoadCart()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                int userId = Convert.ToInt32(Session["UserId"]);

                string query = @"SELECT ac.ProductId, ac.Quantity, p.Pro_Name, p.Pro_Price, p.Pro_Image
                                 FROM addtocart ac 
                                 JOIN add_product p ON ac.ProductId = p.Id 
                                 WHERE ac.UserId = @UserId";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserId", userId);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                dlCart.DataSource = dt;
                dlCart.DataBind();

                // Total calculation
                decimal total = 0;
                foreach (DataRow row in dt.Rows)
                {
                    total += Convert.ToInt32(row["Quantity"]) * Convert.ToDecimal(row["Pro_Price"]);
                }
                lblTotal.Text = total.ToString("0.00");
            }
        }


        protected void UserProfileButton_Click(object sender, EventArgs e)
        {
            // Fetch user profile details
            Account_class cs = new Account_class();
            DataTable dt = cs.GetUserProfile(Convert.ToInt32(Session["UserID"])); // Assuming "UserID" is stored in the session

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
        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("Chackout.aspx");
        }

        protected void rptCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                int cartId = Convert.ToInt32(e.CommandArgument);
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("DELETE FROM addtocart WHERE CartId = @CartId", con);
                    cmd.Parameters.AddWithValue("@CartId", cartId);
                    cmd.ExecuteNonQuery();
                }
                LoadCart();
            }
        }

      

        protected void dlCart_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                int productId = Convert.ToInt32(e.CommandArgument);
                int userId = Convert.ToInt32(Session["UserId"]);

                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("DELETE FROM addtocart WHERE UserId = @UserId AND ProductId = @ProductId", con);
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    cmd.Parameters.AddWithValue("@ProductId", productId);
                    cmd.ExecuteNonQuery();
                }

                LoadCart();
            }
        }

        protected void txtQuantity_TextChanged(object sender, EventArgs e)
        {
            var txtQty = (TextBox)sender;
            var item = (DataListItem)txtQty.NamingContainer;

            // Find the HiddenField inside the DataListItem
            var hfProductId = (HiddenField)item.FindControl("hfProductId");

            if (hfProductId == null)
            {
                Response.Write("<script>alert('Error: Product ID not found!');</script>");
                return;
            }

            int newQty = Convert.ToInt32(txtQty.Text);
            int userId = Convert.ToInt32(Session["UserId"]);
            int productId = Convert.ToInt32(hfProductId.Value);

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE addtocart SET Quantity = @Quantity WHERE UserId = @UserId AND ProductId = @ProductId", con);
                cmd.Parameters.AddWithValue("@Quantity", newQty);
                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.Parameters.AddWithValue("@ProductId", productId);
                cmd.ExecuteNonQuery();
            }

            LoadCart();  // Reload cart after update
        }
    }
}