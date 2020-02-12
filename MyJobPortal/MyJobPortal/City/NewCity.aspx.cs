using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class City_NewCity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            TxtCity.Focus();
            this.Form.DefaultButton = BtnAdd.UniqueID;
            DataTable ObjCountryTable = MyJobPortalModel.Country.GetCountryRecords("status='Active'");
            DdlCountry.DataSource = ObjCountryTable;
            DdlCountry.DataBind();
            DdlCountry.Items.Insert(0, new ListItem("--Select--", "--Select--"));
            DdlState.Items.Add(new ListItem("--Select--", "--Select--"));
        }
    }

    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            if ((int)MyJobPortalModel.City.GetCityRecords("CityName='" + TxtCity.Text + "'").Rows.Count > 0)
            {
                LblDuplicateCityError.Visible = true;
                return;
            }
            else
            {
                MyJobPortalModel.City.AddCity(TxtCity.Text, int.Parse(DdlState.SelectedValue), int.Parse(DdlCountry.SelectedValue), "Active");
                Response.Redirect("CityList.aspx?Message=New record has been Added");
            }
        }
    }



    protected void DdlCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DdlCountry.SelectedIndex != 0)
        {
            DataTable ObjStateTable = MyJobPortalModel.State.GetStateRecords("status='Active' and CountryId=" + DdlCountry.SelectedValue);
            DdlState.DataSource = ObjStateTable;
            DdlState.DataBind();
            DdlState.Items.Insert(0, new ListItem("--Select--", "--Select--"));
        }
        else
        {
            DdlState.Items.Clear();
            DdlState.Items.Add(new ListItem("--Select--", "--Select--"));
        }
    }
}