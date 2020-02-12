<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageWithLogin.master" AutoEventWireup="true" CodeFile="DesignationList.aspx.cs" Inherits="Maintenance_Designation_DesignationList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-12">
            <span class="h3">List of Designations</span>
            <span class="pull-right"><a href="NewDesignation.aspx">Add a New Designation</a></span>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-3">
            <label>Designation Name Like</label>
            <asp:TextBox runat="server" ID="TxtDesignationName" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-xs-3">
            <label>Filter by Status</label>
            <asp:DropDownList runat="server" ID="DdlStatus" CssClass="form-control">
                <asp:ListItem>Active</asp:ListItem>
                <asp:ListItem>Inactive</asp:ListItem>
            </asp:DropDownList>
        </div>
                <div class="col-xs-3">
              <label>&nbsp;</label>      <br />
                    <asp:Button OnClick="BtnGo_Click" runat="server" ID="BtnGo" CssClass="btn btn-default" Text="Go" />
                    </div>
    </div>
   <br />
    <div class="row">
        <div class="col-xs-12 text-center">
        Number of Records: <asp:Label runat="server" ID="LblNumberOfRecords"></asp:Label>
            <br />
            <asp:Label runat="server" ID="LblMessage" Visible="true" CssClass="text-success"></asp:Label>
            </div>
    </div>
      <div class="row">
        <div class="col-xs-12">
        <asp:GridView AutoGenerateColumns="false" runat="server" ID="GridView1" CssClass="table table-bordered table-hover">
            <Columns>
                <asp:BoundField HeaderText="Designation" DataField="DesignationName" />
                <asp:BoundField HeaderText="Status" DataField="Status" />
                <asp:HyperLinkField Text="Edit" DataNavigateUrlFields="Id" DataNavigateUrlFormatString="EditDegree.aspx?ID={0}" />
            </Columns>
        </asp:GridView>
            </div>
              
    </div>
</asp:Content>