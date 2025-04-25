using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace shoe_shop.admin
{
    public class user_ctrl
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["db"].ConnectionString;

        // Method to start a new SQL connection
        public SqlConnection startCon()
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            return con;
        }

        // Method to fetch user profile by email
        public DataTable getUserProfile(string email)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = startCon())
            {
                string query = "SELECT * FROM user_tbl WHERE Email = @Email";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
            }
            return dt;
        }

        // Method to fetch user details by ID
        public DataTable getUserById(int id)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = startCon())
            {
                string query = "SELECT * FROM user_tbl WHERE Id = @id";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
            }
            return dt;
        }
    }
}
