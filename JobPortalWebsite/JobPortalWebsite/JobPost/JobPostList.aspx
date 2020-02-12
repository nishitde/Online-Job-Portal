<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPageForViewer.master" AutoEventWireup="true" CodeFile="JobPostList.aspx.cs" Inherits="JobPost_JobPostList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
            <span class="h3">List of Job Post</span>
            <asp:HyperLink ID="LnkAddJobPost" Visible="false" CssClass="pull-right" runat="server" Text="Add a new Job Post" NavigateUrl="NewJobPost.aspx"></asp:HyperLink>
    </div>
    <div class="row text-center">
        Number Of Records:<asp:Label runat="server" ID="LblNumberOfRecords"></asp:Label>
    </div>
    <div class="col-xs-12">
            <asp:GridView runat="server" ID="GridViewJobPostList" OnRowDataBound="GridViewJobPostList_RowDataBound" AutoGenerateColumns="false" CssClass="table table-bordered table-responsive table-hover">
                <Columns>
                    <asp:BoundField HeaderText="JobTitle"  DataField="JobTitle" />
                    <asp:BoundField HeaderText="Designation" DataField="DesignationId" />
                    <asp:BoundField HeaderText="Department" DataField="DepartmentId" />
                    <asp:BoundField HeaderText="Min Salary" DataField="MinSalary" />
                    <asp:HyperLinkField HeaderText="View" DataNavigateUrlFields="Id" Text="View" DataNavigateUrlFormatString="ViewJobDescription.aspx?ID={0}"/>
                </Columns>
            </asp:GridView>
    </div>
    <script src="../js/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../js/bootstrap.min.js"></script>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>