using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shoe_shop
{
    public partial class show_product1 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        DataSet ds;
        SqlDataAdapter da;
        Main_Class mc = new Main_Class();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getcon();
                if (!string.IsNullOrEmpty(Request.QueryString["ProId"]))
                {
                    ViewState["Pid"] = Request.QueryString["ProId"];
                    displayDetails();
                }
                else
                {
                    showAlertAndRedirect("Product ID Not Found!", "Home.aspx");
                }
            }
        }
        void getcon()
        {
            mc = new Main_Class();
            con = mc.startCon();
        }

        // 🔹 Fetch product details based on ProId
        public void displayDetails()
        {
            try
            {
                int productId;
                if (int.TryParse(ViewState["Pid"].ToString(), out productId))
                {
                    ds = mc.getProduct(productId);

                    if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        DataRow row = ds.Tables[0].Rows[0];

                        mainImage.ImageUrl = row["Image"].ToString();
                        lblName.Text = row["ProductName"].ToString();
                        lblCategory.Text = row["CategoryName"].ToString();
                        lblOrigin.Text = row["Origin"]?.ToString() ?? "Unknown";
                        lblDiscount.Text = row["Discount"]?.ToString() + " off";
                        lblOri_Price.Text = " ₹" + row["OriginalPrice"]?.ToString() + "/ Kg";
                        lblSell_Price.Text = " ₹" + row["SellingPrice"]?.ToString() + "/ Kg";
                        lblDesc.Text = row["Description"].ToString();
                    }
                    else
                    {
                        showAlertAndRedirect("Product Not Found!", "Home.aspx");
                    }
                }
                else
                {
                    showAlertAndRedirect("Invalid Product ID!", "Home.aspx");
                }
            }
            catch (Exception ex)
            {
                showAlert($"Error: {ex.Message}");
            }
        }

        // 🔹 Add to Cart Function
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                getcon(); // Initialize database connection

                string productId = ViewState["Pid"].ToString(); // Get product ID
                string userId = Session["user_id"]?.ToString(); // Assuming user session stores UserId

                if (string.IsNullOrEmpty(userId))
                {
                    showAlert("Please log in to add products to the cart!");
                    return;
                }

                // Check if the product is already in the cart
                string checkQuery = $"SELECT COUNT(*) FROM Cart_tbl WHERE user_id = '{userId}' AND pro_id = '{productId}'";
                SqlCommand checkCmd = new SqlCommand(checkQuery, con);

                //con.Open();
                int count = Convert.ToInt32(checkCmd.ExecuteScalar());
                //con.Close();

                if (count > 0)
                {
                    showAlert("Product is already in your cart!");
                    return;
                }

                // Insert product into cart
                string insertQuery = $"INSERT INTO Cart_tbl (user_id, pro_id, quantity) VALUES ('{userId}', '{productId}', '1')";
                SqlCommand insertCmd = new SqlCommand(insertQuery, con);

                //con.Open();
                int rowsAffected = insertCmd.ExecuteNonQuery();
                //con.Close();

                if (rowsAffected > 0)
                {
                    showAlert("Product Added to Cart!");
                }
                else
                {
                    showAlert("Failed to add product to cart. Please try again.");
                }
            }
            catch (Exception ex)
            {

                showAlert("Error: " + ex.Message);
                return;
            }
        }


        // 🔹 Buy Now Function
        protected void Button2_Click(object sender, EventArgs e)
        {
            // Implement buy now logic
            showAlert("Proceeding to Checkout!");
        }

        // 🔹 Helper Method for Showing Alerts
        private void showAlert(string message)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('{message}');", true);
        }

        // 🔹 Helper Method for Alerts with Redirect
        private void showAlertAndRedirect(string message, string redirectUrl)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('{message}'); window.location='{redirectUrl}';", true);
        }
    }
}
