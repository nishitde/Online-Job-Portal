﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyJobPortalModel;

public partial class JobPost_AppliedJobs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ShowGridView();
    }

    public void ShowGridView()
    {
        GridViewAppliedJobs.DataSource = Applied_Jobs.GetApplied_JobsRecords("Id=" + this.Page.User.Identity.Name);
        GridViewAppliedJobs.DataBind();
        LblNumberOfRecords.Text = GridViewAppliedJobs.Rows.Count.ToString();
    }

    protected void GridViewAppliedJobs_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            MyJobPortalModel.JobPost ObjJobs = new MyJobPortalModel.JobPost(int.Parse(e.Row.Cells[0].Text));
            e.Row.Cells[0].Text = ObjJobs.JobTitle;
        }
    }
}