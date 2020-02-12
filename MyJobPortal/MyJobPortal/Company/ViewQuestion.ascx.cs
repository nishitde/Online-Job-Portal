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
            //throw new Exception(QuestionID.ToString());
            Question ObjQuestion = new Question(QuestionID);
            LblQuestion.Text = ObjQuestion.QuestionName;
    }
}