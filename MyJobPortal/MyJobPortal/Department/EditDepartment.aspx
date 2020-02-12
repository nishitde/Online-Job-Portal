<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageWithLogin.master" AutoEventWireup="true" CodeFile="EditDepartment.aspx.cs" Inherits="Maintenance_Department_EditDepartment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-12">
            <span class="h3">Edit Department</span>
            <span class="pull-right"><a href="DepartmentList.aspx">Back to the List of Departments</a></span>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-3">
            <label>Department</label>
            <asp:TextBox runat="server" ID="TxtDepartment" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="ReqDepartment" CssClass="text-danger" ControlToValidate="TxtDepartment" ErrorMessage="Please specify the Department" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:Label runat="server" ID="LblDuplicateDepartmentError" Visible="false" Text="A duplicate Department already exists in the database" CssClass="text-danger"></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-3">
            <label>Status</label>
            <asp:DropDownList runat="server" ID="DdlStatus" CssClass="form-control">
                <asp:ListItem>Active</asp:ListItem>
                <asp:ListItem>Inactive</asp:ListItem>
            </asp:DropDownList>
       </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-12">
            <asp:Button runat="server" ID="BtnUpdate" CssClass="btn btn-default" Text="Update this Department" OnClick="BtnUpdate_Click" />
        </div>
    </div>
</asp:Content>