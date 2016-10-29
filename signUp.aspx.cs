using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;
using DataBaseLayer;
using System.Configuration;

namespace MyBlog
{
    public partial class signUp : System.Web.UI.Page
    {
        RegistrationHelper objUser;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignup_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                Save();
            }
            catch (Exception)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Something Went Wrong');", true);
            }

            finally
            {
                txtName.Text = "";
                txtMobileNumber.Text = "";
                txtEmail.Text = "";
                txtPassword.Text = "";
                txtConfirmPass.Text = "";

            }

        }
        protected void Save()
        {
            try
            {
                objUser = new RegistrationHelper();
                objUser.Name = txtName.Text.Trim();
                objUser.MobileNo = txtMobileNumber.Text.Trim();
                objUser.Email = txtEmail.Text.Trim();
                objUser.Password = txtPassword.Text.Trim();
                objUser.Mode = "save";
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "Exception", "alert('" + objUser.saveRegistrationDetails() + "');", true);

            }

            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Registeration NOT sucessfully');", true);
            }
        }

    }
}