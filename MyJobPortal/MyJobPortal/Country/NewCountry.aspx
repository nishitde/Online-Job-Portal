<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageWithLogin.master" AutoEventWireup="true" CodeFile="NewCountry.aspx.cs" Inherits="Country_NewCountry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-12">
            <span class="h3">Add a New Country</span>
            <span class="pull-right"><a href="CountryList.aspx">Back to the List of Countrys</a></span>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-12 col-sm-3">
            <label>Country Name</label>
            <asp:TextBox runat="server" ID="TxtCountry" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="ReqCountry" CssClass="text-danger" ControlToValidate="TxtCountry" ErrorMessage="Please specify the Country" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:Label runat="server" ID="LblDuplicateCountryError" Visible="false" Text="A duplicate Country already exists in the database" CssClass="text-danger"></asp:Label>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-12">
            <asp:Button runat="server" ID="BtnAdd" CssClass="btn btn-default" Text="Add this Country" OnClick="BtnAdd_Click" />
        </div>
    </div>
</asp:Content>