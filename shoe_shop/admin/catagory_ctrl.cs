using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace shoe_shop.admin
{
    public class catagory_ctrl
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string s = ConfigurationManager.ConnectionStrings["db"].ConnectionString;

        public SqlConnection startCon()
        {
            con = new SqlConnection(s);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            return con;
        }

        public void insert(string name)
        {
            con = startCon(); // Ensure connection is established
            cmd = new SqlCommand("INSERT INTO category_tbl (CategoryName) VALUES ('" + name + "')", con);
            cmd.ExecuteNonQuery();
            con.Close(); // Close the connection after execution
        }


        public void update(int id, string username)
        {
            cmd = new SqlCommand("UPDATE category_tbl SET CategoryName='" + username + "' WHERE Id='" + id + "'", con);
            cmd.ExecuteNonQuery();
        }

        public void delete(int id)
        {
            con = startCon();
            cmd = new SqlCommand("DELETE FROM category_tbl WHERE Id=" + id, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public DataSet filldata()
        {
            da = new SqlDataAdapter("SELECT * FROM category_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet selectCategory(int id)
        {
            con = startCon();
            da = new SqlDataAdapter($"SELECT * FROM category_tbl WHERE Id = {id}", con);
            ds = new DataSet();
            da.Fill(ds);
            con.Close();
            return ds;
        }



    }
}