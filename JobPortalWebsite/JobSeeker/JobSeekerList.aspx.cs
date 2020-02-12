using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JobSeeker_JobSeekerList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ShowGridView();
    }

    public void ShowGridView()
    {
        GridViewJobSeeker.DataSource = MyJobPortalModel.Person.GetPersonRecords("status='Active' and Role='JobSeeker'");
        GridViewJobSeeker.DataBind();
        LblNumberOfRecords.Text = GridViewJobSeeker.Rows.Count.ToString();
    }
}