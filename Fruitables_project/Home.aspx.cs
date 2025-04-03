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