using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MyJobPortalModel;

public partial class Maintenance_Titles_TitleList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            
            TxtTitleName.Focus();
            this.Form.DefaultButton = BtnGo.UniqueID;
            ShowGridView();
        }
        LblMessage.Text = Request.QueryString["Message"];
    }

    protected void BtnGo_Click(object sender, EventArgs e)
    {
        ShowGridView();
    }

    public void ShowGridView()
    {
        DataTable ObjTable = MyJobPortalModel.Title.GetTitleRecords("TitleName like '%" + TxtTitleName.Text + "%' and status='" + DdlStatus.SelectedValue + "'");
        GridView1.DataSource = ObjTable;
        GridView1.DataBind();
        LblNumberOfRecords.Text = ObjTable.Rows.Count.ToString();

    }
}