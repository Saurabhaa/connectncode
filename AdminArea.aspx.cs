using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;


namespace MyBlog
{
    public partial class BlogPost : System.Web.UI.Page
    {
        RegistrationHelper objBlog;
        clsCommonHelper objcommon, objcommon1;
        DataTable DT;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                try
                {
                    if (Session["Login"] + "" == "")
                    {
                        Response.Redirect("adminlogin.aspx");
                    }

                    else
                    {

                    }

                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Error');", true);
                }

            }


        }

        protected void getRegistrations(object sender, EventArgs e)
        {
            try
            {
                BindRegistrationGridview();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", ex.Message.ToString(), true);

            }

        }
        protected void BindRegistrationGridview()
        {
            try
            {

                objcommon1 = new clsCommonHelper();
                DT = new DataTable();

                DT = objcommon1.FillDataTable("get_RegistrationEntry", CommandType.StoredProcedure);
                if (DT.Rows.Count > 0)
                {
                    gd_registered.DataSource = DT;
                    gd_registered.DataBind();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", ex.Message.ToString(), true);
            }

        }


        protected void getprojects(object sender, EventArgs e)
        {
            try
            {
                BindProjects();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", ex.Message.ToString(), true);
            }
        }
        protected void BindProjects()
        {

            try
            {
                objcommon = new clsCommonHelper();
                DT = new DataTable();

                DT = objcommon.FillDataTable("get_projects", CommandType.StoredProcedure);
                if (DT.Rows.Count > 0)
                {
                    gd_projects.DataSource = DT;
                    gd_projects.DataBind();
                }
                else
                {
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", ex.Message.ToString(), true);

            }

        }

        protected void HeadLogout_Click(object sender, EventArgs e)
        {
            try
            {
                Session.Clear();
                Session.RemoveAll();
                Session.Abandon();
                Session["Login"] = null;
                AbtnLogout.Visible = false;
                Response.Redirect("Index.aspx");
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "Exception", "alert('" + ex.Message + "');", true);
            }
        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            try
            {
                Save();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", ex.Message.ToString(), true);
            }

            finally
            {
                txtPost.Text = "";

            }

        }
        protected void Save()
        {
            try
            {
                objBlog = new RegistrationHelper();
                objBlog.ProjectTitle = txtprojecttitle.Text.Trim();
                objBlog.BlogPost = txtPost.Text.Trim();
                objBlog.Mode = "save";
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "Exception", "alert('" + objBlog.saveBlogPost() + "');", true);

            }

            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", ex.Message.ToString(), true);
            }

        }


    }
}