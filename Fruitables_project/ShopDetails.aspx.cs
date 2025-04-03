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
    public partial class WebForm3 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand cmd;
        DataSet ds;
        PagedDataSource pg;
        Account_class cs;
        protected void Page_Load(object sender, EventArgs e)
        {
            cs = new Account_class();
            String temp = Request.QueryString["productId"];

            da = new SqlDataAdapter("select * from add_product where Id='"+ temp +"'", cs.startcon());
            ds = new DataSet();
            da.Fill(ds);

            DataList1.DataSource = ds;
            DataList1.DataBind();
        }
    }
}