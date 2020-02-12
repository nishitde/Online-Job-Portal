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
            if (Person.GetPersonRecords("EmailId='" + TxtEmail.Text + "' and Role='Recruiter'").Rows.Count > 0)
            {
                LblDuplicateEmail.Visible = true;
                TxtEmail.Focus();
                return;
            }
            int NewRecruiter = Person.AddPerson(int.Parse(DdlTitle.SelectedValue), TxtFirstName.Text, TxtLastName.Text, TxtEmail.Text, TxtConfirmPassword.Text, "Recruiter", "Active",ChkEnableEmail.Checked);
            Recruiter_Company.AddRecruiter_Company(NewRecruiter, int.Parse(DdlCompany.SelectedValue));
            FormsAuthentication.RedirectFromLoginPage(NewRecruiter.ToString(), false);
        }
    }
}