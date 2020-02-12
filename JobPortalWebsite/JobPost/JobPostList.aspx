<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPageForViewer.master" AutoEventWireup="true" CodeFile="JobPostList.aspx.cs" Inherits="JobPost_Default" %>

<%@ Register Src="~/JobPost/JobPost.ascx" TagPrefix="uc1" TagName="JobPost" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
            <span class="h3" style="color:#344154;text-transform:uppercase">List of Job Post</span>
            <asp:HyperLink ID="LnkAddJobPost" Visible="false" CssClass="pull-right btn btn-info" runat="server" Text="Add a new Job Post" NavigateUrl="NewJobPost.aspx"></asp:HyperLink>
    </div>
    <div class="row text-center">
        <h5>Number Of Records:<asp:Label runat="server" ID="LblNumberOfRecords"></asp:Label></h5>
    </div>
    <div class="table-responsive">
            <asp:GridView runat="server" ID="GridViewJobPostList" HeaderStyle-BackColor="#344154" Font-Size="Large" RowStyle-BackColor="White" HeaderStyle-ForeColor="White" BorderColor="#ff00ff" OnRowDataBound="GridViewJobPostList_RowDataBound" AutoGenerateColumns="false" CssClass="table table-bordered table-responsive table-hover">
                <Columns>
                    <asp:BoundField HeaderText="JobTitle"  DataField="JobTitle" />
                    <asp:BoundField HeaderText="Designation" DataField="DesignationId" />
                    <asp:BoundField HeaderText="Department" DataField="DepartmentId" />
                    <asp:BoundField HeaderText="Min Salary" DataField="MinSalary" />
                    <asp:HyperLinkField HeaderText="View" DataNavigateUrlFields="Id" Text="View" DataNavigateUrlFormatString="ViewJobDescription.aspx?ID={0}"/>
                </Columns>
            </asp:GridView>
    </div>
    <!--<uc1:JobPost runat="server" ID="JobPost" />-->
</asp:Content>

