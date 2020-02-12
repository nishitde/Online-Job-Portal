using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MyJobPortalModel;

public partial class JobPost_ViewRequirements : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            DataTable ObjRequirement = JobPost_Requirement.GetJobPost_RequirementRecords("JobPostId=" + int.Parse(Request.QueryString["Id"]));
            LblEducation.Text = Degree.GetDegreeRecords("Id=" + ObjRequirement.Rows[0]["RequiredEducationId"]).Rows[0]["DegreeName"].ToString();
            LblExperience.Text = ObjRequirement.Rows[0]["RequiredExperience"].ToString();
            ShowGridView();
        }
        if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated == true)
        {
            Person ObjPerson = new Person(int.Parse(this.Page.User.Identity.Name));
            if (ObjPerson.Role == "JobSeeker")
            {
                LnkBtnEditJobRequirements.Visible = false;
            }
            if (ObjPerson.Role == "Recruiter")
            {
                LnkBtnEditJobRequirements.Visible = true;
            }
        }
        else
            LnkBtnEditJobRequirements.Visible = false;
    }

    public void ShowGridView()
    {
        DataTable ObjJob_SkillTable = MyJobPortalModel.JobPost_Skills.GetJobPost_SkillsRecords("JobPostId=" + int.Parse(Request.QueryString["Id"]));
        GridViewSkills.DataSource = ObjJob_SkillTable;
        GridViewSkills.DataBind();
    }

    protected void LnkBtnEditJobRequirements_Click(object sender, EventArgs e)
    {
        GridViewSkills.Columns[1].Visible = true;
        LnkBtnAddSkillModal.Visible = true;
    }

    protected void LnkBtnDeleteSkill_Click(object sender, EventArgs e)
    {
        GridViewRow ObjCurrentRow = (GridViewRow)((LinkButton)sender).Parent.Parent;
        int SkillId = (int)GridViewSkills.DataKeys[ObjCurrentRow.RowIndex]["SkillId"];
        MyJobPortalModel.JobPost_Skills.DeleteJobPost_SkillsRecords("JobPostId=" + Request.QueryString["Id"] + " and SkillId=" + SkillId);
        ShowGridView();
    }

    protected void GridViewSkills_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if(e.Row.RowType == DataControlRowType.DataRow)
        {
            Skills ObjSkill = new Skills(int.Parse(e.Row.Cells[0].Text));
            e.Row.Cells[0].Text = ObjSkill.SkillName;
        }
    }

    protected void LnkBtnAddSkillType_Click(object sender, EventArgs e)
    {
        AddSkillTypeModal.Visible = true;
        LblDuplicateSkillType.Visible = false;
        TxtSkillType.Text = string.Empty;
        this.Form.DefaultButton = BtnAddSkiilType.UniqueID;
        TxtSkillType.Focus();
    }

    protected void DdlSkillType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DdlSkillType.SelectedIndex != 0)
        {
            FillSkills();
            BtnAddSkills.Focus();
        }
        else
            ChkLstSkills.Items.Clear();
    }

    protected void LnkBtnAddSkill_Click(object sender, EventArgs e)
    {
        AddSkillModal.Visible = true;
        DdlSkillTypeInAddSkill.Focus();
        FillSkillType(DdlSkillTypeInAddSkill);
        this.Form.DefaultButton = BtnAddSkillToDatabase.UniqueID;
    }

    protected void BtnAddSkills_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            bool CheckSelectedSkills = CheckCheckboxeList(ChkLstSkills);
            if (CheckSelectedSkills == false)
            {
                LblSelectCheckBoxError.Visible = true;
                return;
            }
            foreach (ListItem ObjChkLstSkill in ChkLstSkills.Items)
            {
                if (ObjChkLstSkill.Selected == true)
                {
                    MyJobPortalModel.JobPost_Skills.AddJobPost_Skills(int.Parse(Request.QueryString["Id"]), int.Parse(ObjChkLstSkill.Value));
                }
            }
            ShowGridView();
            AddSkillToJobPostModal.Visible = false;
        }
    }

    protected void lnkBtnCloseAddSkillModal_Click(object sender, EventArgs e)
    {
        AddSkillToJobPostModal.Visible = false;
        
    }

    protected void AddSkiilType_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            if (SkillType.GetSkillTypeRecords("SkillTypeName='" + TxtSkillType.Text + "'").Rows.Count > 0)
            {
                LblDuplicateSkillType.Visible = true;
                return;
            }
            SkillType.AddSkillType(TxtSkillType.Text, "Active");
            AddSkillTypeModal.Visible = false;
            this.Form.DefaultButton = BtnAddSkills.UniqueID;
            FillSkillType(DdlSkillType);
            DdlSkillType.Focus();
        }
    }

    protected void CloseAddSkillTypeModal_Click(object sender, EventArgs e)
    {
        AddSkillTypeModal.Visible = false;
        this.Form.DefaultButton = BtnAddSkills.UniqueID;
        DdlSkillType.Focus();
    }

    protected void BtnAddSkillToDatabase_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            if (Skills.GetSkillsRecords("SkillName='" + TxtSkillNameInAddSkill.Text + "' and SkillTypeId=" + DdlSkillTypeInAddSkill.SelectedValue).Rows.Count > 0)
            {
                LblDuplicateSkillName.Visible = true;
                return;
            }
            Skills.AddSkills(int.Parse(DdlSkillTypeInAddSkill.SelectedValue), TxtSkillNameInAddSkill.Text, "Active");
            FillSkills();
            AddSkillModal.Visible = false;
            if (DdlSkillType.SelectedIndex != 0)
                FillSkills();
            DdlSkillType.Focus();
            this.Form.DefaultButton = BtnAddSkills.UniqueID;
        }
    }

    protected void LnkBtnCloseAddSkillModalDatabase_Click(object sender, EventArgs e)
    {
        AddSkillModal.Visible = false;
        this.Form.DefaultButton = BtnAddSkills.UniqueID;
        DdlSkillType.Focus();
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

    protected void LnkBtnAddSkillModal_Click(object sender, EventArgs e)
    {
        AddSkillToJobPostModal.Visible = true;
        this.Form.DefaultButton = BtnAddSkills.UniqueID;
        FillSkillType(DdlSkillType);
        ChkLstSkills.Items.Clear();
    }
}