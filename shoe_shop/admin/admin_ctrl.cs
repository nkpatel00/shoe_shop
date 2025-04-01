using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace shoe_shop.admin
{
    public class admin_ctrl
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string s = ConfigurationManager.ConnectionStrings["db"].ConnectionString;

        public SqlConnection startCon() 
        {
            con = new SqlConnection(s);
            con.Open();
            return con;
        }

        public void insert(string name, string pass, string repass)
        {
            cmd = new SqlCommand("INSERT INTO Admin_tbl (UserName, Password, RePassword) VALUES ('" + name + "', '" + pass + "', '" + repass + "')", con);
            cmd.ExecuteNonQuery();
        }


        public void update(int id, string username, string password, string repassword)
        {
            cmd = new SqlCommand("UPDATE Admin_tbl SET UserName='" + username + "', Password='" + password + "', rePassword='" + repassword + "' WHERE Id='" + id + "'", con);
            cmd.ExecuteNonQuery();
        }

        public void delete(int id)
        {
            con = startCon();  
            cmd = new SqlCommand("DELETE FROM Admin_tbl WHERE Id=" + id, con);
            cmd.ExecuteNonQuery();
            con.Close();  
        }




        public DataSet filldata()
        {
            da = new SqlDataAdapter("SELECT * FROM Admin_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet select(int id)
        {
            da = new SqlDataAdapter("SELECT * FROM Admin_tbl WHERE Id = @id", con);
            da.SelectCommand.Parameters.AddWithValue("@id", id);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }




    }
}
