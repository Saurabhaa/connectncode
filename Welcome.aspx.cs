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
    public partial class Welcome : System.Web.UI.Page
    {

        clsCommonHelper objcommon1;
        DataTable DT;
        RegistrationHelper objUser;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                try
                {
                    if (Session["login"] + "" == "")
                    {
                        Response.Redirect("index.aspx");
                    }

                    else
                    {

                        HeadLoginName.Text = Request.QueryString["userId"];
                        BindRegistrationGridview();
                        Bindddl();
                        BindProjectUserGridview();
                    }

                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alertscript", ex.Message.ToString(), true);
                }
            }

        }

        protected void Bindddl()
        {
            objcommon1 = new clsCommonHelper();
            DT = new DataTable();
            DT = objcommon1.FillDataTable("get_projecttitle", CommandType.StoredProcedure);
            if (DT.Rows.Count > 0)
            {
                objcommon1.FillDDL(ddlproject, DT);
            }
            else
            {
                ddlproject.Items.Insert(0, new ListItem("", ""));
                ddlproject.Items.Clear();
                ddlproject.Items.Insert(0, new ListItem("Select", ""));

            }
        }

        protected void BindRegistrationGridview()
        {
            try
            {

                objcommon1 = new clsCommonHelper();
                DT = new DataTable();

                DT = objcommon1.FillDataTable("get_projects", CommandType.StoredProcedure);
                if (DT.Rows.Count > 0)
                {
                    gd_projects.DataSource = DT;
                    gd_projects.DataBind();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", ex.Message.ToString(), true);
            }

        }

        protected void BindProjectUserGridview()
        {
            try
            {

                objcommon1 = new clsCommonHelper();
                DT = new DataTable();

                DT = objcommon1.FillDataTable("get_userprojects", CommandType.StoredProcedure);
                if (DT.Rows.Count > 0)
                {
                    GridView1.DataSource = DT;
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", ex.Message.ToString(), true);
            }

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
                ddlproject.SelectedValue = "-1";

            }

        }
        protected void Save()
        {
            try
            {
                objUser = new RegistrationHelper();

                objUser.ProjectID = ddlproject.SelectedValue.Trim();
                objUser.Mode = "save";
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "Exception", "alert('" + objUser.saveUserProject() + "');", true);
                BindProjectUserGridview();
            }

            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Registeration NOT sucessfully');", true);
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
                btnLogout.Visible = false;
                Response.Redirect("Index.aspx");
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "Exception", "alert('" + ex.Message + "');", true);
            }
        }
    }
}