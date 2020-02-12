using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class State_StateList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            TxtStateName.Focus();
            this.Form.DefaultButton = BtnGo.UniqueID;
            LblMessage.Text = Request.QueryString["Message"];
            DataTable ObjCountryTable = MyJobPortalModel.Country.GetCountryRecords("status='Active'");
            DdlCountry.DataSource = ObjCountryTable;
            DdlCountry.DataBind();
            DdlCountry.Items.Insert(0, new ListItem("--Select--", "--Select--"));
            ShowGridView();
        }
    }

    protected void BtnGo_Click(object sender, EventArgs e)
    {
        ShowGridView();
        LblMessage.Text = string.Empty;
    }

    public void ShowGridView()
    {
        string strsql = "StateName like'%" + TxtStateName.Text + "%' and status='" + DdlStatus.SelectedValue + "'";
        if (DdlCountry.SelectedIndex != 0)
        {
            strsql += " and CountryId=" + DdlCountry.SelectedValue;
        }
        DataTable ObjStateTable = MyJobPortalModel.State.GetStateRecords(strsql);
        GridView1.DataSource = ObjStateTable;
        GridView1.DataBind();
        LblNumberOfRecords.Text = GridView1.Rows.Count.ToString();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            MyJobPortalModel.Country ObjCountryName = new MyJobPortalModel.Country(int.Parse(e.Row.Cells[1].Text));
            e.Row.Cells[1].Text = ObjCountryName.CountryName;
        }
    }

    protected void LnkBtnEditState_Click(object sender, EventArgs e)
    {
        EditStateModal.Visible = true;
        DataTable ObjCountryTable = MyJobPortalModel.Country.GetCountryRecords("status='Active'");
        DdlCountryEdit.DataSource = ObjCountryTable;
        DdlCountryEdit.DataBind();
        DdlCountryEdit.Items.Insert(0, new ListItem("--Select--", "--Select--"));
        GridViewRow ObjCurrentRow = (GridViewRow)((LinkButton)sender).Parent.Parent;
        int Id = (int)GridView1.DataKeys[ObjCurrentRow.RowIndex]["Id"];
        HdnStateId.Value = Id.ToString();
        MyJobPortalModel.State ObjState = new MyJobPortalModel.State(Id);
        TxtStateNameEdit.Text = ObjState.StateName;
        DdlCountryEdit.SelectedValue = ObjState.CountryId.ToString();
        DdlStatusEdit.SelectedValue = ObjState.Status;
        TxtStateNameEdit.Focus();
        this.Form.DefaultButton = BtnUpdateState.UniqueID;
    }

    protected void LnkBtnCloseState_Click(object sender, EventArgs e)
    {
        EditStateModal.Visible = false;
        TxtStateName.Focus();
        this.Form.DefaultButton = BtnGo.UniqueID;
    }

    protected void BtnUpdateState_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            if ((int)MyJobPortalModel.State.GetStateRecords("StateName='" + TxtStateNameEdit.Text + "' and Id<>"+HdnStateId.Value).Rows.Count > 0)
            {
                LblDuplicateStateNameErrorEdit.Visible = true;
                return;
            }
            else
            {
                MyJobPortalModel.State ObjState = new MyJobPortalModel.State(int.Parse(HdnStateId.Value));
                ObjState.StateName = TxtStateNameEdit.Text;
                ObjState.CountryId = int.Parse(DdlCountryEdit.SelectedValue);
                ObjState.Status = DdlStatusEdit.SelectedValue;
                ObjState.Update();
                EditStateModal.Visible = false;
                TxtStateName.Focus();
                this.Form.DefaultButton = BtnGo.UniqueID;
                LblMessage.Text = TxtStateNameEdit.Text + " has been updated";
                ShowGridView();
            }
        }
    }
}