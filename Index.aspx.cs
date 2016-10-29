using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;
using System.Data;


namespace MyBlog
{
    public partial class Index : System.Web.UI.Page
    {
        RegistrationHelper ObjUser;
        clsCommonHelper objcommon;
        DataTable DT;
        string _Login = string.Empty;
        string _Password = string.Empty;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {

                    Session["Login"] = null;
                    txtUsername.Text = "";

                    Response.Cookies["UserLogin"].Expires.Day.ToString();
                    Response.Cookies["UserLogin"].Value = "";
                    Response.Cookies["UserLogin"].Value = null;

                    Clear(Page);
                    BindGridView();

                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "Exception", "alert('" + ex.Message + "');", true);
                }
            }
        }


        protected void gvHead_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {

                for (int i = 0; i < e.Row.Cells.Count; i++)
                    e.Row.Cells[i].Text = HttpUtility.HtmlDecode(e.Row.Cells[i].Text);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "Exception", "alert('" + ex.Message + "');", true);
            }

        }



        protected void BindGridView()
        {
            objcommon = new clsCommonHelper();
            DT = new DataTable();

            DT = objcommon.FillDataTable("get_BlogPost", CommandType.StoredProcedure);
            if (DT.Rows.Count > 0)
            {
                // GridView1.DataSource = DT;
                //GridView1.DataBind();
            }

        }
        protected void Login_Auth()
        {
            try
            {
                ObjUser = new RegistrationHelper();

                _Login = txtUsername.Text.Trim();
                _Password = txtPassword.Text.Trim();

                if ((_Login != "") && (_Password != ""))
                {
                    HttpCookie UserLogin = new HttpCookie("LOGIN");

                    UserLogin.Value = _Login;
                    UserLogin.Value = _Password;

                    Response.Cookies.Add(UserLogin);

                    Response.Cookies["UserLogin"].Value = _Login;
                    Response.Cookies["UserLogin"].Value = _Password;


                    DT = ObjUser.Loginuser(_Login, _Password);

                    if (DT.Rows.Count > 0)
                    {
                        Session["Login"] = _Login;

                        //Login1.FailureText = "";
                        if (chkRemember.Checked == true)
                        {  //Check if the browser support cookies 

                            if (Request.Browser.Cookies)
                            {
                                //Check if the cookie with name PBLOGIN exist on user's machine 
                                if (Request.Cookies["LOGIN"] == null)
                                {
                                    //Create a cookie with expiry of 30 days 

                                    Response.Cookies["LOGIN"].Expires = DateTime.Now.AddDays(30);

                                    //Write username to the cookie 

                                    Response.Cookies["UserLogin"].Value = null;
                                    Response.Cookies["UserLogin"].Value = null;
                                    Response.Cookies["UserLogin"].Value = null;
                                    Response.Cookies["UserLogin"].Value = null;

                                    Response.Cookies.Clear();
                                }
                                //If the cookie already exist then write the user name and password on the cookie 
                                else
                                {
                                    Response.Cookies["UserLogin"].Value = _Login;
                                    Response.Cookies["UserLogin"].Value = _Password;

                                }
                            }
                            else
                            {
                                Response.Cookies.Clear();
                                Response.Cookies["UserLogin"].Value = null;
                                Response.Cookies["UserLogin"].Value = null;
                                Response.Cookies["UserLogin"].Value = null;
                                Response.Cookies["UserLogin"].Value = null;
                            }
                        }
                        else
                        {
                            Response.Cookies.Clear();
                            Response.Cookies["UserLogin"].Value = null;
                            Response.Cookies["UserLogin"].Value = null;
                            Response.Cookies["UserLogin"].Value = null;
                            Response.Cookies["UserLogin"].Value = null;
                        }

                        string Info = "welcome.aspx?userId=" + txtUsername.Text.Trim();
                        Response.Redirect(Info, false);
                       // Response.Redirect("Welcome.aspx");
                        
                        Clear(Page);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "Exception", "alert('Login Attempt Not successfull');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "Exception", "alert('Fill a User Name ID & Password');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "Exception", "alert('" + ex.Message + "');", true);
            }
            finally
            {

                txtPassword.Text = "";
                Clear(Page);
                txtUsername.Focus();

            }
        }
        public void Clear(Control c)
        {
            foreach (Control c1 in c.Controls)
            {
                if (c1.GetType() == typeof(TextBox))
                {
                    ((TextBox)c1).Text = "";
                }
                if (c1.HasControls())
                {
                    Clear(c1);
                }
            }
        }

        protected void LoginButton_OnCommand(Object sender, CommandEventArgs e)
        {
            try
            {
                DT = new DataTable();
                ObjUser = new RegistrationHelper();

                if (e.CommandName.Equals("Login"))
                {
                    Login_Auth();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "Exception", "alert('Your login attempt was not successful, Please try again');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alertscript", ex.Message.ToString(), true);
            }
        }

    }
}