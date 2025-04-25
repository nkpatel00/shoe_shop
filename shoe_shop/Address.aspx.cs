using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shoe_shop
{
    public partial class Address : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(string.IsNullOrWhiteSpace(Request.QueryString["totalAmount"]))
            {
                Response.Redirect("Cart.aspx");
            }

            string toalAmount = Request.QueryString["totalAmount"];

            lblTotalAmount.Text += toalAmount;
        }

        protected void btnProceed_Click(object sender, EventArgs e)
        {

        }
    }
}