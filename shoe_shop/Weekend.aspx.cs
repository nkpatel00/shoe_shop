using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using shoe_shop.admin;

namespace shoe_shop
{
    public partial class Weekend : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        PagedDataSource pg;
        product_ctrl pc;
        int row;

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
            try
            {
                // Ensure proper type conversion in SQL query
                string query = @"SELECT p.*, cc.CategoryName AS catName 
                                 FROM product_tbl p 
                                 JOIN category_tbl cc 
                                 ON TRY_CAST(p.CategoryId AS INT) = cc.Id 
                                 WHERE cc.CategoryName = 'Weekend';";

                da = new SqlDataAdapter(query, con);
                ds = new DataSet();
                da.Fill(ds);
                row = ds.Tables[0].Rows.Count;

                pg = new PagedDataSource
                {
                    AllowPaging = true,
                    PageSize = 20, // 6 products per page
                    DataSource = ds.Tables[0].DefaultView,
                    CurrentPageIndex = Convert.ToInt32(ViewState["pid"] ?? "0")
                };

                DataList1.DataSource = pg;
                DataList1.DataBind();

                // Enable/Disable navigation buttons based on page index
                LinkButton3.Enabled = pg.CurrentPageIndex > 0;
                LinkButton4.Enabled = pg.CurrentPageIndex < (row / pg.PageSize);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
            }
        }


        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void PrevPage_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(ViewState["pid"]) > 0)
            {
                ViewState["pid"] = Convert.ToInt32(ViewState["pid"]) - 1;
                display();
            }
        }

        protected void NextPage_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(ViewState["pid"]) < (row / pg.PageSize))
            {
                ViewState["pid"] = Convert.ToInt32(ViewState["pid"]) + 1;
                display();
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "EditProduct")
            {
                string productId = e.CommandArgument.ToString();
                Response.Redirect($"show_product.aspx?ProId={productId}");
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = (LinkButton)sender;
                string productId = btn.CommandArgument;

                if (!string.IsNullOrEmpty(productId))
                {
                    Response.Redirect($"show_product.aspx?ProId={productId}");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Product ID is missing!');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
            }
        }
    }
}