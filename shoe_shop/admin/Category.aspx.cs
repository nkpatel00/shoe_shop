using shoe_shop.admin;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace shoe_shop.admin
{
    public partial class Category : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        DataSet ds;
        SqlDataAdapter da;
        catagory_ctrl cc;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getcon();
                fillgrid();
            }
        }

        void getcon()
        {
            cc = new catagory_ctrl();
            con = cc.startCon();
        }
        void fillgrid()
        {
            getcon();
            GridView1.DataSource = cc.filldata();
            GridView1.DataBind();
        }

        void filltext()
        {
            getcon();
            ds = cc.selectCategory(Convert.ToInt16(ViewState["id"]));

            if (ds.Tables[0].Rows.Count > 0) // ✅ Ensure there is data
            {
                DataRow row = ds.Tables[0].Rows[0]; //  Always get the first row

                txtcat.Text = row["CategoryName"].ToString();
            }
            else
            {
                txtcat.Text = "";
            }
        }

        protected void btnaddcat_Click(object sender, EventArgs e)
        {
            getcon();

            if (btnaddcat.Text == "Submit")
            {
                cc.insert(txtcat.Text);

            }
            else
            {
                cc.update(Convert.ToInt16(ViewState["id"]), txtcat.Text);

            }
            fillgrid();
        }
        public void empty()
        {
            txtcat.Text = "";
        }

        protected void GridView1_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                int id = Convert.ToInt16(e.CommandArgument);
                ViewState["id"] = id;
                btnaddcat.Text = "Update";
                filltext();
            }
            else if (e.CommandName == "cmd_dlt")
            {
                int id = Convert.ToInt16(e.CommandArgument);

                if (cc == null)  // Ensure ac is initialized
                {
                    cc = new catagory_ctrl();
                }

                cc.delete(id); // Call delete function
                GridView1.DataSource = cc.filldata(); // Refresh GridView
                GridView1.DataBind();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
