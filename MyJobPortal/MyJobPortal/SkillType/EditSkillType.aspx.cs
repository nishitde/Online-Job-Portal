using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class SkillType_EditSkillType : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            TxtSkillType.Focus();
            this.Form.DefaultButton = BtnUpdate.UniqueID;
            MyJobPortalModel.SkillType ObjSkillType = new MyJobPortalModel.SkillType(int.Parse(Request.QueryString["Id"]));
            TxtSkillType.Text = ObjSkillType.SkillTypeName;
            DdlStatus.SelectedValue = ObjSkillType.Status;
        }
    }

    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            bool AllOk = true;
            DataTable ObjSkillTypeTable = MyJobPortalModel.SkillType.GetSkillTypeRecords("SkillTypeName ='" + TxtSkillType.Text.Replace("'", "''").Trim() + "' and Id<>" + Request.QueryString["Id"]);

            if ((int)ObjSkillTypeTable.Rows.Count > 0)
            {
                LblDuplicateSkillTypeError.Visible = true;
                AllOk = false;
                TxtSkillType.Focus();
                return;
            }
            if (AllOk == true)
            {
                MyJobPortalModel.SkillType ObjSkillType = new MyJobPortalModel.SkillType(int.Parse(Request.QueryString["Id"]));
                ObjSkillType.SkillTypeName = TxtSkillType.Text.Replace("'", "''");
                ObjSkillType.Status = DdlStatus.SelectedValue;
                ObjSkillType.Update();
                Response.Redirect("SkillTypeList.aspx?Message=Record has been Updated");
            }
        }
    }
}