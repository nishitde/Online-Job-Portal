using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyJobPortalModel;
using System.Web.Security;

public partial class Register_RegisterJobSeeker : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            DdlTitle.DataSource = MyJobPortalModel.Title.GetTitleRecords("status='Active'");
            DdlTitle.DataBind();
        }
    }

    protected void BtnRegister_Click(object sender, EventArgs e)
    {
        if(this.IsValid==true)
        {
            if(JobSeeker.GetJobSeekerRecords("EmailId='"+TxtEmail.Text+"'").Rows.Count>0)
            {
                LblDuplicateEmail.Visible = true;
                TxtEmail.Focus();
                return;
            }
            int NewJobSeeker=JobSeeker.AddJobSeeker(int.Parse(DdlTitle.SelectedValue), TxtFirstName.Text, TxtLastName.Text, TxtEmail.Text, "Active");
            JobSeeker_Login.AddJobSeeker_Login(NewJobSeeker, TxtPassword.Text, "JobSeeker");
            HttpCookie JobSeekerInfo = new HttpCookie("JobSeekerInfo");
            JobSeekerInfo["Role"] = "JobSeeker";
            JobSeekerInfo.Expires = DateTime.Today.AddHours(12);
            Response.Cookies.Add(JobSeekerInfo);
            FormsAuthentication.RedirectFromLoginPage(NewJobSeeker.ToString(), false);
        }
    }
}