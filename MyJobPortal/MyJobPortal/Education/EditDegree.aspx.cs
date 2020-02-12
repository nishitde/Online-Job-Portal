using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Education_EditDegree : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            TxtDegree.Focus();
            this.Form.DefaultButton = BtnUpdate.UniqueID;
            MyJobPortalModel.Degree ObjDegree = new MyJobPortalModel.Degree(int.Parse(Request.QueryString["Id"]));
            TxtDegree.Text = ObjDegree.DegreeName;
            DdlStatus.SelectedValue = ObjDegree.Status;
        }
    }

    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            bool AllOk = true;
            DataTable ObjDegreeTable = MyJobPortalModel.Degree.GetDegreeRecords("DegreeName ='" + TxtDegree.Text.Replace("'", "''").Trim() + "' and Id<>" + Request.QueryString["Id"]);

            if ((int)ObjDegreeTable.Rows.Count > 0)
            {
                LblDuplicateDegreeError.Visible = true;
                AllOk = false;
                TxtDegree.Focus();
                return;
            }
            if (AllOk == true)
            {
                MyJobPortalModel.Degree ObjDegree = new MyJobPortalModel.Degree(int.Parse(Request.QueryString["Id"]));
                ObjDegree.DegreeName = TxtDegree.Text.Replace("'", "''");
                ObjDegree.Status = DdlStatus.SelectedValue;
                ObjDegree.Update();
                Response.Redirect("DegreeList.aspx?Message=Record has been Updated");
            }
        }
    }
}