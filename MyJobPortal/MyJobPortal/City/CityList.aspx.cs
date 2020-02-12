using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class City_CityList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            TxtCityName.Focus();
            this.Form.DefaultButton = BtnGo.UniqueID;
            LblMessage.Text = Request.QueryString["Message"];
            DataTable ObjCountryTable = MyJobPortalModel.Country.GetCountryRecords("status='Active'");
            DdlCountry.DataSource = ObjCountryTable;
            DdlCountry.DataBind();
            DdlCountry.Items.Insert(0, new ListItem("--Select--", "--Select--"));
            DdlState.Items.Add(new ListItem("--Select--", "--Select--"));
            ShowGridView();
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

    protected void BtnGo_Click(object sender, EventArgs e)
    {
        ShowGridView();
        LblMessage.Text = string.Empty;
    }
    public void ShowGridView()
    {
        string strsql = "CityName like'%" + TxtCityName.Text + "%' and status='" + DdlStatus.SelectedValue + "'";
        if (DdlCountry.SelectedIndex != 0)
        {
            strsql += " and CountryId=" + DdlCountry.SelectedValue;
        }
        if (DdlState.SelectedIndex != 0)
        {
            strsql += "and StateId=" + DdlState.SelectedValue;
        }
        DataTable ObjCityTable = MyJobPortalModel.City.GetCityRecords(strsql);
        GridView1.DataSource = ObjCityTable;
        GridView1.DataBind();
        LblNumberOfRecords.Text = GridView1.Rows.Count.ToString();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            MyJobPortalModel.Country ObjCountryName = new MyJobPortalModel.Country(int.Parse(e.Row.Cells[2].Text));
            e.Row.Cells[2].Text = ObjCountryName.CountryName;
            MyJobPortalModel.State ObjStateName = new MyJobPortalModel.State(int.Parse(e.Row.Cells[1].Text));
            e.Row.Cells[1].Text = ObjStateName.StateName;
        }
    }

    protected void LnkBtnEditCity_Click(object sender, EventArgs e)
    {
        EditCityModal.Visible = true;
        DataTable ObjCountryTable = MyJobPortalModel.Country.GetCountryRecords("status='Active'");
        DdlCountryEdit.DataSource = ObjCountryTable;
        DdlCountryEdit.DataBind();
        DdlCountryEdit.Items.Insert(0, new ListItem("--Select--", "--Select--"));
        DdlStateEdit.Items.Add(new ListItem("--Select--", "--Select--"));
        GridViewRow ObjCurrentRow = (GridViewRow)((LinkButton)sender).Parent.Parent;
        int Id = (int)GridView1.DataKeys[ObjCurrentRow.RowIndex]["Id"];
        HdnCityId.Value = Id.ToString();
        MyJobPortalModel.City ObjCityRecord = new MyJobPortalModel.City(Id);
        TxtCityNameEdit.Text = ObjCityRecord.CityName;
        DdlCountryEdit.SelectedValue = ObjCityRecord.CountryId.ToString();
        DataTable ObjStateTable = MyJobPortalModel.State.GetStateRecords("status='Active' and CountryId=" + DdlCountryEdit.SelectedValue);
        DdlStateEdit.DataSource = ObjStateTable;
        DdlStateEdit.DataBind();
        DdlStateEdit.Items.Insert(0, new ListItem("--Select--", "--Select--"));
        DdlStateEdit.SelectedValue = ObjCityRecord.StateId.ToString();
        DdlStatusEdit.SelectedValue = ObjCityRecord.Status.ToString();
    }

    protected void DdlCountryEdit_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DdlCountryEdit.SelectedIndex != 0)
        {
            DataTable ObjStateTable = MyJobPortalModel.State.GetStateRecords("status='Active' and CountryId=" + DdlCountryEdit.SelectedValue);
            DdlStateEdit.DataSource = ObjStateTable;
            DdlStateEdit.DataBind();
            DdlStateEdit.Items.Insert(0, new ListItem("--Select--", "--Select--"));
        }
        else
        {
            DdlStateEdit.Items.Clear();
            DdlStateEdit.Items.Add(new ListItem("--Select--", "--Select--"));
        }
        EditCityModal.Visible = true;
    }

    protected void LnkBtnCloseCity_Click(object sender, EventArgs e)
    {
        EditCityModal.Visible = false;
        TxtCityName.Focus();
        this.Form.DefaultButton = BtnGo.UniqueID;
    }

    protected void BtnUpdateCity_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            if ((int)MyJobPortalModel.City.GetCityRecords("CityName='" + TxtCityNameEdit.Text + "' and Id<>" + HdnCityId.Value).Rows.Count > 0)
            {
                LblDuplicateCityNameErrorEdit.Visible = true;
                return;
            }
            else
            {
                MyJobPortalModel.City ObjNewCity = new MyJobPortalModel.City(int.Parse(HdnCityId.Value));
                ObjNewCity.CityName = TxtCityNameEdit.Text;
                ObjNewCity.CountryId = int.Parse(DdlCountryEdit.SelectedValue);
                ObjNewCity.StateId = int.Parse(DdlStateEdit.SelectedValue);
                ObjNewCity.Status = DdlStatus.SelectedValue;
                ObjNewCity.Update();
                EditCityModal.Visible = false;
                TxtCityName.Focus();
                this.Form.DefaultButton = BtnGo.UniqueID;
                ShowGridView();
            }
        }
    }
}