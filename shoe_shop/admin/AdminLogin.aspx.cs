using shoe_shop.admin;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace shoe_shop
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        admin_ctrl ac;

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
        }

        void getcon()
        {
            ac = new admin_ctrl();
            con = ac.startCon();
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            getcon();

            string query = "SELECT COUNT(*) FROM admin_tbl WHERE UserName='" + txtUsername.Text.Trim() + "' AND Password='" + txtPassword.Text.Trim() + "'";

            cmd = new SqlCommand(query, con);

            int i = Convert.ToInt32(cmd.ExecuteScalar());

            if (i > 0)
            {
                Session["admin_user"] = txtUsername.Text.Trim();
                Response.Redirect("Admin.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid Username or Password.";
            }

            con.Close();
        }

       
    }
}
