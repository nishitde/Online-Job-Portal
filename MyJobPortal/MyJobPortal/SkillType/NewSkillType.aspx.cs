using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyJobPortalModel;

public partial class SkillType_NewSkillType : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            TxtSkillType.Focus();
            this.Form.DefaultButton = BtnAdd.UniqueID;
        }
    }

    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            if ((int)MyJobPortalModel.SkillType.GetSkillTypeRecords("SkillTypeName='" + TxtSkillType.Text.Replace("'", "''") + "'").Rows.Count > 0)
            {
                LblDuplicateSkillTypeError.Visible = true;
                return;
            }
            else
            {
                MyJobPortalModel.SkillType.AddSkillType(TxtSkillType.Text.Replace("'", "''").Trim(), "Active");
                Response.Redirect("SkillTypeList.aspx?Message=Record has been Added");
            }
        }
    }
}