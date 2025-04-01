using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shoe_shop.admin
{
    public partial class AddProduct : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        DataSet ds;
        SqlDataAdapter da;
        product_ctrl pc; // Product controller

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getCon();
                getCategories();
                //LoadCategories();  // Load categories only on initial page load
                fillgrid();
            }
        }

        void getCon()
        {
            pc = new product_ctrl();
            pc.startCon();  // Ensure the connection is initialized
        }

        public void getCategories()
        {
            //getCon();  // Ensure the connection is initialized
            SqlDataAdapter da = new SqlDataAdapter("SELECT Id, CategoryName FROM category_tbl", pc.startCon());
            ds = new DataSet();
            da.Fill(ds);

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++) 
            {
                ddlCategory.Items.Add(ds.Tables[0].Rows[i][1].ToString());
            }
        }
        

        

        void fillgrid()
        {
            getCon();
            GridView1.DataSource = pc.filldata(); // Fetch products
            GridView1.DataBind();
        }

        void filltext()
        {
            getCon();
            ds = pc.selectProduct(Convert.ToInt32(ViewState["id"]));

            if (ds.Tables[0].Rows.Count > 0)
            {
                DataRow row = ds.Tables[0].Rows[0];

                txtProductName.Text = row["ProductName"].ToString();
                ddlCategory.SelectedValue = row["CategoryId"].ToString(); // ✅ Updated
                txtDescription.Text = row["Description"].ToString();
                txtPrice.Text = row["Price"].ToString();
                txtStock.Text = row["Stock"].ToString();
            }
            else
            {
                empty(); // Clear fields if no data
            }
        }

        // Adding or updating a product  
        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            getCon();

            da = new SqlDataAdapter("SELECT Id FROM category_tbl WHERE Id = '" + ddlCategory.SelectedValue + "'", pc.startCon());
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count == 0) return;

            ViewState["CategoryId"] = Convert.ToInt32(ds.Tables[0].Rows[0][0]);

            if (!decimal.TryParse(txtPrice.Text, out decimal price) || !int.TryParse(txtStock.Text, out int stock)) return;

            if (btnAddProduct.Text == "Add Product")
                pc.insert(txtProductName.Text, (int)ViewState["CategoryId"], txtDescription.Text, price, stock, "path/to/image.jpg");
            else
                pc.update(Convert.ToInt32(ViewState["id"]), txtProductName.Text, (int)ViewState["CategoryId"], txtDescription.Text, price, stock, "path/to/image.jpg");

            fillgrid();
            empty();
        }





        public void empty()
        {
            txtProductName.Text = "";
            ddlCategory.SelectedIndex = 0; // ✅ Set to first option (or adjust as needed)
            txtDescription.Text = "";
            txtPrice.Text = "";
            txtStock.Text = "";
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["id"] = id;
                btnAddProduct.Text = "Update";
                filltext();
            }
            else if (e.CommandName == "cmd_dlt")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                if (pc == null)
                {
                    pc = new product_ctrl();
                }

                try
                {
                    pc.delete(id);
                    fillgrid();
                }
                catch (Exception ex)
                {
                    // Handle error
                    Console.WriteLine("Error during delete: " + ex.Message);
                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Optional: Implement if needed
        }
    }
}
