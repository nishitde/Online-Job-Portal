using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Skills_SkillList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            TxtSkillName.Focus();
            this.Form.DefaultButton = BtnGo.UniqueID;
            LblMessage.Text = Request.QueryString["Message"];
            DataTable ObjSkillTypeTable = MyJobPortalModel.SkillType.GetSkillTypeRecords("status='Active'");
            DdlSkillType.DataSource = ObjSkillTypeTable;
            DdlSkillType.DataBind();
            DdlSkillType.Items.Insert(0, new ListItem("--Select--", "--Select--"));
            ShowGridView();
        }
    }

    protected void BtnGo_Click(object sender, EventArgs e)
    {
        ShowGridView();
    }

    public void ShowGridView()
    {
        string strsql = "SkillName like'%" + TxtSkillName.Text + "%' and status='" + DdlStatus.SelectedValue + "'";
        if (DdlSkillType.SelectedIndex != 0)
        {
            strsql += " and SkillTypeId=" + DdlSkillType.SelectedValue;
        }
        DataTable ObjSkillTable = MyJobPortalModel.Skills.GetSkillsRecords(strsql);
        GridView1.DataSource = ObjSkillTable;
        GridView1.DataBind();
        LblNumberOfRecords.Text = GridView1.Rows.Count.ToString();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            MyJobPortalModel.SkillType ObjSkillTypeName = new MyJobPortalModel.SkillType(int.Parse(e.Row.Cells[1].Text));
            e.Row.Cells[1].Text = ObjSkillTypeName.SkillTypeName;
        }
    }
}