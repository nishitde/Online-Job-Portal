using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Company_CompanyList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TxtCompanyName.Focus();
        this.Form.DefaultButton = BtnGo.UniqueID;
        ShowGridView();
    }

    protected void BtnGo_Click(object sender, EventArgs e)
    {
        ShowGridView();
    }

    public void ShowGridView()
    {
        DataTable ObjCompanyTable = MyJobPortalModel.CompanyDetails.GetCompanyDetailsRecords("CompanyName like'%" + TxtCompanyName.Text + "%'");
        GridView1.DataSource = ObjCompanyTable;
        GridView1.DataBind();
        LblNumberOfRecords.Text = GridView1.Rows.Count.ToString();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            MyJobPortalModel.Industry ObjIndustry = new MyJobPortalModel.Industry(int.Parse(e.Row.Cells[2].Text));
            e.Row.Cells[2].Text = ObjIndustry.IndustryName;
        }
    }
}