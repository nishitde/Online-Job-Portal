using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyJobPortalModel;
using System.Data;

public partial class Maintenance_Titles_EditTitle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            TxtTitle.Focus();
            this.Form.DefaultButton = BtnUpdate.UniqueID;
            MyJobPortalModel.Title ObjTitle = new MyJobPortalModel.Title(int.Parse(Request.QueryString["Id"]));
            TxtTitle.Text = ObjTitle.TitleName;
            DdlGender.SelectedValue = ObjTitle.ApplicableToGender;
            DdlStatus.SelectedValue = ObjTitle.Status;
        }
    }

    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            bool AllOk = true;
            DataTable ObjTitleTable = MyJobPortalModel.Title.GetTitleRecords("TitleName ='" + TxtTitle.Text.Replace("'", "''").Trim() + "' and Id<>" + Request.QueryString["Id"]);
            if ((int)ObjTitleTable.Rows.Count > 0)
            {
                LblDuplicateTitleError.Visible = true;
                AllOk = false;
                TxtTitle.Focus();
                return;
            }
            if (AllOk == true)
            {
                MyJobPortalModel.Title ObjTitle = new MyJobPortalModel.Title(int.Parse(Request.QueryString["Id"]));
                ObjTitle.TitleName = TxtTitle.Text.Replace("'", "''");
                ObjTitle.ApplicableToGender = DdlGender.SelectedValue;
                ObjTitle.Status = DdlStatus.SelectedValue;
                ObjTitle.Update();
                Response.Redirect("TitleList.aspx?Message=Record has been Updated");
            }
        }
    }
}