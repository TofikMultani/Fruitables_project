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
    public partial class WebForm5 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand cmd;
        DataSet ds;
        Account_class cs;

        string connStr = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is logged in
            if (Session["UserLoggedIn"] == null || !(bool)Session["UserLoggedIn"])
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadCart();
                //LoadUserDetails();
            }

        }
        // ✅ Load cart details and display in the checkout page
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

                dlCheckout.DataSource = dt;
                dlCheckout.DataBind();

                decimal total = 0;
                foreach (DataRow row in dt.Rows)
                {
                    total += Convert.ToInt32(row["Quantity"]) * Convert.ToDecimal(row["Pro_Price"]);
                }
                lblTotal.Text = total.ToString("0.00");
            }
        }


        // ✅ Load user's saved details (Name, Address, Pincode)
        //private void LoadUserDetails()
        //{
        //    using (SqlConnection con = new SqlConnection(connStr))
        //    {
        //        con.Open();
        //        int userId = Convert.ToInt32(Session["UserId"]);

        //        string query = "SELECT Name, Address, PinCode FROM Registration_tbl WHERE Id = @UserId";
        //        SqlCommand cmd = new SqlCommand(query, con);
        //        cmd.Parameters.AddWithValue("@UserId", userId);
        //        SqlDataReader reader = cmd.ExecuteReader();

        //        if (reader.Read())
        //        {
        //            txtName.Text = reader["Name"].ToString();
        //            txtAddress.Text = reader["Address"].ToString();
        //            txtPinCode.Text = reader["PinCode"].ToString();
        //        }
        //    }
        //}

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


        // ✅ Confirm Order and Save Details
        protected void btnConfirmOrder_Click(object sender, EventArgs e)
        {
            int userId = Convert.ToInt32(Session["UserId"]);
            string name = txtName.Text;
            string address = txtAddress.Text;
            string pinCode = txtPinCode.Text;
            decimal totalAmount = Convert.ToDecimal(lblTotal.Text);

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                SqlTransaction transaction = con.BeginTransaction();

                try
                {
                    // ✅ Insert into orders table
                    string orderQuery = "INSERT INTO orders (UserId, Name, Address, PinCode, TotalAmount, OrderDate) OUTPUT INSERTED.OrderId VALUES (@UserId, @Name, @Address, @PinCode, @TotalAmount, GETDATE())";
                    SqlCommand orderCmd = new SqlCommand(orderQuery, con, transaction);
                    orderCmd.Parameters.AddWithValue("@UserId", userId);
                    orderCmd.Parameters.AddWithValue("@Name", name);
                    orderCmd.Parameters.AddWithValue("@Address", address);
                    orderCmd.Parameters.AddWithValue("@PinCode", pinCode);
                    orderCmd.Parameters.AddWithValue("@TotalAmount", totalAmount);
                    int orderId = (int)orderCmd.ExecuteScalar();

                    // ✅ Insert order details
                    string detailsQuery = @"INSERT INTO orderdetails (OrderId, ProductId, ProductName, ProductImage, Price, Quantity, Total) 
                                            SELECT @OrderId, ac.ProductId, p.Pro_Name, p.Pro_Image, p.Pro_Price, ac.Quantity, (ac.Quantity * p.Pro_Price) 
                                            FROM addtocart ac 
                                            JOIN add_product p ON ac.ProductId = p.Id 
                                            WHERE ac.UserId = @UserId";
                    SqlCommand detailsCmd = new SqlCommand(detailsQuery, con, transaction);
                    detailsCmd.Parameters.AddWithValue("@OrderId", orderId);
                    detailsCmd.Parameters.AddWithValue("@UserId", userId);
                    detailsCmd.ExecuteNonQuery();

                    // ✅ Clear the cart
                    SqlCommand deleteCartCmd = new SqlCommand("DELETE FROM addtocart WHERE UserId = @UserId", con, transaction);
                    deleteCartCmd.Parameters.AddWithValue("@UserId", userId);
                    deleteCartCmd.ExecuteNonQuery();

                    // ✅ Commit transaction
                    transaction.Commit();

                    // ✅ Redirect after successful order placement
                    Response.Redirect("OrderSuccess.aspx");
                }
                catch
                {
                    // ✅ Rollback only if the transaction is active
                    if (transaction.Connection != null)
                    {
                        transaction.Rollback();
                    }

                    Response.Write("<script>alert('Order failed. Try again.');</script>");
                }
            }

        }
    }
}