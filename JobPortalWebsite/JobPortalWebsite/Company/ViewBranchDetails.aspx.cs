using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Company_ViewBranchDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            //DataTable BranchTable= MyJobPortalModel.Branch.GetBranchRecords("CompanyID="+int.Parse(Request.QueryString["Id"]));
            //LblBranchName.Text = BranchTable.Rows[0]["BranchName"].ToString();
            //LblAddress.Text = BranchTable.Rows[0]["AddressLine1"].ToString() + "  " + BranchTable.Rows[0]["AddressLine2"].ToString();
            //LblCity.Text = BranchTable.Rows[0]["CityId"].ToString();
            //LblState.Text = BranchTable.Rows[0]["StateId"].ToString(); ;
            //LblCountry.Text = BranchTable.Country;
            //LblPhoneNumber.Text = BranchTable.PhoneNumber1 + ", " + BranchTable.PhoneNumber2;
            //LblEmailIDs.Text = BranchTable.EmailId1 + ", " + BranchTable.EmailId2;
            ShowGridView();
        }
        
    }

    public void ShowGridView()
    {
        DataTable ObjBranchTable = MyJobPortalModel.Branch.GetBranchRecords("CompanyId=" + Request.QueryString["Id"]);
        GridViewBranches.DataSource = ObjBranchTable;
        GridViewBranches.DataBind();
        LblNumberOfBranches.Text = GridViewBranches.Rows.Count.ToString();
    }

    protected void LnkBtnAddBranchModal_Click(object sender, EventArgs e)
    {
        AddBranchModal.Visible = true;
        this.Form.DefaultButton = BtnAddBranch.UniqueID;
        DataTable ObjCountryTable = MyJobPortalModel.Country.GetCountryRecords("status='Active'");
        DdlCountry.DataSource = ObjCountryTable;
        DdlCountry.DataBind();
        DdlCountry.Items.Insert(0, new ListItem("--Select Country--", "--Select--"));
        DdlState.Items.Add(new ListItem("--Select State--", "--Select--"));
        DdlCity.Items.Add(new ListItem("--Select Country--", "--Select--"));
    }

    protected void LnkBtnCloseAddBranchModal_Click(object sender, EventArgs e)
    {
        AddBranchModal.Visible = false;
    }

    protected void BtnAddBranch_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            if ((int)MyJobPortalModel.Branch.GetBranchRecords("BranchName='" + TxtBranchName.Text + "' and CompanyId=" + int.Parse(Request.QueryString["Id"])).Rows.Count > 0)
            {
                LblDuplicateBranchNameError.Visible = true;
                TxtBranchName.Focus();
                return;
            }
            MyJobPortalModel.Branch.AddBranch(int.Parse(Request.QueryString["Id"]), TxtBranchName.Text, TxtAddressLine1.Text, TxtAddressLine2.Text, int.Parse(DdlCity.SelectedValue), TxtPinCode.Text, int.Parse(DdlState.SelectedValue), int.Parse(DdlCountry.SelectedValue), TxtPhoneNumber1.Text, TxtPhoneNumber2.Text, TxtEmail1.Text, TxtEmail2.Text);
        }
        AddBranchModal.Visible = false;
        ShowGridView();
    }

    protected void DdlCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable ObjStateTable = MyJobPortalModel.State.GetStateRecords("status='Active' and CountryId=" + int.Parse(DdlCountry.SelectedValue));
        DdlState.DataSource = ObjStateTable;
        DdlState.DataBind();
        DdlState.Items.Insert(0, new ListItem("--Select State--", "--Select--"));
    }

    protected void DdlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable ObjCityTable = MyJobPortalModel.City.GetCityRecords("status='Active' and StateId=" + int.Parse(DdlState.SelectedValue));
        DdlCity.DataSource = ObjCityTable;
        DdlCity.DataBind();
        DdlCity.Items.Insert(0, new ListItem("--Select City", "--Select--"));
    }

    protected void GridViewBranches_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            MyJobPortalModel.City ObjCity = new MyJobPortalModel.City(int.Parse(e.Row.Cells[1].Text));
            e.Row.Cells[1].Text = ObjCity.CityName;
            MyJobPortalModel.Country ObjCountry = new MyJobPortalModel.Country(int.Parse(e.Row.Cells[2].Text));
            e.Row.Cells[2].Text = ObjCountry.CountryName;
        }
    }
}