using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Maintenance_Designation_EditDesignation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            TxtDesignation.Focus();
            this.Form.DefaultButton = BtnUpdate.UniqueID;
            MyJobPortalModel.Designation ObjDesignation = new MyJobPortalModel.Designation(int.Parse(Request.QueryString["Id"]));
            TxtDesignation.Text = ObjDesignation.DesignationName;
            DdlStatus.SelectedValue = ObjDesignation.Status;
        }
    }

    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            bool AllOk = true;
            DataTable ObjDesignationTable = MyJobPortalModel.Designation.GetDesignationRecords("DesignationName ='" + TxtDesignation.Text.Replace("'", "''").Trim() + "' and Id<>" + Request.QueryString["Id"]);
            
            if ((int)ObjDesignationTable.Rows.Count > 0)
            {
                LblDuplicateDesignationError.Visible = true;
                AllOk = false;
                TxtDesignation.Focus();
                return;
            }
            if (AllOk == true)
            {
                MyJobPortalModel.Designation ObjDesignation = new MyJobPortalModel.Designation(int.Parse(Request.QueryString["Id"]));
                ObjDesignation.DesignationName = TxtDesignation.Text.Replace("'", "''");
                ObjDesignation.Status = DdlStatus.SelectedValue;
                ObjDesignation.Update();
                Response.Redirect("DesignationList.aspx?Message=Record has been Updated");
            }
        }
    }
}