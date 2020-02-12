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
        if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated == true)
        {
            Person ObjPerson = new Person(int.Parse(this.Page.User.Identity.Name));
            if (ObjPerson.Role == "JobSeeker")
            {
                LnkLoginMenuForJobSeeker.Visible = true;
                LnkRecruiterSignIn.Visible = false;
                LnkJobSeekerSignIn.Visible = false;
            }
            if (ObjPerson.Role == "Recruiter")
            {
                LnkLoginMenuRecruiter.Visible = true;
                LnkRecruiterSignIn.Visible = false;
                LnkJobSeekerSignIn.Visible = false;
            }
            
        }
        if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated == false)
        {
            LnkLoginMenuRecruiter.Visible = false;
            LnkLoginMenuForJobSeeker.Visible = false;
            LnkRecruiterSignIn.Visible = true;
            LnkJobSeekerSignIn.Visible = true;
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
            DataTable ObjJobSeekerTable = Person.GetPersonRecords("EmailId='" + TxtEmailId.Text + "' and Password='" + TxtPassword.Text + "' and Role='JobSeeker'");
            if (ObjJobSeekerTable.Rows.Count > 0)
            {
                FormsAuthentication.RedirectFromLoginPage(((int)ObjJobSeekerTable.Rows[0]["Id"]).ToString(), ChkBoxLoginRemeber.Checked);
                Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri);
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
        Response.Redirect("../JobPost/JobPostList.aspx");
    }
}
