using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPages_ViewCompany : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            MyJobPortalModel.CompanyDetails ObjCompany = new MyJobPortalModel.CompanyDetails(int.Parse(Request.QueryString["Id"]));
            LblCompanyName.Text = ObjCompany.CompanyName;
            if (Request.RawUrl.Contains("ViewCompany.aspx"))
                LICompanyDetails.Attributes.Add("class", "active");
            if (Request.RawUrl.Contains("ViewBranchDetails.aspx"))
                LIBranchDetails.Attributes.Add("class", "active");
            if (Request.RawUrl.Contains("ViewHiringManager.aspx"))
                LIHiringManager.Attributes.Add("class", "active");
            if (Request.RawUrl.Contains("ViewQuestionAnswer.aspx"))
                LIQuestionAnswer.Attributes.Add("class", "active");
            LnkGeneralDetails.NavigateUrl = LnkGeneralDetails.NavigateUrl + "?ID=" + Request.QueryString["ID"];
            LnkVendorshipDetails.NavigateUrl = LnkVendorshipDetails.NavigateUrl + "?ID=" + Request.QueryString["ID"];
            LnkHiringManager.NavigateUrl= LnkHiringManager.NavigateUrl + "?ID=" + Request.QueryString["ID"];
            LnkQuestionAnswer.NavigateUrl = LnkQuestionAnswer.NavigateUrl + "?ID=" + Request.QueryString["ID"];
        }
    }
}
