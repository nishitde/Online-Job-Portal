using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Country_CountryList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {

            TxtCountryName.Focus();
            this.Form.DefaultButton = BtnGo.UniqueID;
            LblMessage.Text = Request.QueryString["Message"];
            ShowGridView();
        }
        
    }

    protected void BtnGo_Click(object sender, EventArgs e)
    {
        ShowGridView();
        LblMessage.Text = "";
    }

    public void ShowGridView()
    {
        DataTable ObjTable = MyJobPortalModel.Country.GetCountryRecords("CountryName like '%" + TxtCountryName.Text + "%' and status='" + DdlStatus.SelectedValue + "'");
        GridView1.DataSource = ObjTable;
        GridView1.DataBind();
        LblNumberOfRecords.Text = ObjTable.Rows.Count.ToString();

    }

    protected void LnkBtnEditCountry_Click(object sender, EventArgs e)
    {
        EditCountryModal.Visible = true;
        TxtCountryNameEdit.Focus();
        this.Form.DefaultButton = BtnGo.UniqueID;
        GridViewRow ObjCurrentRow = (GridViewRow)((LinkButton)sender).Parent.Parent;
        int Id = (int)GridView1.DataKeys[ObjCurrentRow.RowIndex]["Id"];
        HdnCountryId.Value = Id.ToString();
        MyJobPortalModel.Country ObjCountry = new MyJobPortalModel.Country(Id);
        TxtCountryNameEdit.Text = ObjCountry.CountryName;
    }

    protected void BtnUpdateCountry_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            bool AllOk = true;
            if ((int)MyJobPortalModel.Country.GetCountryRecords("CountryName='" + TxtCountryNameEdit.Text + "' and Id<>" + int.Parse(HdnCountryId.Value)).Rows.Count > 0)
            {
                LblDuplicateCountryNameError.Visible = true;
                AllOk = false;
            }
            if (AllOk == true)
            {
                MyJobPortalModel.Country ObjCountry = new MyJobPortalModel.Country(int.Parse(HdnCountryId.Value));
                ObjCountry.CountryName = TxtCountryNameEdit.Text;
                ObjCountry.Status = DdlStatusEdit.SelectedValue;
                ObjCountry.Update();
                EditCountryModal.Visible = false;
                LblMessage.Text = "" + TxtCountryNameEdit.Text + " has been updated";
                ShowGridView();
            }
        }
    }

    protected void LnkBtnCloseCountry_Click(object sender, EventArgs e)
    {
        EditCountryModal.Visible = false;
        this.Form.DefaultButton = BtnGo.UniqueID;
        TxtCountryName.Focus();
    }
}