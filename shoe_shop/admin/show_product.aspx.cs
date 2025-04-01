using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using shoe_shop.admin;

namespace shoe_shop
{
    public partial class show_product : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        PagedDataSource pg;
        product_ctrl pc;
        int p, row;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getcon();
                display();
            }
        }

        void getcon()
        {
            pc = new product_ctrl();
            con = pc.startCon();
        }

        void display()
        {
            da = new SqlDataAdapter("SELECT * FROM product_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            row = ds.Tables[0].Rows.Count;
            pg = new PagedDataSource();
            pg.AllowPaging = true;
            pg.PageSize = 6;
            pg.DataSource = ds.Tables[0].DefaultView;
            pg.CurrentPageIndex = Convert.ToInt32(ViewState["pid"] ?? "0");
            DataList1.DataSource = pg;
            DataList1.DataBind();

            // Enable/Disable navigation buttons
            LinkButton3.Enabled = pg.CurrentPageIndex > 0;
            LinkButton4.Enabled = pg.CurrentPageIndex < pg.PageCount - 1;
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            int currentPage = Convert.ToInt32(ViewState["pid"] ?? "0");
            if (currentPage > 0)
            {
                ViewState["pid"] = --currentPage;
                display();
            }
        }

        protected void NextPage_Click(object sender, EventArgs e)
        {
            int currentPage = Convert.ToInt32(ViewState["pid"] ?? "0");
            if (currentPage < row / pg.PageSize)
            {
                ViewState["pid"] = ++currentPage;
                display();
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "EditProduct")
            {
                int productId = Convert.ToInt32(e.CommandArgument);
                Response.Redirect($"EditProduct.aspx?id={productId}");
            }
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }
}