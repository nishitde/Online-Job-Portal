<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageWithLogin.master" AutoEventWireup="true" CodeFile="NewState.aspx.cs" Inherits="State_NewState" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-12">
            <span class="h3">Add a New State</span>
            <span class="pull-right"><a href="StateList.aspx">Back to the List of States</a></span>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-12 col-sm-3">
            <label>State Name</label>
            <asp:TextBox runat="server" ID="TxtState" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="ReqState" CssClass="text-danger" ControlToValidate="TxtState" ErrorMessage="Please specify the State" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:Label runat="server" ID="LblDuplicateStateError" Visible="false" Text="A duplicate State already exists in the database" CssClass="text-danger"></asp:Label>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-12 col-sm-3">
            <label>Select Country</label>
            <asp:DropDownList runat="server" ID="DdlCountry" DataTextField="CountryName" DataValueField="Id" CssClass="form-control"></asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" CssClass="text-danger" ControlToValidate="TxtState" ErrorMessage="Please specify the State" Display="Dynamic"></asp:RequiredFieldValidator>
            
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-12">
            <asp:Button runat="server" ID="BtnAdd" CssClass="btn btn-default" Text="Add this State" OnClick="BtnAdd_Click" />
        </div>
    </div>
</asp:Content>