using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace shoe_shop.admin
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        DataSet ds;
        SqlDataAdapter da;
        admin_ctrl ac;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               getcon(); 
            }
        }

        void getcon()
        {
            ac = new admin_ctrl();
            con = ac.startCon();
        }

        

        protected void btnManageAdmins_Click(object sender, EventArgs e)
        {
            Response.Redirect("Addnewadmin.aspx");
        }

        protected void btnManageUsers_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageUser.aspx");
        }

        protected void btnManageCategories_Click(object sender, EventArgs e)
        {
            Response.Redirect("Category.aspx");
        }

        protected void btnManageProducts_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddProduct.aspx");
        }

        protected void btnGoBackToAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin.aspx"); // Change this to the correct admin panel page
        }
    }
}
