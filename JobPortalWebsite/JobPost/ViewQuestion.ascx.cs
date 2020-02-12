using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyJobPortalModel;

public partial class JobPost_ViewQuestion : System.Web.UI.UserControl
{
    public int ID
    {
        get
        {
            return (int)ViewState["ID"];
        }
        set
        {
            ViewState["ID"] = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //throw new Exception(QuestionID.ToString());
        JobPost_Question ObjQuestion = new JobPost_Question(ID);
        LblQuestion.Text = ObjQuestion.QuestionName;
    }
}