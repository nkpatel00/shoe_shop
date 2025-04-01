using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using shoe_shop.admin;

namespace shoe_shop
{
    public partial class userProfile : System.Web.UI.Page
    {
        SqlConnection con;
        user_ctrl uc;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Email"] != null)
                {
                    getcon();
                    displayProfile(Session["Email"].ToString());
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        void getcon()
        {
            uc = new user_ctrl();
            con = uc.startCon();
        }

        void displayProfile(string email)
        {
            using (SqlConnection con = uc.startCon())
            {
                DataTable dt = uc.getUserProfile(email);
                if (dt.Rows.Count > 0)
                {
                    lblname.Text = dt.Rows[0]["Name"].ToString();
                    lblemail.Text = dt.Rows[0]["Email"].ToString();
                    lblmobile.Text = dt.Rows[0]["Mobile"].ToString();
                    lbladd.Text = dt.Rows[0]["Address"].ToString();
                    lblgender.Text = dt.Rows[0]["Gender"].ToString();
                    lblcity.Text = dt.Rows[0]["City"].ToString();

                    // Ensure image is not null before assigning
                    imgProfile.ImageUrl = dt.Rows[0]["Image"] != DBNull.Value ? dt.Rows[0]["Image"].ToString() : "default-profile.png";
                }
                else
                {
                    // Handle case where no user data is found
                    lblname.Text = "Not Found";
                }
            }
        }
    }
}
