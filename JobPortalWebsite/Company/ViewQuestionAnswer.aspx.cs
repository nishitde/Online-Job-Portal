using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyJobPortalModel;
using System.Data;

public partial class Company_ViewQuestionAnswer : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
            ShowQuestions();;
    }

    protected void LnkBtnAddQuestion_Click(object sender, EventArgs e)
    {
        //throw new Exception("Add Question");
        DivAddQuestionModal.Visible = true;
        TxtQuestion.Focus();
        this.Form.DefaultButton = BtnAddQuestion.UniqueID;
    }

    protected void LnkBtnCloseAddQuestionModal_Click(object sender, EventArgs e)
    {
        //throw new Exception("Close Add Question");
        DivAddQuestionModal.Visible = false;
        this.Form.DefaultButton = string.Empty;
    }

    protected void BtnAddQuestion_Click(object sender, EventArgs e)
    {
        if (this.Page.IsPostBack == true)
        {
            if (this.IsValid == true)
            {
                //throw new Exception("hi");
                int QuestionId = Question.AddQuestion(DateTime.Now, TxtQuestion.Text, DdlRelatedTo.SelectedValue,int.Parse(Request.QueryString["Id"]));
                TxtQuestion.Text = string.Empty;
                DdlRelatedTo.SelectedIndex = 0;
                DivAddQuestionModal.Visible = false;
                this.Form.DefaultButton = string.Empty;
                ShowQuestions();
            }
        }
    }

    public void ShowQuestions()
    {
        PlaceHolder1.Controls.Clear();
        //throw new Exception("Show Question");
        foreach (DataRow ObjRow in Question.GetQuestionRecords("CompanyId=" + Request.QueryString["Id"]).Rows)
        {
            Company_ViewQuestion ObjViewQuestion = (Company_ViewQuestion)this.LoadControl("ViewQuestion.ascx");
            ObjViewQuestion.QuestionID = (int)ObjRow["Id"];
            PlaceHolder1.Controls.Add(ObjViewQuestion);
        }
        //Page_Load(null, null);
    }
}