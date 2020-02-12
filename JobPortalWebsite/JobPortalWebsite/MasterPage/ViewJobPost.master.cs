using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage_ViewJobPost : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (Request.RawUrl.Contains("ViewJobDescription.aspx"))
            LIJobDescription.Attributes.Add("class", "active");
        if (Request.RawUrl.Contains("ViewRequirements.aspx"))
            LIJobRequirement.Attributes.Add("class", "active");
        if (Request.RawUrl.Contains("ViewInterviewProcess.aspx"))
            LIInterviewProcess.Attributes.Add("class", "active");
        LnkJobDescription.NavigateUrl = LnkJobDescription.NavigateUrl + "?ID=" + Request.QueryString["ID"];
        LnkJobRequirement.NavigateUrl = LnkJobRequirement.NavigateUrl + "?ID=" + Request.QueryString["ID"];
        LnkInterviewProcess.NavigateUrl = LnkInterviewProcess.NavigateUrl + "?ID=" + Request.QueryString["ID"];
    }
}
