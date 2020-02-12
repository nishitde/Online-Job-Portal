<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/ViewJobPost.master" AutoEventWireup="true" CodeFile="ViewJobDescription.aspx.cs" Inherits="JobPost_ViewJobDescription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" Runat="Server">
    <div class="row">
        <div class="col-xs-12">
            <span class="h3">Job Description</span>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-12 col-sm-2">
            <span class="h4">Job Title : </span>
        </div>
        <div class="col-xs-12 col-sm-6">
            <asp:Label runat="server" ID="LblJobTitle" Text="example 1" Font-Bold="true" CssClass="h4"></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-2">
            <span class="h4">Company : </span>
        </div>
        <div class="col-xs-12 col-sm-6">
            <asp:Label runat="server" ID="LblCompanyName" Text="example 1" Font-Bold="true" CssClass="h4"></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-2">
            <span class="h4">Branches : </span>
        </div>
    </div>
    <div class="row">
        <asp:GridView runat="server" ID="GridViewBranches" AutoGenerateColumns="false" OnRowDataBound="GridViewBranches_RowDataBound" CssClass="table table-bordered table-hover table-responsive">
            <Columns>
                <asp:BoundField HeaderText="Branch Name" DataField="BranchName" />
                <asp:BoundField HeaderText="City" DataField="CityId" />
            </Columns>
        </asp:GridView>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-2">
            <span class="h4">Department : </span>
        </div>
        <div class="col-xs-12 col-sm-6">
            <asp:Label runat="server" ID="LblDeparment" Text="example 1" Font-Bold="true" CssClass="h4"></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-2">
            <span class="h4">Job Type : </span>
        </div>
        <div class="col-xs-12 col-sm-6">
            <asp:Label runat="server" ID="LblJobType" Text="example 1" Font-Bold="true" CssClass="h4"></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-2">
            <span class="h4">Applicable to Gender : </span>
        </div>
        <div class="col-xs-12 col-sm-6">
            <asp:Label runat="server" ID="LblGender" Text="example 1" Font-Bold="true" CssClass="h4"></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-2">
            <span class="h4">Min Salary : </span>
        </div>
        <div class="col-xs-12 col-sm-6">
            <asp:Label runat="server" ID="LblMinSalary" Text="example 1" Font-Bold="true" CssClass="h4"></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-2">
            <span class="h4">Max Salary : </span>
        </div>
        <div class="col-xs-12 col-sm-6">
            <asp:Label runat="server" ID="LblMaxSalary" Text="example 1" Font-Bold="true" CssClass="h4"></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-2">
            <span class="h4">Job Description : </span>
        </div>
        <div class="col-xs-12 col-sm-8">
            <asp:TextBox runat="server" ID="TxtJobDescription" Height="300" Width="600" Text="example 1" CssClass="h4"></asp:TextBox>
        </div>
    </div>
    <br />
</asp:Content>

