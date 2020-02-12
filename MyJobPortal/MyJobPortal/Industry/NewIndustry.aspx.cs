using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Industry_NewIndustry : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            this.Form.DefaultButton = BtnAdd.UniqueID;
            TxtIndustry.Focus();
        }
    }

    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            if ((int)MyJobPortalModel.Industry.GetIndustryRecords("IndustryName='" + TxtIndustry.Text.Replace("'", "''") + "'").Rows.Count > 0)
            {
                LblDuplicateIndustryError.Visible = true;
                return;
            }
            else
            {
                MyJobPortalModel.Industry.AddIndustry(TxtIndustry.Text.Replace("'", "''").Trim(), "Active");
                Response.Redirect("IndustryList.aspx?Message=Record has been Added");
            }
        }
    }
}