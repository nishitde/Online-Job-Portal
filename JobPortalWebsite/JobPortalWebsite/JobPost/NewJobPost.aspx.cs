using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyJobPortalModel;
using System.Data;

public partial class JobPost_NewJobPost : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            TxtJobTitle.Focus();
            for (int i = 1; i <= 35; i++)
            {
                DdlExperience.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
            DdlExperience.Items.Insert(0, new ListItem("--Select--", "--Select--"));
            DdlExperience.Items.Insert(1, new ListItem("Fresher", "Fresher"));
            DdlExperience.Items.Insert(2, new ListItem("6 Months", "6 Months"));
            DdlDepartment.DataSource = Department.GetDepartmentRecords("status='Active'");
            DdlDepartment.DataBind();
            DdlDepartment.Items.Insert(0, new ListItem("--Select--", "--Select--"));
            DdlCompany.DataSource = CompanyDetails.GetCompanyDetailsRecords("status='Active'");
            DdlCompany.DataBind();
            DdlCompany.Items.Insert(0, new ListItem("--Select--", "--Select--"));
            DdlDesignation.DataSource = Designation.GetDesignationRecords("status='Active'");
            DdlDesignation.DataBind();
            DdlDegree.DataSource = Degree.GetDegreeRecords("status='Active'");
            DdlDegree.DataBind();
            DdlDegree.Items.Insert(0, new ListItem("--Select--", "--Select--"));
            DdlDesignation.Items.Insert(0, new ListItem("--Select--", "--Select--"));
            DataTable ObjSkillTable = new DataTable();
            DataColumn ObjIdColumn = new DataColumn("Id", typeof(int));
            ObjIdColumn.AllowDBNull = false;
            ObjIdColumn.AutoIncrement = true;
            ObjSkillTable.Columns.Add(ObjIdColumn);
            DataColumn ObjSkillIdColumn = new DataColumn("SkillId", typeof(int));
            ObjSkillIdColumn.AllowDBNull = false;
            ObjSkillTable.Columns.Add(ObjSkillIdColumn);
            ViewState["SkillTable"] = ObjSkillTable;
        }
        LblDuplicateSkillName.Visible = false;
        LblSelectBranchError.Visible = false;
        LblSelectCheckBoxError.Visible = false;
    }

    protected void DdlCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DdlCompany.SelectedIndex != 0)
        {
            ChkLstBranches.Items.Clear();
            DataTable ObjBranchTable = Branch.GetBranchRecords("CompanyId=" + DdlCompany.SelectedValue);
            foreach (DataRow ObjBranchRow in ObjBranchTable.Rows)
                ChkLstBranches.Items.Add(new ListItem("&nbsp;" + ObjBranchRow["BranchName"] + "&nbsp;&nbsp;&nbsp;", ((int)ObjBranchRow["Id"]).ToString()));
            DdlDepartment.Focus();
        }
        else
            ChkLstBranches.Items.Clear();

    }

    protected void LnkBtnAddSkillModel_Click(object sender, EventArgs e)
    {
        AddSkillToJobPostModal.Visible = true;
        this.Form.DefaultButton = BtnAddSkills.UniqueID;
        FillSkillType(DdlSkillType);
        ChkLstSkills.Items.Clear();
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

    protected void lnkBtnCloseAddSkillModal_Click(object sender, EventArgs e)
    {
        AddSkillToJobPostModal.Visible = false;
        DdlAptitude.Focus();
        this.Form.DefaultButton = BtnAdJobPost.UniqueID;
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
            DataTable ObjSkillTable = (DataTable)ViewState["SkillTable"];
            foreach (ListItem ObjChkLstSkill in ChkLstSkills.Items)
            {
                if (ObjChkLstSkill.Selected == true)
                {
                    DataRow ObjSkillTableRow = ObjSkillTable.NewRow();
                    ObjSkillTableRow["SkillId"] = ObjChkLstSkill.Value;
                    ObjSkillTable.Rows.Add(ObjSkillTableRow);
                }
            }
            ShowSkills();
            AddSkillToJobPostModal.Visible = false;
            this.Form.DefaultButton = BtnAdJobPost.UniqueID;
            DdlAptitude.Focus();
        }
    }

    protected void GridViewSkills_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Skills ObjSkill = new Skills(int.Parse(e.Row.Cells[0].Text));
            e.Row.Cells[0].Text = ObjSkill.SkillName;
        }
    }

    protected void LnkBtnDeleteSkill_Click(object sender, EventArgs e)
    {
        DataTable ObjSkillTable = (DataTable)ViewState["SkillTable"];
        GridViewRow ObjCurrentRow = (GridViewRow)((LinkButton)sender).Parent.Parent;
        int Id = (int)GridViewSkills.DataKeys[ObjCurrentRow.RowIndex]["Id"];
        DataView ObjSkillView = ObjSkillTable.DefaultView;
        ObjSkillView.RowFilter = "Id<>" + Id;
        ViewState["SkillTable"] = ObjSkillView.ToTable();
        ShowSkills();
        DdlAptitude.Focus();
        this.Form.DefaultButton = BtnAdJobPost.UniqueID;
    }

    public void ShowSkills()
    {
        DataTable ObjSkillTable = (DataTable)ViewState["SkillTable"];
        GridViewSkills.DataSource = ObjSkillTable;
        GridViewSkills.DataBind();
    }

    protected void LnkBtnAddSkillType_Click(object sender, EventArgs e)
    {
        AddSkillTypeModal.Visible = true;
        LblDuplicateSkillType.Visible = false;
        TxtSkillType.Text = string.Empty;
        this.Form.DefaultButton = BtnAddSkiilType.UniqueID;
        TxtSkillType.Focus();
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

    protected void LnkBtnAddSkill_Click(object sender, EventArgs e)
    {
        AddSkillModal.Visible = true;
        DdlSkillTypeInAddSkill.Focus();
        FillSkillType(DdlSkillTypeInAddSkill);
        this.Form.DefaultButton = BtnAddSkillToDatabase.UniqueID;
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

    protected void BtnAdJobPost_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            bool AllOk = true;
            if (CheckCheckboxeList(ChkLstBranches) == false)
            {
                LblSelectBranchError.Visible = true;
                AllOk = false;
            }
            if (DdlAptitude.SelectedIndex != 0 && (TxtNumberOfAptitude.Text == string.Empty || int.Parse(TxtNumberOfAptitude.Text)<=0))
            {
                LblNumberOfAptitudeError.Visible = true;
                TxtNumberOfAptitude.Focus();
                return;
            }
            if (DdlGD.SelectedIndex != 0 && (TxtNumberOfGD.Text == string.Empty || int.Parse(TxtNumberOfGD.Text) <= 0))
            {
                LblNumberOfGDError.Visible = true;
                TxtNumberOfGD.Focus();
                return;
            }
            if (DdlTechnical.SelectedIndex != 0 && (TxtNumberOfTechnical.Text == string.Empty || int.Parse(TxtNumberOfTechnical.Text) <= 0))
            {
                LblNumberOfTechnicalError.Visible = true;
                TxtNumberOfTechnical.Focus();
                return;
            }
            if (DdlPersonalInterview.SelectedIndex != 0 && (TxtNumberOfInterviews.Text == string.Empty || int.Parse(TxtNumberOfInterviews.Text) <= 0))
            {
                LblNumberOfInteviewsError.Visible = true;
                TxtNumberOfInterviews.Focus();
                return;
            }
            if (JobPost.GetJobPostRecords("JobTitle='" + TxtJobTitle.Text + "' and recruiterId=" + this.Page.User.Identity.Name).Rows.Count > 0)
            {
                LblDuplicateJobTitleError.Visible = true;
                TxtJobTitle.Focus();
                return;
            }    
            if (AllOk == false)
                return;
            if (AllOk == true)
            {
                int NewJobPostId=JobPost.AddJobPost(int.Parse(this.Page.User.Identity.Name), TxtJobTitle.Text, int.Parse(DdlCompany.SelectedValue), int.Parse(DdlDepartment.SelectedValue), int.Parse(DdlDesignation.SelectedValue), BtnLstJobType.SelectedValue, BtnLstGender.SelectedValue, decimal.Parse(TxtMinSalary.Text), decimal.Parse(TxtMaxSalary.Text), TxtJobDescription.Text, "Active");
                foreach (ListItem ObjListItem in ChkLstBranches.Items)
                {
                    if (ObjListItem.Selected == true)
                    {
                        JobPost_Branches.AddJobPost_Branches(NewJobPostId, int.Parse(ObjListItem.Value));
                    }
                }
                JobPost_Requirement.AddJobPost_Requirement(NewJobPostId, int.Parse(DdlDegree.SelectedValue), int.Parse(DdlExperience.SelectedValue));
                DataTable ObjSkillTable = (DataTable)ViewState["SkillTable"];
                foreach (DataRow ObjRow in ObjSkillTable.Rows)
                {
                    JobPost_Skills.AddJobPost_Skills(NewJobPostId, int.Parse(ObjRow["SkillId"].ToString()));
                }
                //throw new Exception(int.Parse(TxtNumberOfGD.Text).ToString());
                JobPost_InterviewProcess.AddJobPost_InterviewProcess(NewJobPostId, DdlAptitude.SelectedValue, int.Parse(TxtNumberOfAptitude.Text), DdlGD.SelectedValue, int.Parse(TxtNumberOfGD.Text), DdlTechnical.SelectedValue, int.Parse(TxtNumberOfTechnical.Text), DdlPersonalInterview.SelectedValue, int.Parse(TxtNumberOfInterviews.Text));
            }

        }
    }
}