using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shoe_shop
{
    public partial class Profile : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        Register_cls rc;
        PagedDataSource pg;
        int p, row;

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            display();
        }

        void getcon()
        {
            rc = new Register_cls();
            con = rc.startCon();
        }

        void display()
        {
            da = new SqlDataAdapter("SELECT * FROM user_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            row = ds.Tables[0].Rows.Count;
            pg = new PagedDataSource();
            pg.AllowPaging = true;
            pg.PageSize = 2;
            pg.DataSource = ds.Tables[0].DefaultView;
            pg.CurrentPageIndex = Convert.ToInt32(ViewState["pid"]);
            DataList1.DataSource = pg;
            DataList1.DataBind();
        }

        protected void LinkButton3_Click(object sender, EventArgs e)//PREVIOUS
        {
            LinkButton3.Enabled = true;
            p += Convert.ToInt32(ViewState["pid"]) - 1;
            ViewState["pid"] = Convert.ToInt32(p);
            if (p == 0)
            {
                LinkButton3.Enabled = false;
            }
            display();
        }

        protected void DataList1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void LinkButton4_Click(object sender, EventArgs e)//NEXT
        {
            LinkButton3.Enabled = true;
            p += Convert.ToInt32(ViewState["pid"]) + 1;
            ViewState["pid"] = Convert.ToInt32(p);
            int temp = row / pg.PageSize;
            if (p == temp)
            {
                LinkButton4.Enabled = false;
            }
            display();
        }
    }
}
