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

        // Insert method using string concatenation
        public void insert(string productName, int categoryId, string description, decimal price, int stock, string image)
        {
            con = startCon();
            try
            {
                string query = $"INSERT INTO product_tbl (ProductName, CategoryId, Description, Price, Stock, Image) " +
                               $"VALUES ('{productName}', {categoryId}, '{description}', {price}, {stock}, '{image}')";

                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                // Handle exception (you can log or display a message as needed)
                Console.WriteLine("Error: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        // Update method using string concatenation
        public void update(int id, string productName, int categoryId, string description, decimal price, int stock, string image)
        {
            con = startCon();
            try
            {
                string query = $"UPDATE product_tbl SET ProductName = '{productName}', CategoryId = {categoryId}, " +
                               $"Description = '{description}', Price = {price}, Stock = {stock}, Image = '{image}' " +
                               $"WHERE Id = {id}";

                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                // Handle exception (you can log or display a message as needed)
                Console.WriteLine("Error: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        // Delete method using string concatenation
        public void delete(int id)
        {
            con = startCon();
            try
            {
                string query = $"DELETE FROM product_tbl WHERE Id = {id}";

                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                // Handle exception (you can log or display a message as needed)
                Console.WriteLine("Error: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        // Fetch all products
        public DataSet filldata()
        {
            con = startCon();
            try
            {
                da = new SqlDataAdapter("SELECT * FROM product_tbl", con);
                ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
            catch (Exception ex)
            {
                // Handle exception (you can log or display a message as needed)
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
                string query = $"SELECT * FROM product_tbl WHERE Id = {id}";
                da = new SqlDataAdapter(query, con);
                ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
            catch (Exception ex)
            {
                // Handle exception (you can log or display a message as needed)
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
                // Handle exception (you can log or display a message as needed)
                Console.WriteLine("Error: " + ex.Message);
            }
            return dt;
        }
    }
}
