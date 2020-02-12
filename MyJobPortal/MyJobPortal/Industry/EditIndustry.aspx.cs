using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Industry_EditIndustry : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            TxtIndustry.Focus();
            this.Form.DefaultButton = BtnUpdate.UniqueID;
            MyJobPortalModel.Industry ObjIndustry = new MyJobPortalModel.Industry(int.Parse(Request.QueryString["Id"]));
            TxtIndustry.Text = ObjIndustry.IndustryName;
            DdlStatus.SelectedValue = ObjIndustry.Status;
        }
    }

    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            bool AllOk = true;
            DataTable ObjIndustryTable = MyJobPortalModel.Industry.GetIndustryRecords("IndustryName ='" + TxtIndustry.Text.Replace("'", "''").Trim() + "' and Id<>" + Request.QueryString["Id"]);

            if ((int)ObjIndustryTable.Rows.Count > 0)
            {
                LblDuplicateIndustryError.Visible = true;
                AllOk = false;
                TxtIndustry.Focus();
                return;
            }
            if (AllOk == true)
            {
                MyJobPortalModel.Industry ObjIndustry = new MyJobPortalModel.Industry(int.Parse(Request.QueryString["Id"]));
                ObjIndustry.IndustryName = TxtIndustry.Text.Replace("'", "''");
                ObjIndustry.Status = DdlStatus.SelectedValue;
                ObjIndustry.Update();
                Response.Redirect("IndustryList.aspx?Message=Record has been Updated");
            }
        }
    }
}