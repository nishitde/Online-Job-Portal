using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MyJobPortalModel;

public partial class Maintenance_Designation_NewDesignation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            this.Form.DefaultButton = BtnAdd.UniqueID;
            TxtDesignation.Focus();
        }
    }

    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            if ((int)MyJobPortalModel.Designation.GetDesignationRecords("DesignationName='" + TxtDesignation.Text.Replace("'", "''") + "'").Rows.Count > 0)
            {
                LblDuplicateDesignationError.Visible = true;
                return;
            }
            else
            {
                MyJobPortalModel.Designation.AddDesignation(TxtDesignation.Text.Replace("'", "''").Trim(), "Active");
                Response.Write("Added");
            }
        }
    }
}