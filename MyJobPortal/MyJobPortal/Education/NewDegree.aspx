<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageWithLogin.master" AutoEventWireup="true" CodeFile="NewDegree.aspx.cs" Inherits="Education_NewDegree" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-12">
            <span class="h3">Add a New Degree</span>
            <span class="pull-right"><a href="DegreeList.aspx">Back to the List of Degrees</a></span>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-3">
            <label>Degree Name</label>
            <asp:TextBox runat="server" ID="TxtDegree" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="ReqDegree" CssClass="text-danger" ControlToValidate="TxtDegree" ErrorMessage="Please specify the Degree" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:Label runat="server" ID="LblDuplicateDegreeError" Visible="false" Text="A duplicate Degree already exists in the database" CssClass="text-danger"></asp:Label>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-12">
            <asp:Button runat="server" ID="BtnAdd" CssClass="btn btn-default" Text="Add this Degree" OnClick="BtnAdd_Click" />
        </div>
    </div>
</asp:Content>