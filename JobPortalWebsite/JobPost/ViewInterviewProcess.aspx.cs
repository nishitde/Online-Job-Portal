using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MyJobPortalModel;

public partial class JobPost_ViewInterviewProcess : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated == true)
        {
            Person ObjPerson = new Person(int.Parse(this.Page.User.Identity.Name));
            if (ObjPerson.Role == "JobSeeker")
            {
                LnkBtnEditInteriewProcess.Visible = false;
            }
            if (ObjPerson.Role == "Recruiter")
            {
                LnkBtnEditInteriewProcess.Visible = true;
            }
        }
        else
            LnkBtnEditInteriewProcess.Visible = false;
        DataTable ObjInterview = JobPost_InterviewProcess.GetJobPost_InterviewProcessRecords("JobPostId=" + Request.QueryString["Id"]);
        if (ObjInterview.Rows.Count > 0)
        {
            LblNumberOfAptitude.Text = ObjInterview.Rows[0]["NumberOfAptitudeTests"].ToString();
            LblNumberOfGD.Text = ObjInterview.Rows[0]["NumberOfGDs"].ToString();
            LblNumberOfTechnical.Text = ObjInterview.Rows[0]["NumberOfTechnicalRounds"].ToString();
            LblNumberOfinterview.Text = ObjInterview.Rows[0]["NumberOfpersonalInterviews"].ToString();
        }
        
    }

    protected void LnkBtnEditInteriewProcess_Click(object sender, EventArgs e)
    {
        EditInterViewProcessModal.Visible = true;
        DataTable ObjInterview = JobPost_InterviewProcess.GetJobPost_InterviewProcessRecords("JobPostId=" + Request.QueryString["Id"]);
        TxtNumberOfAptitude.Text = ObjInterview.Rows[0]["NumberOfAptitudeTests"].ToString();
        TxtNumberOfGD.Text = ObjInterview.Rows[0]["NumberOfGDs"].ToString();
        TxtNumberOfTechnical.Text = ObjInterview.Rows[0]["NumberOfTechnicalRounds"].ToString();
        TxtNumberOfInterviews.Text = ObjInterview.Rows[0]["NumberOfpersonalInterviews"].ToString();
        TxtNumberOfAptitude.Focus();
        this.Form.DefaultButton = BtnUpdateInterviewProcess.UniqueID;
    }

    protected void LnkBtnCloseInterviewProcess_Click(object sender, EventArgs e)
    {
        EditInterViewProcessModal.Visible = false;
        this.Form.DefaultButton = String.Empty;
    }

    protected void BtnUpdateInterviewProcess_Click(object sender, EventArgs e)
    {
        if (TxtNumberOfAptitude.Text == string.Empty || int.Parse(TxtNumberOfAptitude.Text) <= 0)
        {
            LblNumberOfAptitudeError.Visible = true;
            TxtNumberOfAptitude.Focus();
            return;
        }
        if (TxtNumberOfGD.Text == string.Empty || int.Parse(TxtNumberOfGD.Text) <= 0)
        {
            LblNumberOfGDError.Visible = true;
            TxtNumberOfGD.Focus();
            return;
        }
        if (TxtNumberOfTechnical.Text == string.Empty || int.Parse(TxtNumberOfTechnical.Text) <= 0)
        {
            LblNumberOfTechnicalError.Visible = true;
            TxtNumberOfTechnical.Focus();
            return;
        }
        if (TxtNumberOfInterviews.Text == string.Empty || int.Parse(TxtNumberOfInterviews.Text) <= 0)
        {
            LblNumberOfInteviewsError.Visible = true;
            TxtNumberOfInterviews.Focus();
            return;
        }
        JobPost_InterviewProcess ObjInterViewProcess = new JobPost_InterviewProcess(int.Parse(JobPost_InterviewProcess.GetJobPost_InterviewProcessRecords("JobPostId=" + Request.QueryString["Id"]).Rows[0]["Id"].ToString()));
        ObjInterViewProcess.NumberOfAptitudeTests = int.Parse(TxtNumberOfAptitude.Text);
        ObjInterViewProcess.NumberOfGDs = int.Parse(TxtNumberOfGD.Text);
        ObjInterViewProcess.NumberOfTechnicalRounds = int.Parse(TxtNumberOfTechnical.Text);
        ObjInterViewProcess.NumberOfPersonalInterviews = int.Parse(TxtNumberOfInterviews.Text);
        ObjInterViewProcess.Update();
        EditInterViewProcessModal.Visible = false;
        this.Form.DefaultButton = string.Empty;
        Page_Load(null, null);
    }
}