using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace shoe_shop
{
    public partial class Login1 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        Register_cls rc;

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
        }

        void getcon()
        {
            rc = new Register_cls();
            con = rc.startCon();
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            getcon();

            string query = "SELECT Name FROM user_tbl WHERE Email = @Email AND Password = @Password";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Email", txtmailusr.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", txtpassusr.Text.Trim());

            object result = cmd.ExecuteScalar();

            if (result != null) 
            {
                Session["user_email"] = txtmailusr.Text.Trim();
                Session["user_name"] = result.ToString(); // Store username in session

                Response.Redirect("Home.aspx"); // Redirect to home page
            }
            else
            {
                lblMessage.Text = "Invalid Email or Password.";
            }

            con.Close();
        }
    }
}
