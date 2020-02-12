using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Maintenance_Department_NewDepartment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            this.Form.DefaultButton = BtnAdd.UniqueID;
            TxtDepartment.Focus();
        }
    }

    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            if ((int)MyJobPortalModel.Department.GetDepartmentRecords("DepartmentName='" + TxtDepartment.Text.Replace("'", "''") + "'").Rows.Count > 0)
            {
                LblDuplicateDepartmentError.Visible = true;
                return;
            }
            else
            {
                MyJobPortalModel.Department.AddDepartment(TxtDepartment.Text.Replace("'", "''").Trim(), "Active");
                Response.Redirect("DepartmentList.aspx?Message=Record has been Added");
            }
        }
    }
}