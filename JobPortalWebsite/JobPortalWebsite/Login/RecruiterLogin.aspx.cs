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

public partial class Login_RecruiterLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnRecruiterLogin_Click(object sender, EventArgs e)
    {
        if(this.IsValid==true)
        {
            SqlConnection ObjConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyJobPortal"].ConnectionString);
            String strsql = "select * from Recruiter a,Recruiter_Login b where a.Id=b.RecruiterId and a.Emailid='" + TxtEmailId.Text + "' and b.Password='" + TxtPassword.Text + "' and a.status='Active'";
            SqlDataAdapter ObjAdapter = new SqlDataAdapter(strsql, ObjConnection);
            DataTable ObjRecruiterTable = new DataTable();
            ObjAdapter.Fill(ObjRecruiterTable);
            if (ObjRecruiterTable.Rows.Count > 0)
            {
                FormsAuthentication.RedirectFromLoginPage(((int)ObjRecruiterTable.Rows[0]["Id"]).ToString(), false);
                Request.Cookies.Clear();
                HttpCookie ObjCookie = new HttpCookie("RecruiterLogin");
                ObjCookie["Role"] = "Recruiter";
                Response.Cookies.Add(ObjCookie);
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