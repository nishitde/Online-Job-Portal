<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageWithLogin.master" AutoEventWireup="true" CodeFile="NewTitle.aspx.cs" Inherits="Maintenance_Titles_NewTitle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-12">
            <span class="h3">Add a New Title</span>
            <span class="pull-right"><a href="TitleList.aspx">Back to the List of Titles</a></span>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-12 col-sm-3">
            <label>Title</label>
            <asp:TextBox runat="server" ID="TxtTitle" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="ReqTitle" CssClass="text-danger" ControlToValidate="TxtTitle" ErrorMessage="Please specify the Title" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:Label runat="server" ID="LblDuplicateTitleError" Visible="false" Text="A duplicate Title already exists in the database" CssClass="text-danger"></asp:Label>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-12 col-sm-3">
            <label>Applicable to Gender</label>
            <asp:DropDownList runat="server" ID="DdlGender" CssClass="form-control">
                <asp:ListItem Text="--Select--" Value="--Select--"></asp:ListItem>
                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="ReqGender" CssClass="text-danger" ControlToValidate="DdlGender" ErrorMessage="Please select Gender" InitialValue="--Select--" Display="Dynamic"></asp:RequiredFieldValidator>
            
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-12">
            <asp:Button runat="server" ID="BtnAdd" CssClass="btn btn-default" Text="Add this Title" OnClick="BtnAdd_Click" />
        </div>
    </div>
</asp:Content>

