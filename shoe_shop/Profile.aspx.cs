using System;
using System.Web.UI;

namespace shoe_shop
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user_id"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    lblName.Text = Session["user_name"].ToString();
                    lblEmail.Text = Session["user_email"].ToString();
                    lblMobile1.Text = Session["user_mobile"].ToString();
                    lblAddress1.Text = Session["user_address"].ToString();
                    lblGender1.Text = Session["user_gender"].ToString();
                    lblCity1.Text = Session["user_city"].ToString();
                    lblDate1.Text = Session["user_date"].ToString();
                    string img = Session["user_image"]?.ToString();
                    if (!string.IsNullOrEmpty(img))
                    {
                        imgProfile.ImageUrl = ResolveUrl("~/img/" + img);
                    }
                    else
                    {
                        imgProfile.ImageUrl = ResolveUrl("~/img/default.png"); // fallback image
                    }

                }
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            // Redirect to an edit page if needed
            Response.Redirect("Register.aspx");
        }
    }
}
