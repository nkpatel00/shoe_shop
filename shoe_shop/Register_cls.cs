using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

namespace shoe_shop
{
    public class Register_cls
    {
        SqlConnection con;
        SqlCommand cmd;
        DataSet ds;
        SqlDataAdapter da;
        string s = ConfigurationManager.ConnectionStrings["db"].ConnectionString;

        public SqlConnection startCon()
        {
            con = new SqlConnection(s);
            con.Open();
            return con;
        }

        public void insert(string name, string email, string mob, string date, string address, string gender, string city, string image, string pass, string repass)
        {
            startCon();
            

            cmd = new SqlCommand("insert into user_tbl (Name, Email, Mobile, Date, Address, Gender, City, Image,Password,RePassword) values ('" + name + "', '" + email + "', '" + mob + "', '" + date + "', '" + address + "', '" + gender + "', '" + city + "', '" + image + "','" + pass + "', '" + repass + "')", con);
            cmd.ExecuteNonQuery();
        }

        public void update(int id, string nm, string email, string mbl, string dt, string add, string gen, string ct, string img, string pas, string reps)
        {
            

            cmd = new SqlCommand("UPDATE user_tbl SET Name='" + nm + "', Email='" + email + "', Mobile='" + mbl + "', Date='" + dt + "', Address='" + add + "', Gender='" + gen + "', City='" + ct + "', Image='" + img + "',Password='" + pas + "', RePassword='" + reps + "' WHERE Id='" + id + "'", con);
            cmd.ExecuteNonQuery();
        }

        public void delete(int id)
        {
            con = startCon();
            cmd = new SqlCommand("DELETE FROM user_tbl WHERE Id=" + id, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }


        public DataSet filldata()
        {
            da = new SqlDataAdapter("SELECT * FROM user_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet select(int id)
        {
            con = startCon();
            da = new SqlDataAdapter($"SELECT * FROM user_tbl WHERE Id = {id}", con);
            ds = new DataSet();
            da.Fill(ds);
            con.Close();
            return ds;
        }
    }
}