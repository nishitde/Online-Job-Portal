using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Company_ViewCompany : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            MyJobPortalModel.CompanyDetails ObjCompanyTable = new MyJobPortalModel.CompanyDetails(int.Parse(Request.QueryString["Id"]));
            //throw new Exception((string)ObjCompanyTable.Rows.Count.ToString());
            LblCompanyName.Text = ObjCompanyTable.CompanyName;
            LblWebsiteURL.Text= ObjCompanyTable.WebsiteURL;
            LblIndustry.Text = MyJobPortalModel.Industry.GetIndustryRecords("Id="+ObjCompanyTable.IndustryID).Rows[0]["Industryname"].ToString();
            LblDescription.Text= ObjCompanyTable.Description;
        }
    }

    protected void LnkBtnEditCompanyDetails_Click(object sender, EventArgs e)
    {
        EditCompanyModal.Visible = true;
        DataTable ObjIndustryTable = MyJobPortalModel.Industry.GetIndustryRecords("status='Active'");
        DdlIndustry.DataSource = ObjIndustryTable;
        DdlIndustry.DataBind();
        DdlIndustry.Items.Insert(0, new ListItem("--Select--", "--Select--"));
        MyJobPortalModel.CompanyDetails ObjCompanDetails = new MyJobPortalModel.CompanyDetails(int.Parse(Request.QueryString["Id"]));
        TxtCompanyName.Text = ObjCompanDetails.CompanyName;
        TxtWebsiteURL.Text = ObjCompanDetails.WebsiteURL;
        TxtDescription.Text = ObjCompanDetails.Description;
        DdlStatus.SelectedValue = ObjCompanDetails.Status;
        DdlIndustry.SelectedValue = ObjCompanDetails.IndustryID.ToString();
    }

    protected void BtnUpdateCompany_Click(object sender, EventArgs e)
    {
        if(this.IsValid==true)
        {
            if(MyJobPortalModel.CompanyDetails.GetCompanyDetailsRecords("CompanyName='"+TxtCompanyName.Text+"' and Id<>"+Request.QueryString["Id"]).Rows.Count>0)
            {
                LblDuplicateCompanyError.Visible = true;
                TxtCompanyName.Focus();
                return;
            }
            MyJobPortalModel.CompanyDetails ObjCompany = new MyJobPortalModel.CompanyDetails(int.Parse(Request.QueryString["Id"]));
            ObjCompany.CompanyName = TxtCompanyName.Text;
            ObjCompany.WebsiteURL = TxtWebsiteURL.Text;
            ObjCompany.IndustryID = int.Parse(DdlIndustry.SelectedValue);
            ObjCompany.Description = TxtDescription.Text;
            ObjCompany.Status = DdlStatus.SelectedValue;
            ObjCompany.Update();
            EditCompanyModal.Visible = false;
            Response.Redirect("ViewCompany.aspx?Id=" + Request.QueryString["Id"]);
        }
    }

    protected void LnkBtnCloseCompany_Click(object sender, EventArgs e)
    {
        EditCompanyModal.Visible = false;
    }
}