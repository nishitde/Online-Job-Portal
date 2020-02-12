using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Maintenance_Department_EditDepartment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            TxtDepartment.Focus();
            this.Form.DefaultButton = BtnUpdate.UniqueID;
            MyJobPortalModel.Department ObjDepartment = new MyJobPortalModel.Department(int.Parse(Request.QueryString["Id"]));
            TxtDepartment.Text = ObjDepartment.DepartmentName;
            DdlStatus.SelectedValue = ObjDepartment.Status;
        }
    }

    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            bool AllOk = true;
            DataTable ObjDepartmentTable = MyJobPortalModel.Department.GetDepartmentRecords("DepartmentName ='" + TxtDepartment.Text.Replace("'", "''").Trim() + "' and Id<>" + Request.QueryString["Id"]);

            if ((int)ObjDepartmentTable.Rows.Count > 0)
            {
                LblDuplicateDepartmentError.Visible = true;
                AllOk = false;
                TxtDepartment.Focus();
                return;
            }
            if (AllOk == true)
            {
                MyJobPortalModel.Department ObjDepartment = new MyJobPortalModel.Department(int.Parse(Request.QueryString["Id"]));
                ObjDepartment.DepartmentName = TxtDepartment.Text.Replace("'", "''");
                ObjDepartment.Status = DdlStatus.SelectedValue;
                ObjDepartment.Update();
                Response.Redirect("DepartmentList.aspx?Message=Record has been Updated");
            }
        }
    }
}