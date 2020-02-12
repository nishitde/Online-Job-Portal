using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyJobPortalModel;
using System.Data;

public partial class JobPost_ViewQuestionJobPost : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ShowQuestions();
    }

    protected void LnkBtnAddQuestion_Click(object sender, EventArgs e)
    {
        DivAddQuestionModal.Visible = true;
    }

    protected void BtnAddQuestion_Click(object sender, EventArgs e)
    {
        
            if (this.IsValid == true)
            {
                //throw new Exception("hi");
                int QuestionId = JobPost_Question.AddJobPost_Question(int.Parse(Request.QueryString["Id"]),DateTime.Now, TxtQuestion.Text, "Active");
                TxtQuestion.Text = string.Empty;
                DivAddQuestionModal.Visible = false;
            ShowQuestions();
            }
    }

    protected void LnkBtnCloseAddQuestionModal_Click(object sender, EventArgs e)
    {
        DivAddQuestionModal.Visible = false;
    }

    public void ShowQuestions()
    {
        PlaceHolder1.Controls.Clear();
        //throw new Exception("Show Question");
        foreach (DataRow ObjRow in JobPost_Question.GetJobPost_QuestionRecords("JobPostId=" + Request.QueryString["Id"]).Rows)
        {
            JobPost_ViewQuestion ObjViewQuestion = (JobPost_ViewQuestion)this.LoadControl("ViewQuestion.ascx");
            ObjViewQuestion.ID = (int)ObjRow["Id"];
            PlaceHolder1.Controls.Add(ObjViewQuestion);
        }
        //Page_Load(null, null);
    }
}