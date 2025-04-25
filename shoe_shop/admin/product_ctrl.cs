using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace shoe_shop.admin
{
    public class product_ctrl
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string s = ConfigurationManager.ConnectionStrings["db"].ConnectionString;

        // Method to start the connection
        public SqlConnection startCon()
        {
            con = new SqlConnection(s);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            return con;
        }

        // Insert method without AddWithValue
        public void insert(string productName, int categoryId, string description, string price, string stock, string image)
        {
            con = startCon();
            cmd = new SqlCommand($"INSERT INTO product_tbl (ProductName, CategoryId, Description, Price, Stock, Image) " +
                                 $"VALUES ('{productName}', {categoryId}, '{description}', {price}, {stock}, '{image}')", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void update(int id, string productName, string categoryId, string description, string price, string stock, string image)
        {
            cmd = new SqlCommand($"UPDATE product_tbl SET ProductName = '{productName}', CategoryId = {categoryId}, " +
                                 $"Description = '{description}', Price = {price}, Stock = {stock}, Image = '{image}' " +
                                 $"WHERE Id = {id}", con);
            cmd.ExecuteNonQuery();
        }

        public void delete(int id)
        {
            con = startCon();
            cmd = new SqlCommand($"DELETE FROM product_tbl WHERE Id = {id}", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        // Fetch all products
        public DataSet filldata()
        {
            con = startCon();
            try
            {
                da = new SqlDataAdapter("SELECT p.*, c.CategoryName AS CatName FROM product_tbl p JOIN category_tbl c ON p.CategoryId = c.Id;", con);

                ds = new DataSet();
                da.Fill(ds);
                return ds;

            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
                return null;
            }
        }

        // Fetch data for a particular category
        public DataSet snowProduct()
        {
            con = startCon();
            try
            {
                da = new SqlDataAdapter("SELECT p.*, cc.CategoryName AS catName FROM product_tbl p JOIN category_tbl cc ON p.CategoryId = cc.Id WHERE cc.CategoryName = 'snow';", con);

                ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
                return null;
            }
        }

        // Fetch a specific product by Id
        public DataSet selectProduct(int id)
        {
            con = startCon();
            try
            {
                da = new SqlDataAdapter($"SELECT * FROM product_tbl WHERE Id = {id}", con);
                ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
                return null;
            }
            finally
            {
                con.Close();
            }
        }

        // Fetch categories for the DropDownList
        public DataTable getCategories()
        {
            con = startCon();
            SqlDataAdapter da = new SqlDataAdapter("SELECT Id, CategoryName FROM category_tbl", con);
            DataTable dt = new DataTable();
            try
            {
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }
            return dt;
        }
    }
}