﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPageForViewer.master" AutoEventWireup="true" CodeFile="CompanyList.aspx.cs" Inherits="Company_CompanyList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-xs-12">
            <span class="h3" style="color:#344154;text-transform:uppercase">List Of Companies</span>
            <br />
            <span class="pull-right"><a class="btn btn-info" href="NewCompany.aspx">Add a new Company</a></span>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-3">
            <h5>Company Name Like</h5>
            <asp:TextBox runat="server" ID="TxtCompanyName" CssClass="form-control"></asp:TextBox>
        </div>
        
        <div class="col-xs-12 col-sm-2">
            <h5>&nbsp;</h5>
            <asp:Button runat="server" ID="BtnGo" Text="Go" CssClass="form-control" OnClick="BtnGo_Click"></asp:Button>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="text-center">
            <h5>Number Of Records: <asp:Label runat="server" ID="LblNumberOfRecords" Text=""></asp:Label>
            <br />
            <asp:Label runat="server" ID="LblMessage" Visible="true" CssClass="text-success"></asp:Label></h5>
        </div>
    </div>
    <br />
    <div class="table-responsive">
        <div class="col-xs-12">
            <asp:GridView runat="server" HeaderStyle-BackColor="#344154" Font-Size="Large" RowStyle-BackColor="White" HeaderStyle-ForeColor="White" BorderColor="#ff00ff" ID="GridView1" OnRowDataBound="GridView1_RowDataBound" CssClass="table table-bordered table-hover" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField HeaderText="CompanyName" DataField="CompanyName" />
                    <asp:BoundField HeaderText="Website" DataField="WebsiteURL" />
                    <asp:BoundField HeaderText="Industry" DataField="IndustryId" />
                    <asp:HyperLinkField HeaderText="View" DataNavigateUrlFields="Id" Text="View" DataNavigateUrlFormatString="ViewCompany.aspx?ID={0}" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>