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
    }

    public void ShowGridView()
    {
        DataTable ObjJob_SkillTable = JobPost_Skills.GetJobPost_SkillsRecords("JobPostId=" + Request.QueryString["Id"]);
        DataTable ActualTable = Skills.GetSkillsRecords("");
        ActualTable.Rows.Clear();
        foreach (DataRow ObjRow in ObjJob_SkillTable.Rows)
        {
            DataTable ObjSkillTable = Skills.GetSkillsRecords("Id=" + ObjRow["SkillId"]);
            ActualTable.ImportRow(ObjSkillTable.Rows[0]);
        }
        //throw new Exception(ActualTable.Columns.Count.ToString());
        GridViewSkills.DataSource = ActualTable;
        GridViewSkills.DataBind();
    }
}