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
        String filename, image;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getCon();
                getCategories();  //  Load categories first
                fillgrid();
            }
        }

        void getCon()
        {
            pc = new product_ctrl();
            con = pc.startCon();  // Ensure the connection is initialized
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
            da = new SqlDataAdapter("SELECT * FROM product_tbl", con);
            ds = new DataSet();
            ds = pc.filldata();

            GridView1.DataSource = ds; // Fetch products
            GridView1.DataBind();
        }

        void uploadImage()
        {

            if (fileUploadImage.HasFile)
            {
                // Path to Images/Product_Images folder from Administrator
                string folderPath = Server.MapPath("~/images/Product_Images/");

                // Check and create folder if it doesn't exist
                if (!System.IO.Directory.Exists(folderPath))
                {
                    System.IO.Directory.CreateDirectory(folderPath);
                }

                // Save image to Product_Images folder
                filename = "images/Product_Images/" + fileUploadImage.FileName;
                fileUploadImage.SaveAs(System.IO.Path.Combine(folderPath, fileUploadImage.FileName));

                // ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Image Uploaded Successfully!');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please select a product image!');", true);
            }
        }

        void filltext()
        {
            getCon();
            ds = pc.selectProduct(Convert.ToInt32(ViewState["id"]));

            if (ds.Tables[0].Rows.Count > 0)
            {
                DataRow row = ds.Tables[0].Rows[0];

                txtProductName.Text = row["ProductName"].ToString();

                // Ensure categories are loaded before setting SelectedValue
                getCategories();

                // Check if the category exists before setting the selected value
                string categoryId = row["CategoryId"].ToString();
                if (ddlCategory.Items.FindByValue(categoryId) != null)
                {
                    ddlCategory.SelectedValue = categoryId;
                }
                else
                {
                    ddlCategory.SelectedIndex = 0; // Default to first option if not found
                }

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
            uploadImage();

            if (btnAddProduct.Text == "Submit")
            {
                pc = new product_ctrl();
                pc.insert(txtProductName.Text, Convert.ToInt32(ViewState["Cat_id"]), txtDescription.Text, txtPrice.Text, txtStock.Text, filename);
                lblMessage.Text = "Product added successfully!";
                empty();
            }
            else
            {
                int id = Convert.ToInt32(ViewState["id"]);
                pc.update(id, txtProductName.Text, ddlCategory.SelectedValue, txtDescription.Text, txtPrice.Text, txtStock.Text, filename);
                lblMessage.Text = "Product updated successfully!";
                btnAddProduct.Text = "Update";
                empty();
            }

            Session["user"] = txtProductName.Text;
            fillgrid();
            con.Close();
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

        protected void ddlCategory_SelectedIndexChanged1(object sender, EventArgs e)
        {
            getCon();

            if (ddlCategory.SelectedValue == "Select Category")
            {
                ViewState["Cat_id"] = null; // Do not assign an invalid ID
                return;
            }

            da = new SqlDataAdapter("SELECT Id FROM category_tbl WHERE CategoryName = @CategoryName", con);
            da.SelectCommand.Parameters.AddWithValue("@CategoryName", ddlCategory.SelectedValue);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                ViewState["Cat_id"] = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                int id = Convert.ToInt16(e.CommandArgument);
                ViewState["id"] = id;
                btnAddProduct.Text = "Update";
                filltext();
            }
            else if (e.CommandName == "cmd_dlt")
            {
                int id = Convert.ToInt16(e.CommandArgument);

                if (pc == null)  // Ensure ac is initialized
                {
                    pc = new product_ctrl();
                }

                pc.delete(id); // Call delete function
                GridView1.DataSource = pc.filldata(); // Refresh GridView
                GridView1.DataBind();
            }
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }
}