using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using MyJobPortalModel;

public partial class Register_RegisterRecruiter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(this.IsPostBack==false)
        {
            DdlTitle.DataSource = MyJobPortalModel.Title.GetTitleRecords("status='Active'");
            DdlTitle.DataBind();
            DdlCompany.DataSource = CompanyDetails.GetCompanyDetailsRecords("status='Active'");
            DdlCompany.DataBind();
            DdlCompany.Items.Insert(0, new ListItem("--Select Company--", "--Select Company--"));
        }
    }

    protected void BtnRegister_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            if (Recruiter.GetRecruiterRecords("EmailId='" + TxtEmail.Text + "'").Rows.Count > 0)
            {
                LblDuplicateEmail.Visible = true;
                TxtEmail.Focus();
                return;
            }
            int NewRecruiter = Recruiter.AddRecruiter(int.Parse(DdlCompany.SelectedValue),int.Parse(DdlTitle.SelectedValue), TxtFirstName.Text, TxtLastName.Text, TxtEmail.Text, "Active");
            Recruiter_Login.AddRecruiter_Login(NewRecruiter, TxtPassword.Text, "Recruiter");
            //FormsAuthentication.RedirectFromLoginPage(NewRecruiter.ToString(), false);
            HttpCookie RecruiterInfo = Request.Cookies["LoginInfo"];
            RecruiterInfo["Role"] = "Recruiter";
            Response.Cookies.Set(RecruiterInfo);
            Response.Redirect("../Login/RecruiterLogin.aspx");
        }
    }
}