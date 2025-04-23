using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;


namespace Fruitables_project.Admin
{
    public partial class AdminOrderManagement : System.Web.UI.Page
    {
        private CrystalDecisions.CrystalReports.Engine.ReportDocument cr = new CrystalDecisions.CrystalReports.Engine.ReportDocument();

        static string Crypath = "";
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        Account_class cs;
        DataTable dt;
        SqlCommand cmd;

        String s = ConfigurationManager.ConnectionStrings["dbconnect"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check admin session on every load, not just postback
            if (Session["AdminID"] == null)
            {
                // Redirect with a message (optional)
                Response.Redirect("AdminLogin.aspx?message=Please login to access this page.");
                return; // Stop further processing
            }

            if (!IsPostBack)
            {
                LoadOrders();
                PanelOrderDetails.Visible = false;
            }


        }
        private void LoadOrders(string statusFilter = "")
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                string query = @"SELECT o.OrderId, r.Name AS UserName, o.TotalAmount, o.Status, o.OrderDate
                                 FROM orders o
                                 INNER JOIN Registration_tbl r ON o.UserId = r.Id";

                if (!string.IsNullOrEmpty(statusFilter))
                {
                    query += " WHERE o.Status = @Status";
                }

                query += " ORDER BY o.OrderDate DESC";

                SqlCommand cmd = new SqlCommand(query, con);
                if (!string.IsNullOrEmpty(statusFilter))
                {
                    cmd.Parameters.AddWithValue("@Status", statusFilter);
                }

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewOrders.DataSource = dt;
                GridViewOrders.DataBind();
            }
        }

        private void ShowOrderDetails(string orderId)
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                string query = @"SELECT od.ProductName, od.ProductImage, od.Price, od.Quantity, (od.Price * od.Quantity) AS Total
                                 FROM orderdetails od WHERE od.OrderId = @OrderId";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@OrderId", orderId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridViewOrderDetails.DataSource = dt;
                GridViewOrderDetails.DataBind();
                lblSelectedOrderId.Text = orderId;
                PanelOrderDetails.Visible = true;
            }
        }






        protected void GridViewOrders_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            string orderId = e.CommandArgument.ToString();

            if (e.CommandName == "ViewDetails")
            {
                ShowOrderDetails(orderId);
            }
            else if (e.CommandName == "UpdateStatus")
            {
                GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                DropDownList ddlStatus = (DropDownList)row.FindControl("ddlStatus");

                if (ddlStatus != null)
                {
                    // Update status in the database
                    using (SqlConnection con = new SqlConnection(s))
                    {
                        string updateQuery = "UPDATE orders SET Status = @Status WHERE OrderId = @OrderId";
                        SqlCommand cmd = new SqlCommand(updateQuery, con);
                        cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue); // Get selected value
                        cmd.Parameters.AddWithValue("@OrderId", orderId);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                    LoadOrders(); // Reload orders after update
                }
            }

        }

        protected void btnCloseDetails_Click(object sender, EventArgs e)
        {
            PanelOrderDetails.Visible = false;

        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("AdminLogin.aspx");

        }

        protected void btnShowPending_Click(object sender, EventArgs e)
        {
            LoadOrders("Pending");
        }

        protected void btnShowConfirmed_Click(object sender, EventArgs e)
        {
            LoadOrders("Confirmed");
        }

        protected void GridViewOrders_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddlStatus = (DropDownList)e.Row.FindControl("ddlStatus");
                if (ddlStatus != null)
                {
                    string status = DataBinder.Eval(e.Row.DataItem, "Status").ToString();
                    ddlStatus.SelectedValue = status; // Set the selected value based on the current status
                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("AdminLogin.aspx");
        }

        protected void report_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            // Initialize the connection using the string
            SqlConnection con = new SqlConnection(connStr);

            da = new SqlDataAdapter("select * from orders ", con);
            ds = new DataSet();
            da.Fill(ds);
            string xml = @"D:/TOFIK ASP.NET/Fruitables_project/Fruitables_project/Fruitables_project/Admin/orders.xml";
            ds.WriteXmlSchema(xml);


            Crypath = @"D:/TOFIK ASP.NET/Fruitables_project/Fruitables_project/Fruitables_project/Admin/ordersReport.rpt";
            cr.Load(Crypath);
            cr.SetDataSource(ds);
            cr.Database.Tables[0].SetDataSource(ds);
            cr.Refresh();
            CrystalReportViewer1.ReportSource = cr;

            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "OrdersReport");


        }
    }
}
