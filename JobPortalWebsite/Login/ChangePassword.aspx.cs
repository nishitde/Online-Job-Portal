using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using MyJobPortalModel;

public partial class Login_ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            TxtPreviousPassword.Focus();
            this.Form.DefaultButton = BtnUpdatePassword.UniqueID;
        }
        LblMessage.Visible = false;
        LblPreviousPasswordError.Visible = false;
    }

    protected void BtnUpdatePassword_Click(object sender, EventArgs e)
    {
        if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated == true)
        {
            Person ObjPerson = new Person(int.Parse(this.Page.User.Identity.Name));
            if (ObjPerson.Password != TxtPreviousPassword.Text)
            { 
                LblPreviousPasswordError.Visible = true;
                return;
            }
            else
            {
                //throw new Exception("hii");
                ObjPerson.Password = TxtConfirmPassword.Text;
                ObjPerson.Update();
                LblMessage.Text = "Password is Updated";
                LblMessage.CssClass = "text-success";
                LblMessage.Visible = true;
            }
        }
        else
        {
            //throw new Exception("hii");
            LblMessage.Text = "You are not Authenticated User";
            LblMessage.CssClass = "text-danger";
            LblMessage.Visible = true;
        }
    }
}