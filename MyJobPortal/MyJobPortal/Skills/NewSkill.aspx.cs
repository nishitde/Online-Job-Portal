using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MyJobPortalModel;

public partial class Skills_NewSkill : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            TxtSkill.Focus();
            this.Form.DefaultButton = BtnAdd.UniqueID;
            DataTable ObjSkillTypeTable = MyJobPortalModel.SkillType.GetSkillTypeRecords("status='Active'");
            DdlSkillType.DataSource = ObjSkillTypeTable;
            DdlSkillType.DataBind();
            DdlSkillType.Items.Insert(0, new ListItem("--Select--", "--Select--"));
        }
    }

    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            bool AllOk = true;
            if ((int)MyJobPortalModel.Skills.GetSkillsRecords("SkillName='" + TxtSkill.Text + "'").Rows.Count > 0)
            {
                LblDuplicateSkillError.Visible = true;
                AllOk = false;
                return;

            }
            if (AllOk == true)
            {
                MyJobPortalModel.Skills.AddSkills(Int32.Parse(DdlSkillType.SelectedValue), TxtSkill.Text, "Active");
                Response.Redirect("SkillList.aspx?Message=New record has been added");
            }
        }
    }
}