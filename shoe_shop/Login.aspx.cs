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
            if (Session["user_id"] != null)
            {
                Response.Redirect("Home.aspx");
            }
        }


        void getcon()
        {
            rc = new Register_cls();
            con = rc.startCon();
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            getcon();

            string query = @"SELECT Id, Name, Mobile, Date, Address, Gender, City, Image 
                     FROM user_tbl 
                     WHERE Email = @Email AND Password = @Password";

            using (cmd = new SqlCommand(query, con))
            {
                cmd.CommandType = CommandType.Text;

                SqlParameter emailParam = new SqlParameter("@Email", SqlDbType.NVarChar, 100);
                SqlParameter passParam = new SqlParameter("@Password", SqlDbType.NVarChar, 100);

                emailParam.Value = txtmailusr.Text.Trim();
                passParam.Value = txtpassusr.Text.Trim();

                cmd.Parameters.Add(emailParam);
                cmd.Parameters.Add(passParam);

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        Session["user_id"] = reader["Id"].ToString();
                        Session["user_name"] = reader["Name"].ToString();
                        Session["user_email"] = txtmailusr.Text.Trim();
                        Session["user_mobile"] = reader["Mobile"].ToString();
                        Session["user_date"] = reader["Date"].ToString();
                        Session["user_address"] = reader["Address"].ToString();
                        Session["user_gender"] = reader["Gender"].ToString();
                        Session["user_city"] = reader["City"].ToString();
                        Session["user_image"] = reader["Image"].ToString();

                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Invalid Email or Password.";
                    }
                }
            }

            con.Close();
        }

    }
}
