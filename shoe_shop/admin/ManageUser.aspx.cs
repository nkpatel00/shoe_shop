using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace shoe_shop.admin
{
    public partial class ManageUser : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        DataSet ds;
        SqlDataAdapter da;
        Register_cls rg;
        string s = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
        string image;

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            if (!IsPostBack)
            {
                empty();
                fillgrid();
            }
        }

        void getcon()
        {
            rg = new Register_cls();
            con = rg.startCon();
        }

        void uploadImage()
        {
            if (UploadImage.HasFile)
            {
                string filename = UploadImage.FileName;
                string folderPath = Server.MapPath("~/img/"); // Ensure the folder exists in your project

                if (!System.IO.Directory.Exists(folderPath))
                {
                    System.IO.Directory.CreateDirectory(folderPath); // Create folder if it doesn't exist
                }

                string filePath = folderPath + filename;
                UploadImage.SaveAs(filePath); // Save the file

                image = "~/img/" + filename; // Store relative path (important for ASP.NET)
            }
        }


        void fillgrid()
        {
            getcon();
            GridView1.DataSource = rg.filldata();
            GridView1.DataBind();
        }
        void fillUserDetails()
        {
            getcon();
            ds = rg.select(Convert.ToInt32(ViewState["id"]));

            if (ds.Tables[0].Rows.Count > 0) // ✅ Ensure there is data
            {
                DataRow row = ds.Tables[0].Rows[0]; // Always get the first row

                txtName.Text = row["Name"].ToString();
                txtEmail.Text = row["Email"].ToString();
                txtMobile.Text = row["Mobile"].ToString();
                txtDate.Text = row["Date"].ToString();
                txtAdddress.Text = row["Address"].ToString();
                rbGender.SelectedValue = row["Gender"].ToString();
                ddCity.Text = row["City"].ToString();
                
            }
            else
            {
                txtName.Text = "";
                txtEmail.Text = "";
                txtMobile.Text = "";
                txtDate.Text = "";
                txtAdddress.Text = "";
                rbGender.SelectedIndex = 0;
                ddCity.Text = "";
            }
        }


        protected void btnRegister_Click(object sender, EventArgs e)
        {
            getcon();
            uploadImage();
            if (btnRegister.Text == "Submit")
            {
                rg = new Register_cls(); // Initialize Register_cls before using it
                rg.insert(txtName.Text, txtEmail.Text, txtMobile.Text, txtDate.Text, txtAdddress.Text, rbGender.SelectedValue, ddCity.SelectedValue, image, password.Text, repassword.Text);
            }
            else
            {
                int id = Convert.ToInt32(ViewState["id"]); // Get the ID from ViewState

                rg.update(id, txtName.Text, txtEmail.Text, txtMobile.Text, txtDate.Text, txtAdddress.Text, rbGender.SelectedValue, ddCity.SelectedValue, image, password.Text, repassword.Text);

                // Reset button text to "Submit" after update
                btnRegister.Text = "Update";
            }
            Session["user"] = txtName.Text;
            fillgrid();
            con.Close();
        }
        void empty()
        {
            txtName.Text = "";
            txtEmail.Text = "";
            txtMobile.Text = "";
            txtDate.Text = "";
            txtAdddress.Text = "";
            rbGender.ClearSelection();  // Clears radio button selection
            ddCity.ClearSelection();
            password.Text = "";
            repassword.Text = "";
            btnRegister.Text = "Save";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                int id = Convert.ToInt16(e.CommandArgument);
                ViewState["id"] = id;
                btnRegister.Text = "Update";
                fillUserDetails();
            }
            else if (e.CommandName == "cmd_dlt")
            {
                int id = Convert.ToInt16(e.CommandArgument);

                if (rg == null)  // Ensure ac is initialized
                {
                    rg = new Register_cls();
                }

                rg.delete(id); // Call delete function
                GridView1.DataSource = rg.filldata(); // Refresh GridView
                GridView1.DataBind();
            }
        }
    }
}