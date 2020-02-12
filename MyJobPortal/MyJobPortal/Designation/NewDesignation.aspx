<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageWithLogin.master" AutoEventWireup="true" CodeFile="NewDesignation.aspx.cs" Inherits="Maintenance_Designation_NewDesignation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-12">
            <span class="h3">Add a New Designation</span>
            <span class="pull-right"><a href="DesignationList.aspx">Back to the List of Designations</a></span>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-3">
            <label>Designation Name</label>
            <asp:TextBox runat="server" ID="TxtDesignation" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="ReqDesignation" CssClass="text-danger" ControlToValidate="TxtDesignation" ErrorMessage="Please specify the Designation" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:Label runat="server" ID="LblDuplicateDesignationError" Visible="false" Text="A duplicate Designation already exists in the database" CssClass="text-danger"></asp:Label>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-12">
            <asp:Button runat="server" ID="BtnAdd" CssClass="btn btn-default" Text="Add this Designation" OnClick="BtnAdd_Click" />
        </div>
    </div>
</asp:Content>