using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Country_NewCountry : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            TxtCountry.Focus();
            this.Form.DefaultButton = BtnAdd.UniqueID;
        }
    }

    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            if (MyJobPortalModel.Country.GetCountryRecords("CountryName='" + TxtCountry.Text + "'").Rows.Count > 0)
            {
                LblDuplicateCountryError.Visible = true;
                return;
            }
            else
            {
                MyJobPortalModel.Country.AddCountry(TxtCountry.Text, "Active");
                Response.Redirect("CountryList.aspx?Message=New Country has been Added");
            }
        }
    }
}