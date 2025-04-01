using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace shoe_shop
{
    public partial class Login : System.Web.UI.Page
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
                image = "img/" + UploadImage.FileName;
                UploadImage.SaveAs(Server.MapPath(image));
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            getcon();
            uploadImage();

            rg = new Register_cls(); // Initialize Register_cls before using it
            rg.insert(txtName.Text, txtEmail.Text, txtMobile.Text, txtDate.Text, txtAdddress.Text, rbGender.SelectedValue, ddCity.SelectedValue, image, password.Text, repassword.Text);

            Session["user"] = txtName.Text;
            Response.Redirect("Login.aspx");

            con.Close();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Label1.Text = "welcome";
        }
    }
}
