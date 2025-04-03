using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Configuration;

namespace Fruitables_project
{
    public class Contact2_3T_class
    {
        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand cmd;
        DataSet ds;

        String s = ConfigurationManager.ConnectionStrings["dbconnect"].ToString();

        public void startcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        public void insert(string nm, string gen, string h1, string h2, string h3, string ct, string add, string img)
        {
            cmd = new SqlCommand("insert into emp_db_tbl(Name,Gender,Hobbie1,Hobbie2,Hobbie3,City,Address,Image)" + "values('"+nm+"','"+gen+"','"+h1+ "','" + h2 + "','" + h3 + "','" + ct + "','" + add + "','" + img + "')", con);
            cmd.ExecuteNonQuery();
        }
        public void update(int id, string nm, string gen, string h1, string h2, string h3, string ct, string add)
        {
            cmd = new SqlCommand("update emp_db_tbl set Name='" + nm + "',Gender='" + gen + "',Hobbie1='" + h1 + "',Hobbie2='" + h2 + "',Hobbie3='" + h3 + "',City='" + ct + "',Address='" + add + "' where Id='" + id + "'", con);
            cmd.ExecuteNonQuery();
        }

        public DataSet filldata()
        {
            da = new SqlDataAdapter("select * from emp_db_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet select(int id)
        {
            da = new SqlDataAdapter("select * from emp_db_tbl where Id='" + id + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet delete(int id)
        {
            da = new SqlDataAdapter("delete from emp_db_tbl where Id='" + id + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }
}