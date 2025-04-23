using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Fruitables_project.Admin
{
    public partial class ManageProducts : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        Account_class cs;
        SqlCommand cmd;
        int id;
        string fnm;

        String s = ConfigurationManager.ConnectionStrings["dbconnect"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Authentication check: Only Admin should access this page
            if (Session["AdminID"] == null)
            {
                Response.Redirect("AdminLogin.aspx?message=Please login to access this page.");
            }
            if (!IsPostBack)
            {
                ViewState["pid"] = 0;
            }
            getcon();
            uploading();
            addprofillgrid();

        }
        void getcon()
        {
            cs = new Account_class();
            cs.startcon();
        }
        void addprofillgrid()
        {
            cs = new Account_class();
            getcon();
            GridView1.DataSource = cs.addproductfilldata();
            GridView1.DataBind();
        }

        void uploading()
        {
            if (fileProImage.HasFile)
            {
                fnm = "../Image/" + fileProImage.FileName;
                fileProImage.SaveAs(Server.MapPath(fnm));
            }
        }

        void empty()
        {
            txtProName.Text = "";
            txtProDescription.Text = "";
            txtProPrice.Text = "";

            btnAddProduct.Text = "Add Product";
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            if (btnAddProduct.Text == "Add Product")
            {
                uploading();
                getcon();
                cs.add_product_insert(txtProName.Text, txtProDescription.Text, txtProPrice.Text, fnm);
                addprofillgrid();
                empty();
            }
            else
            {
                cs = new Account_class();
                getcon();
                cs.add_product_update(Convert.ToInt16(ViewState["id"]), txtProName.Text, txtProDescription.Text, txtProPrice.Text);
                addprofillgrid();
                empty();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                int id = Convert.ToInt16(e.CommandArgument);
                ViewState["id"] = id;
                btnAddProduct.Text = "Update Product";
                filltext();//paring
            }
            else if (e.CommandName == "cmd_del")  // Handle Delete Command
            {
                getcon();
                int id = Convert.ToInt16(e.CommandArgument);
                ViewState["id"] = id;
                cs.add_product_delete(id);
                addprofillgrid();
            }
        }

        void filltext()
        {
            cs = new Account_class();
            getcon();
            ds = new DataSet();
            ds = cs.add_product_select(Convert.ToInt16(ViewState["id"]));
            txtProName.Text = ds.Tables[0].Rows[0][1].ToString();
            txtProDescription.Text = ds.Tables[0].Rows[0][2].ToString();
            txtProPrice.Text = ds.Tables[0].Rows[0][3].ToString();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("AdminLogin.aspx?message=You have been logged out successfully");
        }
    }
}