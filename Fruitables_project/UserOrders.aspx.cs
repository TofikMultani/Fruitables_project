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
    public partial class UserOrders : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand cmd;
        DataSet ds;
        Account_class cs;

        string connStr = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                // Check if the user is authenticated
                if (Session["UserLoggedIn"] == null || !(bool)Session["UserLoggedIn"])
                {
                    Response.Redirect("Login.aspx"); // Redirect to the login page if not logged in
                }

                LoadUserOrders();
            }
        }
        private void LoadUserOrders()
        {
            int userId = Convert.ToInt32(Session["userid"]);

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"SELECT o.OrderId, o.OrderDate, o.TotalAmount, o.Status, o.Name, o.Address, o.PinCode,
                                        od.ProductId, od.ProductName, od.ProductImage, od.Price, od.Quantity, od.Total
                                 FROM orders o
                                 INNER JOIN orderdetails od ON o.OrderId = od.OrderId
                                 WHERE o.UserId = @UserId
                                 ORDER BY o.OrderDate DESC";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserId", userId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                var groupedOrders = dt.AsEnumerable()
                    .GroupBy(r => r.Field<int>("OrderId"))
                    .Select(g => new
                    {
                        OrderId = g.Key,
                        OrderDate = g.First().Field<DateTime>("OrderDate"),
                        TotalAmount = g.First().Field<decimal>("TotalAmount"),
                        Status = g.First().Field<string>("Status"),
                        Name = g.First().Field<string>("Name"),
                        Address = g.First().Field<string>("Address"),
                        PinCode = g.First().Field<string>("PinCode"),
                        Items = g.Select(item => new
                        {
                            ProductId = item.Field<int>("ProductId"),
                            ProductName = item.Field<string>("ProductName"),
                            ProductImage = item.Field<string>("ProductImage"),
                            Price = item.Field<decimal>("Price"),
                            Quantity = item.Field<int>("Quantity"),
                            Total = item.Field<decimal>("Total")
                        }).ToList()
                    }).ToList();

                rptMyOrders.DataSource = groupedOrders;
                rptMyOrders.DataBind();
            }
        }
    }
}