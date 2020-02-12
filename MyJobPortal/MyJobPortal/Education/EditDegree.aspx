<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageWithLogin.master" AutoEventWireup="true" CodeFile="EditDegree.aspx.cs" Inherits="Education_EditDegree" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-12">
            <span class="h3">Edit Degree</span>
            <span class="pull-right"><a href="DegreeList.aspx">Back to the List of Degrees</a></span>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-3">
            <label>Degree</label>
            <asp:TextBox runat="server" ID="TxtDegree" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="ReqDegree" CssClass="text-danger" ControlToValidate="TxtDegree" ErrorMessage="Please specify the Degree" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:Label runat="server" ID="LblDuplicateDegreeError" Visible="false" Text="A duplicate Degree already exists in the database" CssClass="text-danger"></asp:Label>
        </div>
    </div>
    <br />
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
            <asp:Button runat="server" ID="BtnUpdate" CssClass="btn btn-default" Text="Update this Degree" OnClick="BtnUpdate_Click" />
        </div>
    </div>
</asp:Content>