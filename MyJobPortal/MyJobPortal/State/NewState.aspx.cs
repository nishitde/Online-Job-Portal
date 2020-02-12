using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class State_NewState : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            TxtState.Focus();
            this.Form.DefaultButton = BtnAdd.UniqueID;
            DataTable ObjCountryTable = MyJobPortalModel.Country.GetCountryRecords("status='Active'");
            DdlCountry.DataSource = ObjCountryTable;
            DdlCountry.DataBind();
            DdlCountry.Items.Insert(0, new ListItem("--Select--", "--Select--"));
        }
    }

    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            bool AllOk = true;
            if ((int)MyJobPortalModel.State.GetStateRecords("StateName='" + TxtState.Text + "'").Rows.Count > 0)
            {
                LblDuplicateStateError.Visible = true;
                AllOk = false;
                return;

            }
            if(AllOk==true)
            {
                MyJobPortalModel.State.AddState(TxtState.Text, Int32.Parse(DdlCountry.SelectedValue), "Active");
                Response.Redirect("StateList.aspx?Message=New record has been added");
            }
        }
    }
}