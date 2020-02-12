using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyJobPortalModel;

public partial class Company_NewAnswerCompany : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ShowQuestions();
    }

    protected void BtnGo_Click(object sender, EventArgs e)
    {
        ShowQuestions();
    }

    public void ShowQuestions()
    {
        GridViewQuestion.DataSource = Question.GetQuestionRecords("CompanyId=" + Recruiter_Company.GetRecruiter_CompanyRecords("PersonId="+int.Parse(this.Page.User.Identity.Name)).Rows[0]["CompanyId"]);
        GridViewQuestion.DataBind();
    }

    protected void LnkBtnAnswer_Click(object sender, EventArgs e)
    {

    }
}