using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Skills_EditSkill : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            TxtSkill.Focus();
            this.Form.DefaultButton = BtnEdit.UniqueID;
            DataTable ObjSkillTypeTable = MyJobPortalModel.SkillType.GetSkillTypeRecords("status='Active'");
            DdlSkillType.DataSource = ObjSkillTypeTable;
            DdlSkillType.DataBind();
            DdlSkillType.Items.Insert(0, new ListItem("--Select--", "--Select--"));
            MyJobPortalModel.Skills ObjSkill = new MyJobPortalModel.Skills(int.Parse(Request.QueryString["Id"]));
            TxtSkill.Text = ObjSkill.SkillName;
            DdlSkillType.SelectedValue = ObjSkill.SkillTypeId.ToString();
            DdlStatus.SelectedValue = ObjSkill.Status;
        }
    }

    protected void BtnEdit_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            if ((int)MyJobPortalModel.Skills.GetSkillsRecords("SkillName='" + TxtSkill.Text + "' and Id<>" + Request.QueryString["Id"]).Rows.Count > 0)
            {
                LblDuplicateSkillError.Visible = true;
                return;
            }
            else
            {
                MyJobPortalModel.Skills ObjSkill = new MyJobPortalModel.Skills(int.Parse(Request.QueryString["Id"]));
                ObjSkill.SkillName = TxtSkill.Text;
                ObjSkill.SkillTypeId = int.Parse(DdlSkillType.SelectedValue);
                ObjSkill.Status = DdlStatus.SelectedValue;
                ObjSkill.Update();
                Response.Redirect("SkillList.aspx?Message=Record has been updated");
            }
        }
    }
}