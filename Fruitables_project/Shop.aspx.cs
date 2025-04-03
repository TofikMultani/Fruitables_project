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
    public partial class WebForm2 : System.Web.UI.Page
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
            //(!IsPostBack)
            //{
            //    ViewState["pid"] = 0;
            //}
            getcon();
            add_product_display();
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