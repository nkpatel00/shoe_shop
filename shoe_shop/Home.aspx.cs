using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shoe_shop
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userName = Session["user_name"]?.ToString(); // Assuming user session stores UserId

            if (!string.IsNullOrEmpty(userName))
            {
                lblName.Text = userName;
                return;
            }
        }


    }
}