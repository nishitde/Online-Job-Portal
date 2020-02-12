using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MyJobPortalModel;

public partial class Maintenance_Titles_NewTitle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            TxtTitle.Focus();
            this.Form.DefaultButton = BtnAdd.UniqueID;
        }
        LblDuplicateTitleError.Visible = false;
    }

    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            bool AllOk = true;
            DataTable ObjDataTable = MyJobPortalModel.Title.GetTitleRecords("TitleName='" + TxtTitle.Text.Replace("'", "''").Trim() + "'");
            if ((int)ObjDataTable.Rows.Count > 0)
            {
                AllOk = false;
                LblDuplicateTitleError.Visible = true;
                return;
            }
            if (AllOk == true)
            {
                MyJobPortalModel.Title.AddTitle(TxtTitle.Text.Replace("'", "''").Trim(), "Active");
                Response.Redirect("TitleList.aspx?Message=New Title Has Been Added");
            }
        }
    }
}