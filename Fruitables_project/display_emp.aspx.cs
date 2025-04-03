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
    public partial class display_emp : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand cmd;
        DataSet ds;
        PagedDataSource pg;
        int p,pid, row;
        Account_class cs;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["pid"] = 0;
            }
            getcon();
            display();
        }
        void getcon()
        {
            cs = new Account_class();
            cs.startcon();
        }

        void display()
        {
            da = new SqlDataAdapter("select * from emp_db_tbl", cs.startcon());
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
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            LinkButton3.Enabled = true;
            p += Convert.ToInt32(ViewState["pid"]) - 1;
            ViewState["pid"] = Convert.ToInt32(p);
            if (p == 0)
            {
                LinkButton3.Enabled = false;
            }
            display();
            //p = Convert.ToInt32(ViewState["pid"]);
            //if (p > 0)
            //{
            //    p--;
            //}
            //ViewState["pid"] = p;
            //display();
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
       {
            LinkButton4.Enabled = true;
            p += Convert.ToInt32(ViewState["pid"]) + 1;
            ViewState["pid"] = Convert.ToInt32(p);
            int temp = row / pg.PageSize;

            if (p == temp)
            {
                LinkButton4.Enabled = false;
            }
            display();

        }




    }
}