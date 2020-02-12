using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyJobPortalModel;
using System.Data;

public partial class MasterPage_ViewJobPost : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            if (Request.RawUrl.Contains("ViewJobDescription.aspx"))
                LIJobDescription.Attributes.Add("class", "active");
            if (Request.RawUrl.Contains("ViewRequirements.aspx"))
                LIJobRequirement.Attributes.Add("class", "active");
            if (Request.RawUrl.Contains("ViewInterviewProcess.aspx"))
                LIInterviewProcess.Attributes.Add("class", "active");
            if (Request.RawUrl.Contains("ViewQuestionJobPost.aspx"))
                LIQuestionJobPost.Attributes.Add("class", "active");
            LnkJobDescription.NavigateUrl = LnkJobDescription.NavigateUrl + "?ID=" + Request.QueryString["ID"];
            //throw new Exception(LnkJobDescription.NavigateUrl);
            LnkJobRequirement.NavigateUrl = LnkJobRequirement.NavigateUrl + "?ID=" + Request.QueryString["ID"];
            LnkInterviewProcess.NavigateUrl = LnkInterviewProcess.NavigateUrl + "?ID=" + Request.QueryString["ID"];
            LnkQuestionJobPost.NavigateUrl = LnkQuestionJobPost.NavigateUrl + "?ID=" + Request.QueryString["ID"];
        }
        
    }

    protected void BtnApply_Click(object sender, EventArgs e)
    {
        if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated == true)
        {
            if (Applied_Jobs.GetApplied_JobsRecords("JobPostId=" + Request.QueryString["Id"] + " and JobSeekerId=" + this.Page.User.Identity.Name).Rows.Count > 0)
            {
                LblMessage.Text = "You have already applied for this Job";
                LblMessage.CssClass = "text-danger"+" h4";
                return;
            }
            else
            {
                Applied_Jobs.AddApplied_Jobs(int.Parse(this.Page.User.Identity.Name), int.Parse(Request.QueryString["Id"]));
                LblMessage.Text = "Applied Successfully";
                LblMessage.CssClass = "text-success";
                Person ObjPerson = new Person(int.Parse(this.Page.User.Identity.Name));
                JobPost ObjJobPost = new JobPost(int.Parse(Request.QueryString["Id"]));

                if (ObjPerson.EnableEmail == true)
                {
                    //throw new Exception("hiii");
                    MailMessage ObjMailMessage = new MailMessage();
                    ObjMailMessage.Subject = "You have successfully applied for a Job From Online Job Portal";
                    ObjMailMessage.Body = "Job Title:" + ObjJobPost.JobTitle + "\nCompany: " + CompanyDetails.GetCompanyDetailsRecords("Id=" + ObjJobPost.CompanyId).Rows[0]["CompanyName"] + "\nDesignation:" + Designation.GetDesignationRecords("Id=" + ObjJobPost.DesignationId).Rows[0]["DesignationName"] + "\nDepartment :" + Department.GetDepartmentRecords("Id=" + ObjJobPost.DepartmentId).Rows[0]["DepartmentName"];
                    ObjMailMessage.From = new MailAddress("pinjarimustafa27@gmail.com");
                    //ObjMailMessage.To.Add(new MailAddress("Rutvij.kokne@gmail.com"));
                    ObjMailMessage.To.Add(new MailAddress(ObjPerson.EmailId));
                    //ObjMailMessage.To.Add(new MailAddress("vaibhavchaulkar07.vc@gmail.com"));
                    SmtpClient ObjSmtpClient = new SmtpClient();
                    ObjSmtpClient.Host = "smtp.gmail.com";
                    ObjSmtpClient.Port = 587;
                    ObjSmtpClient.EnableSsl = true;
                    ObjSmtpClient.Credentials = new NetworkCredential("pinjarimustafa27@gmail.com", "Gigabyte786#");
                    try
                    {
                        ObjSmtpClient.Send(ObjMailMessage);
                    }
                    catch (Exception Ex)
                    {

                    }
                }
                
            }

        }
        else
        {
            LblMessage.Text = "Please Login To Apply";
            LblMessage.CssClass = "text-danger";
        }
    }

    protected void BtnSave_Click(object sender, EventArgs e)
    {
        if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated == true)
        {
            if (JobPost_Save.GetJobPost_SaveRecords("JobPostId=" + Request.QueryString["Id"] + " and JobSeekerId=" + this.Page.User.Identity.Name).Rows.Count > 0)
            {
                LblMessage.Text = "You have already saved this Job";
                LblMessage.CssClass = "text-danger";
                return;
            }
            else
            {
                JobPost_Save.AddJobPost_Save(int.Parse(this.Page.User.Identity.Name), int.Parse(Request.QueryString["Id"]));
                LblMessage.Text = "Saved Successfully";
                LblMessage.CssClass = "text-success";
                Person ObjPerson = new Person(int.Parse(this.Page.User.Identity.Name));
                JobPost ObjJobPost = new JobPost(int.Parse(Request.QueryString["Id"]));
                if (ObjPerson.EnableEmail == true)
                {
                    MailMessage ObjMailMessage = new MailMessage();
                    ObjMailMessage.Subject = "You have successfully saved a Job From Online Job Portal";
                    ObjMailMessage.Body = "Job Title:" + ObjJobPost.JobTitle + "\nCompany: " + CompanyDetails.GetCompanyDetailsRecords("Id=" + ObjJobPost.CompanyId).Rows[0]["CompanyName"] + "\nDesignation:" + Designation.GetDesignationRecords("Id=" + ObjJobPost.DesignationId).Rows[0]["DesignationName"] + "\nDepartment :" + Department.GetDepartmentRecords("Id=" + ObjJobPost.DepartmentId).Rows[0]["DepartmentName"];
                    ObjMailMessage.From = new MailAddress("pinjarimustafa27@gmail.com");
                    ObjMailMessage.To.Add(new MailAddress("Rutvij.kokne@gmail.com"));
                    ObjMailMessage.To.Add(new MailAddress(ObjPerson.EmailId));
                    //ObjMailMessage.To.Add(new MailAddress("vaibhavchaulkar07.vc@gmail.com"));
                    SmtpClient ObjSmtpClient = new SmtpClient();
                    ObjSmtpClient.Host = "smtp.gmail.com";
                    ObjSmtpClient.Port = 587;
                    ObjSmtpClient.EnableSsl = true;
                    ObjSmtpClient.Credentials = new NetworkCredential("pinjarimustafa27@gmail.com", "Gigabyte786#");
                    try
                    {
                        ObjSmtpClient.Send(ObjMailMessage);
                    }
                    catch (Exception Ex)
                    {

                    }
                }
            }

        }
        else
        {
            LblMessage.Text = "Please Login To Save";
            LblMessage.CssClass = "text-danger";
        }
    }
}
