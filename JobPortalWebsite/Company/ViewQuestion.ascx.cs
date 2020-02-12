using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyJobPortalModel;

public partial class Company_ViewQuestion : System.Web.UI.UserControl
{
    public int QuestionID
    {
        get
        {
            return (int)ViewState["QuestionID"];
        }
        set
        {
            ViewState["QuestionID"] = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated == true)
        {
            Person ObjPerson = new Person(int.Parse(this.Page.User.Identity.Name));
            if (ObjPerson.Role == "JobSeeker")
            {
                LnkBtnAnswer.Visible = false;
            }
            if (ObjPerson.Role == "Recruiter")
            {
                LnkBtnAnswer.Visible = true;
            }
        }
        else
            LnkBtnAnswer.Visible = false;
        //throw new Exception(QuestionID.ToString());
        Question ObjQuestion = new Question(QuestionID);
        LblQuestion.Text = ObjQuestion.QuestionName;
        if(Question_Answer.GetQuestion_AnswerRecords("QuestionId=" + QuestionID).Rows.Count>0)
            LblAnswer.Text=  Question_Answer.GetQuestion_AnswerRecords("QuestionId=" + QuestionID).Rows[0]["Answer"].ToString();
    }

    protected void LnkBtnAnswer_Click(object sender, EventArgs e)
    {
        DivAddAnswerModal.Visible = true;
        if (Question_Answer.GetQuestion_AnswerRecords("QuestionId=" + QuestionID).Rows.Count > 0)
            TxtAnswer.Text = Question_Answer.GetQuestion_AnswerRecords("QuestionId=" + QuestionID).Rows[0]["Answer"].ToString();
        TxtAnswer.Focus();
        this.Page.Form.DefaultButton = BtnAddAnswer.UniqueID;
    }

    protected void BtnAddAnswer_Click(object sender, EventArgs e)
    {
        if(this.Page.IsValid==true)
        {
            Question_Answer.AddQuestion_Answer(QuestionID, TxtAnswer.Text);
            DivAddAnswerModal.Visible = false;
            Page_Load(null, null);
        }
    }

    protected void LnkBtnCloseAddAnswerModal_Click(object sender, EventArgs e)
    {
        DivAddAnswerModal.Visible = false;
        this.Page.Form.DefaultButton = String.Empty;
    }
}