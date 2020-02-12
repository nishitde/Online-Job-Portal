using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyJobPortalModel;

public partial class Education_NewDegree : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            this.Form.DefaultButton = BtnAdd.UniqueID;
            TxtDegree.Focus();
        }
    }

    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            if ((int)MyJobPortalModel.Degree.GetDegreeRecords("DegreeName='" + TxtDegree.Text.Replace("'", "''") + "'").Rows.Count > 0)
            {
                LblDuplicateDegreeError.Visible = true;
                return;
            }
            else
            {
                MyJobPortalModel.Degree.AddDegree(TxtDegree.Text.Replace("'", "''").Trim(), "Active");
                Response.Redirect("DegreeList.aspx?Message=New Degree has been added");
            }
        }
    }
}