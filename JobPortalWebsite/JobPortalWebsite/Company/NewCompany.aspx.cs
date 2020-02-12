using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MyJobPortalModel;

public partial class Company_NewCompany : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            LblDuplicateCompanyName.Visible = false;
            TxtCompanyName.Focus();
            this.Form.DefaultButton = BtnAddCompany.UniqueID;
            DataTable ObjIndustryTable = MyJobPortalModel.Industry.GetIndustryRecords("status='Active'");
            DdlIndustryName.DataSource = ObjIndustryTable;
            DdlIndustryName.DataBind();
            DdlIndustryName.Items.Insert(0, new ListItem("--Select--", "--Select--"));
            DataTable ObjCountryTable = MyJobPortalModel.Country.GetCountryRecords("status='Active'");
            DdlCountry.DataSource = ObjCountryTable;
            DdlCountry.DataBind();
            DdlCountry.Items.Insert(0, new ListItem("--Select Country--", "--Select--"));
            DdlState.Items.Add(new ListItem("--Select State--", "--Select--"));
            DdlCity.Items.Add(new ListItem("--Select City--", "--Select--"));
        }
    }

    protected void BtnAddCompany_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            bool AllOk = true;
            if ((int)MyJobPortalModel.CompanyDetails.GetCompanyDetailsRecords("CompanyName='" + TxtCompanyName.Text.Replace("'", "''").Trim() + "'").Rows.Count > 0)
            {
                AllOk = false;
                LblDuplicateCompanyName.Visible = true;
                return;
            }
            if (AllOk == true)
            {
                int CompanyID = MyJobPortalModel.CompanyDetails.AddCompanyDetails(TxtCompanyName.Text, TxtWebsiteURL.Text,int.Parse(DdlIndustryName.SelectedValue),TxtDescription.Text, "Active");
                MyJobPortalModel.Branch.AddBranch(CompanyID, TxtBranchName.Text, TxtAddressLine1.Text, TxtAddressLine2.Text, int.Parse(DdlCity.SelectedValue), TxtPinCode.Text, int.Parse(DdlState.SelectedValue), int.Parse(DdlCountry.SelectedValue), TxtPhoneNumber1.Text, TxtPhoneNumber2.Text, TxtEmail1.Text, TxtEmail2.Text);
                Response.Redirect("CompanyList.aspx");
            }
        }
    }


    protected void DdlCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable ObjStateTable = MyJobPortalModel.State.GetStateRecords("countryId=" + DdlCountry.SelectedValue + " and status='Active'");
        DdlState.DataSource = ObjStateTable;
        DdlState.DataBind();
        DdlState.Items.Insert(0,new ListItem("--Select State--", "--Select--"));
    }

    protected void DdlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable objCityTable = MyJobPortalModel.City.GetCityRecords("stateId=" + DdlState.SelectedValue + "and status='Active'");
        DdlCity.DataSource = objCityTable;
        DdlCity.DataBind();
        DdlCity.Items.Insert(0,new ListItem("--Select City--", "--Select--"));
    }
}