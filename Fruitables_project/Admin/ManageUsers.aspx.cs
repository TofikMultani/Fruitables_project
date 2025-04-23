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

    public partial class ManageUsers : System.Web.UI.Page
    {

        private CrystalDecisions.CrystalReports.Engine.ReportDocument cr = new CrystalDecisions.CrystalReports.Engine.ReportDocument();

        static string Crypath = "";
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        Account_class cs;
        SqlCommand cmd;
        

       // Account_class account = new Account_class();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            // Authentication check: Only Admin should access this page
            if (Session["AdminID"] == null)
            {
                Response.Redirect("AdminLogin.aspx?message=Please login to access this page.");
            }
            if (cs == null)  // Check and initialize cs if null
            {
                cs = new Account_class();
            }
            if (!IsPostBack)
            {
                LoadUserData();
            }
        }
        private void LoadUserData()
        {
            if (cs == null)
            {
                cs = new Account_class();
            }

            DataTable dt = cs.GetAllUsers();
            gvUsers.DataSource = dt;
            gvUsers.DataBind();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("AdminLogin.aspx?message=You have been logged out successfully");
        }

        protected void usershowreport_Click(object sender, EventArgs e)
        {

            string connStr = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            // Initialize the connection using the string
            SqlConnection con = new SqlConnection(connStr);

            da = new SqlDataAdapter("select * from Registration_tbl ", con);
            ds = new DataSet();
            da.Fill(ds);
            string xml = @"D:/TOFIK ASP.NET/Fruitables_project/Fruitables_project/Fruitables_project/Admin/UserShowRepoertAdmin.xml";
            ds.WriteXmlSchema(xml);

            Crypath = @"D:/TOFIK ASP.NET/Fruitables_project/Fruitables_project/Fruitables_project/Admin/UserShowRepoertAdmin.rpt";
            cr.Load(Crypath);
            cr.SetDataSource(ds);
            cr.Database.Tables[0].SetDataSource(ds);
            cr.Refresh();
            CrystalReportViewer1.ReportSource = cr;

            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Report");


        }
    }
}