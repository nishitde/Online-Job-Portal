<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageWithLogin.master" AutoEventWireup="true" CodeFile="EditDesignation.aspx.cs" Inherits="Maintenance_Designation_EditDesignation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-12">
            <span class="h3">Edit Designation</span>
            <span class="pull-right"><a href="DesignationList.aspx">Back to the List of Designations</a></span>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-3">
            <label>Designation</label>
            <asp:TextBox runat="server" ID="TxtDesignation" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="ReqDesignation" CssClass="text-danger" ControlToValidate="TxtDesignation" ErrorMessage="Please specify the Designation" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:Label runat="server" ID="LblDuplicateDesignationError" Visible="false" Text="A duplicate Designation already exists in the database" CssClass="text-danger"></asp:Label>
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
            <asp:Button runat="server" ID="BtnUpdate" CssClass="btn btn-default" Text="Update this Designation" OnClick="BtnUpdate_Click" />
        </div>
    </div>
</asp:Content>