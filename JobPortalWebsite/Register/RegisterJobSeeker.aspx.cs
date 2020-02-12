using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyJobPortalModel;
using System.Web.Security;

public partial class Register_RegisterJobSeeker : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            DdlTitle.DataSource = MyJobPortalModel.Title.GetTitleRecords("status='Active'");
            DdlTitle.DataBind();
        }
    }

    protected void BtnRegister_Click(object sender, EventArgs e)
    {
        if(this.IsValid==true)
        {
            if(Person.GetPersonRecords("EmailId='"+TxtEmail.Text+"' and Role='JobSeeker'").Rows.Count>0)
            {
                LblDuplicateEmail.Visible = true;
                TxtEmail.Focus();
                return;
            }
            int NewJobSeeker=Person.AddPerson(int.Parse(DdlTitle.SelectedValue), TxtFirstName.Text, TxtLastName.Text, TxtEmail.Text, TxtConfirmPassword.Text,"JobSeeker","Active",ChkEnableEmail.Checked);
            FormsAuthentication.RedirectFromLoginPage(NewJobSeeker.ToString(), false);
        }
    }
}