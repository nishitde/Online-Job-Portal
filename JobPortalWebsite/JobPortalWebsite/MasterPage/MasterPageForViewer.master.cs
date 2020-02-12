using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security;
using System.Web.Security;
using MyJobPortalModel;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class MasterPage_MasterPageForViewer : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated == true && this.Response.Cookies["JobSeekerLogin"]!=null)
        {
            LnkLogin.Visible = false;
            LnkRecruiterZone.Visible = false;
            LnkDropDown.Visible = true;
        }
        if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated == true && this.Response.Cookies["RecruiterLogin"] != null)
        {
            LnkLogin.Visible = false;
            LnkRecruiterZone.Visible = false;
            LnkDropDown.Visible = true;
        }
        if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated == false)
        {
            LnkLogin.Visible = true;
            LnkRecruiterZone.Visible = true;
            LnkDropDown.Visible = false;
        }
    }

    protected void LnkBtnJobSeekerLogin_Click(object sender, EventArgs e)
    {
        JobSeekerLogin.Visible = true;
    }

    protected void BtnJobSeekerLogin_Click(object sender, EventArgs e)
    {
        if (this.Page.IsValid == true)
        {
            SqlConnection ObjConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyJobPortal"].ConnectionString);
            String strsql = "select * from JobSeeker a,JobSeeker_Login b where a.Id=b.JobSeekerId and a.Emailid='" + TxtEmailId.Text + "' and b.Password='" + TxtPassword.Text + "' and a.status='Active'";
            SqlDataAdapter ObjAdapter = new SqlDataAdapter(strsql, ObjConnection);
            DataTable ObjJobSeekerTable=new DataTable();
            ObjAdapter.Fill(ObjJobSeekerTable);
            if (ObjJobSeekerTable.Rows.Count > 0)
            {
                FormsAuthentication.RedirectFromLoginPage(((int)ObjJobSeekerTable.Rows[0]["Id"]).ToString(), false);
                Request.Cookies.Clear();
                HttpCookie ObjCookie = new HttpCookie("JobSeekerLogin");
                ObjCookie["Role"] = "JobSeeker";
                Response.Cookies.Add(ObjCookie);
            }
            else
            {
                LblInvalidLoginDetails.Visible = true;
                TxtPassword.Text = string.Empty;
                return;
            }
        }
    }

    protected void LnkBtnClose_Click(object sender, EventArgs e)
    {
        JobSeekerLogin.Visible = false;
    }

    protected void LnkBtnLogout_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Request.Cookies.Clear();
        Page_Load(null, null);
        Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri);
    }
}
