using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using shoe_shop.admin;


namespace shoe_shop
{
    public partial class snow : System.Web.UI.Page
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
            da = new SqlDataAdapter("SELECT * FROM product_tbl where  ", con);
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

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {

        }
    }
}