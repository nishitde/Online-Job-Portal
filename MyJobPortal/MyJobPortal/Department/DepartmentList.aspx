<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageWithLogin.master" AutoEventWireup="true" CodeFile="DepartmentList.aspx.cs" Inherits="Maintenance_Department_DepartmentList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="row">
        <div class="col-12">
            <span class="h3">List of Departments</span>
            <span class="pull-right"><a href="NewDepartment.aspx">Add a New Department</a></span>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-3">
            <label>Department Name Like</label>
            <asp:TextBox runat="server" ID="TxtDepartmentName" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-xs-3">
            <label>Filter by Status</label>
            <asp:DropDownList runat="server" ID="DdlStatus" CssClass="form-control">
                <asp:ListItem>Active</asp:ListItem>
                <asp:ListItem>Inactive</asp:ListItem>
            </asp:DropDownList>
        </div>
                <div class="col-xs-3">
              <label>&nbsp;</label>      <br />
                    <asp:Button OnClick="BtnGo_Click" runat="server" ID="BtnGo" CssClass="btn btn-default" Text="Go" />
                    </div>
    </div>
   <br />
    <div class="row">
        <div class="col-xs-12 text-center">
        Number of Records: <asp:Label runat="server" ID="LblNumberOfRecords"></asp:Label>
            <br />
            <asp:Label runat="server" ID="LblMessage" Visible="true" CssClass="text-success"></asp:Label>
            </div>
    </div>
      <div class="row">
        <div class="col-xs-12">
        <asp:GridView AutoGenerateColumns="false" runat="server" ID="GridView1" CssClass="table table-bordered table-hover">
            <Columns>
                <asp:BoundField HeaderText="Department" DataField="DepartmentName" />
                <asp:BoundField HeaderText="Status" DataField="Status" />
                <asp:HyperLinkField Text="Edit" DataNavigateUrlFields="Id" DataNavigateUrlFormatString="EditDepartment.aspx?ID={0}" />
            </Columns>
        </asp:GridView>
            </div>
              
    </div>
</asp:Content>