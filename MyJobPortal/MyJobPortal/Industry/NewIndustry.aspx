<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageWithLogin.master" AutoEventWireup="true" CodeFile="NewIndustry.aspx.cs" Inherits="Industry_NewIndustry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-12">
            <span class="h3">Add a New Industry</span>
            <span class="pull-right"><a href="IndustryList.aspx">Back to the List of Industrys</a></span>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-3">
            <label>Industry Name</label>
            <asp:TextBox runat="server" ID="TxtIndustry" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="ReqIndustry" CssClass="text-danger" ControlToValidate="TxtIndustry" ErrorMessage="Please specify the Industry name" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:Label runat="server" ID="LblDuplicateIndustryError" Visible="false" Text="A duplicate Industry already exists in the database" CssClass="text-danger"></asp:Label>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-12">
            <asp:Button runat="server" ID="BtnAdd" CssClass="btn btn-default" Text="Add this Industry" OnClick="BtnAdd_Click" />
        </div>
    </div>
</asp:Content>