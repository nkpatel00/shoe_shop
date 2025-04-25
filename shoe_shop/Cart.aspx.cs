using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shoe_shop
{
    public partial class Cart : System.Web.UI.Page
    {
        Main_Class objMain = new Main_Class(); // Creating an object of Main_class

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user_id"] != null)
                {
                    LoadCart(Session["user_id"].ToString());
                }
                else
                {
                    Response.Redirect("Login.aspx"); // Redirect if user is not logged in
                }
            }
        }

        private void LoadCart(string userId)
        {
            using (SqlConnection conn = objMain.startCon()) // Using Main_class object for connection
            {
                string query = @"
                    SELECT 
                    c.Id AS CartId, 
                    p.Image, 
                    p.ProductName, 
                    c.quantity, 
                    p.Price, 
                    (CAST(c.quantity AS INT) * CAST(p.Price AS INT)) AS Total,
                    SUM(CAST(c.quantity AS INT) * CAST(p.Price AS INT)) OVER (PARTITION BY c.user_id) AS TotalAmount
                    FROM 
                        Cart_tbl c 
                    INNER JOIN 
                        product_tbl p ON c.pro_id = p.Id 
                    WHERE 
                        c.user_id = @UserId;
                    ";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.Add("@UserId", SqlDbType.NVarChar).Value = userId;
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        //DataTable dt = new DataTable();
                        //da.Fill(dt);
                        //GridView1.DataSource = dt;
                        //GridView1.DataBind();
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        GridView1.DataSource = ds;
                        GridView1.DataBind();
                        lblTotalAmount.Text = ds.Tables[0].Rows[0]["TotalAmount"].ToString();
                    }
                }

            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
        }

        private void RemoveFromCart(int cartId)
        {
            using (SqlConnection conn = objMain.startCon()) // Using Main_class object for connection
            {
                string query = "DELETE FROM Cart_tbl WHERE Id = @CartId";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.Add("@CartId", SqlDbType.Int).Value = cartId;
                    cmd.ExecuteNonQuery();
                }
            }

            // Reload cart after removing item
            if (Session["user_id"] != null)
            {
                LoadCart(Session["user_id"].ToString());
            }
        }

        protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_rem")
            {
                int cartId = Convert.ToInt32(e.CommandArgument);
                RemoveFromCart(cartId);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Address.aspx?totalAmount="+lblTotalAmount.Text);
        }
    }
}
