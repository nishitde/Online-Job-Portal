using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyJobPortalModel;

public partial class JobPost_Skills : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void FillSkillType(DropDownList ObjDropDownList)
    {
        ObjDropDownList.Items.Clear();
        ObjDropDownList.DataSource = SkillType.GetSkillTypeRecords("status='Active'");
        ObjDropDownList.DataBind();
        ObjDropDownList.Items.Insert(0, new ListItem("--Select--", "--Select--"));
        ObjDropDownList.SelectedIndex = 0;
    }

    public void FillSkills()
    {
        ChkLstSkills.Items.Clear();
        DataTable ObjSkillTable = Skills.GetSkillsRecords("SkillTypeId=" + DdlSkillType.SelectedValue);
        foreach (DataRow ObjSkillTableRow in ObjSkillTable.Rows)
            ChkLstSkills.Items.Add(new ListItem("&nbsp;" + ObjSkillTableRow["SkillName"] + "&nbsp;&nbsp;&nbsp;", ((int)ObjSkillTableRow["Id"]).ToString()));
    }

    public bool CheckCheckboxeList(CheckBoxList ObjCheckBoxList)
    {
        bool CheckSelection = false;
        foreach (ListItem ObjChkLst in ObjCheckBoxList.Items)
        {
            if (ObjChkLst.Selected == true)
            {
                CheckSelection = true;
            }
        }
        return CheckSelection;
    }
}