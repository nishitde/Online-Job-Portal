<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageWithLogin.master" AutoEventWireup="true" CodeFile="NewCity.aspx.cs" Inherits="City_NewCity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-12">
            <span class="h3">Add a New City</span>
            <span class="pull-right"><a href="CityList.aspx">Back to the List of Cities</a></span>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-12 col-sm-3">
            <label>City Name</label>
            <asp:TextBox runat="server" ID="TxtCity" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="ReqCity" CssClass="text-danger" ControlToValidate="TxtCity" ErrorMessage="Please specify the City" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:Label runat="server" ID="LblDuplicateCityError" Visible="false" Text="A duplicate City already exists in the database" CssClass="text-danger"></asp:Label>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-12 col-sm-3">
            <label>Select Country</label>
            <asp:DropDownList runat="server" CausesValidation="false" EnableViewState="true" AutoPostBack="true" OnSelectedIndexChanged="DdlCountry_SelectedIndexChanged" ID="DdlCountry" DataTextField="CountryName" DataValueField="Id" CssClass="form-control"></asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="ReqDdlCountry" InitialValue="--Select--" ControlToValidate="DdlCountry" ErrorMessage="Please select a Country" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-12 col-sm-3">
            <label>Select State</label>
            <asp:DropDownList runat="server" ID="DdlState" DataTextField="StateName" DataValueField="Id" CssClass="form-control"></asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="ReqDdlState" CssClass="text-danger" InitialValue="--Select--" ControlToValidate="DdlState" ErrorMessage="Please select State" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </div>
    
    <br />
    <div class="row">
        <div class="col-xs-12">
            <asp:Button runat="server" ID="BtnAdd" CssClass="btn btn-default" Text="Add this City" OnClick="BtnAdd_Click" />
        </div>
    </div>
</asp:Content>