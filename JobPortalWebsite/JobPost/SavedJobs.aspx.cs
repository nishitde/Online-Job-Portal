using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyJobPortalModel;

public partial class JobPost_SavedJobs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ShowGridView();
    }

    public void ShowGridView()
    {
        GridViewSavedJobs.DataSource = JobPost_Save.GetJobPost_SaveRecords("JobSeekerId=" + this.Page.User.Identity.Name);
        GridViewSavedJobs.DataBind();
        LblNumberOfRecords.Text = GridViewSavedJobs.Rows.Count.ToString();
    }
    protected void GridViewSavedJobs_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            MyJobPortalModel.JobPost ObjJobs = new MyJobPortalModel.JobPost(int.Parse(e.Row.Cells[0].Text));
            e.Row.Cells[0].Text = ObjJobs.JobTitle;
        }
    }

    protected void LnkBtnDelete_Click(object sender, EventArgs e)
    {
        GridViewRow ObjCurrentRow = (GridViewRow)((LinkButton)sender).Parent.Parent;
        int JobPostlId = (int)GridViewSavedJobs.DataKeys[ObjCurrentRow.RowIndex]["JobPostId"];
        MyJobPortalModel.JobPost_Save.DeleteJobPost_SaveRecords("JobPostId=" + JobPostlId + " and JobSeekerId=" + int.Parse(this.Page.User.Identity.Name));
        ShowGridView();
    }
}