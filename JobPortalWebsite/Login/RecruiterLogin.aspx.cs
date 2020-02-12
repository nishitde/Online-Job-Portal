using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Security;
using MyJobPortalModel;

public partial class Login_RecruiterLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnRecruiterLogin_Click(object sender, EventArgs e)
    {
        if(this.IsValid==true)
        {
            DataTable ObjRecruiterTable = Person.GetPersonRecords("EmailId='" + TxtEmailId.Text + "' and Password='" + TxtPassword.Text + "' and Role='Recruiter'");
            if (ObjRecruiterTable.Rows.Count > 0)
            {
                FormsAuthentication.RedirectFromLoginPage(((int)ObjRecruiterTable.Rows[0]["Id"]).ToString(), ChkRemeberLogin.Checked);
            }
            else
            {
                LblInvalidLoginDetails.Visible = true;
                TxtPassword.Text = string.Empty;
                return;
            }
        }
    }

}