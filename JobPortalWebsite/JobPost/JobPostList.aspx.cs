using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyJobPortalModel;

public partial class JobPost_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    { 
        if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated == true)
        {
            Person ObjPerson = new Person(int.Parse(this.Page.User.Identity.Name));
            if (ObjPerson.Role == "JobSeeker")
            {
                LnkAddJobPost.Visible = false;
            }
            if (ObjPerson.Role == "Recruiter")
            {
                LnkAddJobPost.Visible = true;
            }
        }
            ShowGridView();
    }
    public void ShowGridView()
    {
        GridViewJobPostList.DataSource = MyJobPortalModel.JobPost.GetJobPostRecords("status='Active'");
        GridViewJobPostList.DataBind();
        LblNumberOfRecords.Text = GridViewJobPostList.Rows.Count.ToString();
    }

    protected void GridViewJobPostList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            MyJobPortalModel.Department ObjDepartmentName = new MyJobPortalModel.Department(int.Parse(e.Row.Cells[2].Text));
            e.Row.Cells[2].Text = ObjDepartmentName.DepartmentName;
            MyJobPortalModel.Designation ObjDesignationName = new MyJobPortalModel.Designation(int.Parse(e.Row.Cells[1].Text));
            e.Row.Cells[1].Text = ObjDesignationName.DesignationName;
        }
    }
}