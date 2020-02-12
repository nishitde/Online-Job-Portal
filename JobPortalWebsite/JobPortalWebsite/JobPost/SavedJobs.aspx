<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPageForViewer.master" AutoEventWireup="true" CodeFile="SavedJobs.aspx.cs" Inherits="JobPost_SavedJobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <span class="h3">Saved Jobs</span>
    </div>
    <br />
    <div class="row text-center">
        Number Of Saved Jobs: <asp:Label runat="server" ID="LblNumberOfRecords"></asp:Label>
    </div>
    <div class="table-responsive">
        <asp:GridView runat="server" ID="GridViewSavedJobs" AutoGenerateColumns="false" OnRowDataBound="GridViewSavedJobs_RowDataBound" CssClass="table table-bordered table-hover">
            <Columns>
                <asp:BoundField  HeaderText="Job Title" DataField="JobPostId"/>
                <asp:HyperLinkField HeaderText="View" DataNavigateUrlFields="Id" Text="View" DataNavigateUrlFormatString="ViewJobPost.aspx?ID={0}"/>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton runat="server" ID="LnkBtnDelete" Text="Delete" CssClass="btn-link"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

