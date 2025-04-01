using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace shoe_shop.admin
{
    public partial class Addnewadmin : System.Web.UI.Page
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
                getCon();
                fillgrid();
            }
        }

        void getCon()
        {
            ac = new admin_ctrl();
            ac.startCon();
        }

        void fillgrid()
        {
            getCon();
            GridView1.DataSource = ac.filldata();
            GridView1.DataBind();
        }

        void filltext()
        {
            getCon();
            ds = ac.select(Convert.ToInt16(ViewState["id"]));

            if (ds.Tables[0].Rows.Count > 0) // ✅ Ensure there is data
            {
                DataRow row = ds.Tables[0].Rows[0]; // ✅ Always get the first row

                txtNewUsername.Text = row["UserName"].ToString();
                txtNewPassword.Text = row["Password"].ToString();
                txtConfirmPassword.Text = row["rePassword"].ToString();
            }
            else
            {
                txtNewUsername.Text = "";
                txtNewPassword.Text = "";
                txtConfirmPassword.Text = "";
            }
        }


        protected void btnAddAdmin_Click(object sender, EventArgs e)
        {
            getCon();

            if (btnAddAdmin.Text == "Add Admin")
            {
                ac.insert(txtNewUsername.Text, txtNewPassword.Text, txtConfirmPassword.Text);

            }
            else
            {
                ac.update(Convert.ToInt16(ViewState["id"]), txtNewUsername.Text, txtNewPassword.Text, txtConfirmPassword.Text);

            }
            fillgrid();
        }

        public void empty()
        {
            txtNewUsername.Text = "";
            txtNewPassword.Text = "";
            txtConfirmPassword.Text = "";
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                int id = Convert.ToInt16(e.CommandArgument);
                ViewState["id"] = id;
                btnAddAdmin.Text = "Update";
                filltext();
            }
            else if (e.CommandName == "cmd_dlt")
            {
                int id = Convert.ToInt16(e.CommandArgument);

                if (ac == null)  // Ensure ac is initialized
                {
                    ac = new admin_ctrl();
                }

                ac.delete(id); // Call delete function
                GridView1.DataSource = ac.filldata(); // Refresh GridView
                GridView1.DataBind();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}