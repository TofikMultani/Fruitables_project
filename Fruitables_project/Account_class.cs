    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Data.SqlClient;
    using System.Data;
    using System.IO;
    using System.Configuration;
    using System.Web.UI;

    namespace Fruitables_project
    {
        public class Account_class
        {
            SqlConnection con;
            SqlDataAdapter da;
            SqlCommand cmd;
            DataSet ds;
            int i;
        
            String s = ConfigurationManager.ConnectionStrings["dbconnect"].ToString();
     
            public SqlConnection startcon()
            {
                con = new SqlConnection(s);
                con.Open();
                return con;
            }


            public int VerifyRegister(string un, string em)
            {
                int i;
                startcon();
                cmd = new SqlCommand("SELECT COUNT(*) FROM Registration_tbl WHERE Name='" + un + "' OR Email='" + em + "';", con);
                i = Convert.ToInt32(cmd.ExecuteScalar());

                return i;
            }

            public void insert(string rnm,string rgen,string reml, string rcty, string raddr,string rpass)
            {
                startcon();
                cmd = new SqlCommand("insert into Registration_tbl(Name,Gender,Email,City,Address,Password)"+ "values('"+rnm+"','"+rgen +"','" + reml+"','" +rcty+"','" + raddr+"','" +rpass +"')", con);
                cmd.ExecuteNonQuery();
            }

      
        public DataSet addproductfilldata()
            {
                da = new SqlDataAdapter("select * from add_product", con);
                ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
            public DataSet add_product_select(int id)
            {
            da = new SqlDataAdapter("select Pro_Name, Pro_Description, Pro_Price, REPLACE(Pro_Image, '../', '') AS ImageMain from add_product where Id='" + id + "'", con); ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
            public void add_product_insert(String pnm,string pdes,string pprice, string pimg)
            {
                cmd = new SqlCommand("insert into add_product(Pro_Name,Pro_Description,Pro_Price,Pro_Image)"+ "values('" + pnm+"','"+pdes+"','"+pprice+"','"+pimg+"')", con);
                cmd.ExecuteNonQuery();
            }
            public void add_product_update(int id,string pnm,string pdes,string pprice)
            {
                cmd = new SqlCommand("update add_product set Pro_Name = '" + pnm + "', Pro_Description = '"+ pdes +"' , Pro_Price = '"+ pprice + "' where Id='" + id + "' ", con);
                cmd.ExecuteNonQuery();
            }

            public DataSet add_product_delete(int id)
            {
                da = new SqlDataAdapter("delete from add_product where Id='" + id + "'", con);
                ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
        //Admin Registration
        public int AdminVerifyRegister(string username, string email)
        {
            startcon();
            cmd = new SqlCommand("SELECT COUNT(*) FROM AdminRegister WHERE Name='"+username +"' OR Email='"+email +"'", con);
            int count = Convert.ToInt32(cmd.ExecuteScalar());    
            con.Close();
            return count;
        }
       

        public void AdminInsertReg(string name, string gender, string email, string city, string address, string password)
        {
            startcon();
            cmd = new SqlCommand("INSERT INTO AdminRegister (Name, Gender, Email, City, Address, Password)"+" VALUES ('"+name+"','"+gender+"','"+email+"','"+city+"','"+address+"','"+password+"')", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public int AdminVerifyLogin(string email, string password)
        {
            startcon();
            cmd = new SqlCommand("SELECT ID FROM AdminRegister WHERE Email='"+email+"' AND Password='"+password+"'", con);
            object result = cmd.ExecuteScalar();
            con.Close();

            return result != null ? Convert.ToInt32(result) : -1;
        }

        //AdminDashBoard
        public int GetTotalProducts()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                string query = "SELECT COUNT(*) FROM add_product";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                return (int)cmd.ExecuteScalar();
            }
        }

        //public int GetTotalOrders()
        //{
        //    using (SqlConnection con = new SqlConnection(s))
        //    {
        //        string query = "SELECT COUNT(*) FROM Orders";
        //        SqlCommand cmd = new SqlCommand(query, con);
        //        con.Open();
        //        return (int)cmd.ExecuteScalar();
        //    }
        //}

        public int GetTotalUsers()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                string query = "SELECT COUNT(*) FROM Registration_tbl";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                return (int)cmd.ExecuteScalar();
            }
        }

        //public DataTable GetRecentOrders()
        //{
        //    using (SqlConnection con = new SqlConnection(s))
        //    {
        //        string query = "SELECT TOP 5 OrderID, CustomerName, TotalAmount, OrderDate FROM Orders ORDER BY OrderDate DESC";
        //        SqlDataAdapter da = new SqlDataAdapter(query, con);
        //        DataTable dt = new DataTable();
        //        da.Fill(dt);
        //        return dt;
        //    }
        //}



        //Update Profile
        public void UpdateAdminProfile(string adminId, string name, string gender, string email, string city, string address, string password)
        {
            startcon();
            cmd = new SqlCommand("UPDATE AdminRegister SET Name='"+name+"', Gender='"+gender+"', Email='"+email+"', City='"+city+"', Address='"+address+"', Password='"+password+"' WHERE ID= '"+adminId+"'", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public DataTable GetAdminProfile(string adminId)
        {
            startcon();
            cmd = new SqlCommand("SELECT Name, Gender, Email, City, Address FROM AdminRegister WHERE ID='"+adminId+"'", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            con.Close();
            return dt;
        }
        public void AdminLogout(string adminId)
        {
            // Perform any logout-related tracking if necessary (e.g., update 'LastLogoutTime' in the DB)
            startcon();
            cmd = new SqlCommand("UPDATE AdminRegister SET LastLogoutTime=GETDATE() WHERE ID='"+adminId+"'", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
      


    }
}