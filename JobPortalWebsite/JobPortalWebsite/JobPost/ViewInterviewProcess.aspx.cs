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
        if (this.IsPostBack == false)
        {
            DataTable ObjInterview = JobPost_InterviewProcess.GetJobPost_InterviewProcessRecords("JobPostId=" + Request.QueryString["Id"]);
            LblNumberOfAptitude.Text = ObjInterview.Rows[0]["NumberOfAptitudeTests"].ToString();
            LblNumberOfGD.Text = ObjInterview.Rows[0]["NumberOfGDs"].ToString();
            LblNumberOfTechnical.Text = ObjInterview.Rows[0]["NumberOfTechnicalRounds"].ToString();
            LblNumberOfinterview.Text = ObjInterview.Rows[0]["NumberOfpersonalInterviews"].ToString();
        }
    }
}