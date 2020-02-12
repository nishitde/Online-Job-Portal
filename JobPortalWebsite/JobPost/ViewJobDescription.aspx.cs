using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MyJobPortalModel;

public partial class JobPost_ViewJobDescription : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            JobPost ObjJobPost = new JobPost(int.Parse(Request.QueryString["Id"]));
            LblJobTitle.Text = ObjJobPost.JobTitle;
            LblCompanyName.Text = CompanyDetails.GetCompanyDetailsRecords("Id=" + ObjJobPost.CompanyId).Rows[0]["CompanyName"].ToString();
            LblDeparment.Text = Department.GetDepartmentRecords("Id=" + ObjJobPost.DepartmentId).Rows[0]["DepartmentName"].ToString();
            LblJobType.Text = ObjJobPost.JobType;
            LblGender.Text = ObjJobPost.ApplicableToSex;
            LblMinSalary.Text = ObjJobPost.MinSalary.ToString();
            LblMaxSalary.Text = ObjJobPost.MaxSalary.ToString();
            TxtJobDescription.Text = ObjJobPost.JobDescription;
            ShowGridView();
        }
    }

    public void ShowGridView()
    {
        DataTable ObjTable = JobPost_Branches.GetJobPost_BranchesRecords("JobPostId="+Request.QueryString["Id"]);
        //throw new Exception(ObjTable.Rows.Count.ToString());
        //throw new Exception(ObjTable.Columns.Count.ToString());
        DataTable ActualTable = Branch.GetBranchRecords("");
        ActualTable.Rows.Clear();
        foreach (DataRow ObjRow in ObjTable.Rows)
        {
            DataTable ObjBranchTable = Branch.GetBranchRecords("Id=" + ObjRow["BranchId"]);
            ActualTable.ImportRow(ObjBranchTable.Rows[0]);
        }
        //throw new Exception(ActualTable.Columns.Count.ToString());
        GridViewBranches.DataSource = ActualTable;
        GridViewBranches.DataBind();
    }

    protected void GridViewBranches_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            MyJobPortalModel.City ObjCity = new MyJobPortalModel.City(int.Parse(e.Row.Cells[1].Text));
            e.Row.Cells[1].Text = ObjCity.CityName;
        }
    }
}