﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MyJobPortalModel;

public partial class Maintenance_Department_DepartmentList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {

            TxtDepartmentName.Focus();
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
        DataTable ObjTable = MyJobPortalModel.Department.GetDepartmentRecords("DepartmentName like '%" + TxtDepartmentName.Text + "%' and status='" + DdlStatus.SelectedValue + "'");
        GridView1.DataSource = ObjTable;
        GridView1.DataBind();
        LblNumberOfRecords.Text = ObjTable.Rows.Count.ToString();

    }
}