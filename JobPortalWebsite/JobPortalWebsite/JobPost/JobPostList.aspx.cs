using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using MyJobPortalModel;

public partial class JobPost_JobPostList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ShowGridView();
            HyperLink ObjHyperLink = (HyperLink)Master.FindControl("LnkRegisterRecruiter");
            LinkButton ObjButton = (LinkButton)Master.FindControl("LnkBtnJobSeekerLogin");
            HttpCookie ObjLoginInfo2 = Request.Cookies["RecruiterLogin"];
            //throw new Exception(ObjLoginInfo2["Role"]);
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated == true)
            {
                LnkAddJobPost.Visible = false;
                ObjHyperLink.Visible = false;
                ObjButton.Visible = false;
                //throw new Exception(Request.Cookies["RecruiterLogin"].Values.ToString());
                    LnkAddJobPost.Visible = true;  
                
            }
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated == false)
            {
                ObjHyperLink.Visible = true;
                ObjButton.Visible = true;
            }
        
    }

    public void ShowGridView()
    {
        GridViewJobPostList.DataSource = JobPost.GetJobPostRecords("status='Active'");
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