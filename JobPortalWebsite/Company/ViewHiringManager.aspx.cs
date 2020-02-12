using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Company_ViewHiringManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(this.IsPostBack==true)
        {
            ShowGridView();
        }
        ShowGridView();
    }

    protected void LnkBtnAddHiringManagerModal_Click(object sender, EventArgs e)
    {
        AddHiringMnagerModal.Visible = true;
        DataTable ObjBranchTable = MyJobPortalModel.Branch.GetBranchRecords("CompanyId=" + int.Parse(Request.QueryString["Id"]));
        DdlBranches.DataSource = ObjBranchTable;
        DdlBranches.DataBind();
        DdlBranches.Items.Insert(0, new ListItem("--Select--", "--Select"));
        DataTable ObjDepartmentTable = MyJobPortalModel.Department.GetDepartmentRecords("status='Active'");
        DdlDepartment.DataSource = ObjDepartmentTable;
        DdlDepartment.DataBind();
        DdlDepartment.Items.Insert(0, new ListItem("--Select--", "--Select"));
        TxtHiringManagerName.Focus();
    }

    protected void BtnAddHiringManager_Click(object sender, EventArgs e)
    {
        if(this.IsValid==true)
        {
            if(MyJobPortalModel.HiringManager.GetHiringManagerRecords("HiringManagerName='"+TxtHiringManagerName.Text+"' and BranchId="+int.Parse(DdlBranches.SelectedValue)).Rows.Count>0)
            {
                LblDuplicateHiringManagerNameError.Visible = true;
                TxtHiringManagerName.Focus();
                return;
            }
            MyJobPortalModel.HiringManager.AddHiringManager(int.Parse(Request.QueryString["Id"]), int.Parse(DdlBranches.SelectedValue), int.Parse(DdlDepartment.SelectedValue), TxtHiringManagerName.Text, TxtEmail.Text);
            AddHiringMnagerModal.Visible = false;
        }
    }

    protected void LnkBtnCloseAddHiringManagerModal_Click(object sender, EventArgs e)
    {
        AddHiringMnagerModal.Visible = false;
    }

    public void ShowGridView()
    {
        DataTable ObjHiringMangerTable = MyJobPortalModel.HiringManager.GetHiringManagerRecords("CompanyId=" + int.Parse(Request.QueryString["Id"]));
        GridViewHiringManager.DataSource = ObjHiringMangerTable;
        GridViewHiringManager.DataBind();
        LblNumberOfHiringManager.Text = GridViewHiringManager.Rows.Count.ToString();
    }

    protected void GridViewHiringManager_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            MyJobPortalModel.Branch ObjBranch = new MyJobPortalModel.Branch(int.Parse(e.Row.Cells[2].Text));
            e.Row.Cells[2].Text = ObjBranch.BranchName;
            MyJobPortalModel.Department ObjDepartment = new MyJobPortalModel.Department(int.Parse(e.Row.Cells[3].Text));
            e.Row.Cells[3].Text = ObjDepartment.DepartmentName;
        }
    }
}