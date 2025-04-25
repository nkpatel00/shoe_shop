using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace shoe_shop
{
    public class Main_Class
    {
        SqlConnection con;
        SqlCommand cmd;
        DataSet ds;
        SqlDataAdapter da;
        string s = ConfigurationManager.ConnectionStrings["db"].ConnectionString;


        // 🔹 Constructor: Initializes DB connection
        public Main_Class()
        {
            string conString = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            con = new SqlConnection(conString);
        }

        public SqlConnection startCon()
        {
            con = new SqlConnection(s);
            con.Open();
            return con;
        }

        // 🔹 Method to fetch product details based on productId
        public DataSet getProduct(int productId)
        {
            DataSet ds = new DataSet();

            try
            {
                string query = @"
                    SELECT p.*, c.CategoryName 
                    FROM product_tbl p
                    INNER JOIN category_tbl c ON p.CategoryId = c.Id
                    WHERE p.Id = @ProductId";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@ProductId", productId);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error fetching product details: " + ex.Message);
            }

            return ds;
        }
    }
}
