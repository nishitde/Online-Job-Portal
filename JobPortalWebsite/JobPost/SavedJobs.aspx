<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPageForViewer.master" AutoEventWireup="true" CodeFile="SavedJobs.aspx.cs" Inherits="JobPost_SavedJobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <span class="h3" style="color:#344154;text-transform:uppercase">Saved Jobs</span>
    </div>
    <br />
    <div class="row text-center">
        <h5>Number Of Saved Jobs: <asp:Label runat="server" ID="LblNumberOfRecords"></asp:Label></h5>
    </div>
    <div class="table-responsive">
        <asp:GridView runat="server" ID="GridViewSavedJobs" DataKeyNames="Id,JobPostId" HeaderStyle-BackColor="#344154" Font-Size="Large" RowStyle-BackColor="White" HeaderStyle-ForeColor="White" BorderColor="#ff00ff" AutoGenerateColumns="false" OnRowDataBound="GridViewSavedJobs_RowDataBound" CssClass="table table-bordered table-hover">
            <Columns>
                <asp:BoundField  HeaderText="Job Title" DataField="JobPostId"/>
                <asp:HyperLinkField HeaderText="View" DataNavigateUrlFields="Id" Text="View" Target="_blank" DataNavigateUrlFormatString="ViewJobDescription.aspx?ID={0}"/>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton runat="server" ID="LnkBtnDelete" OnClick="LnkBtnDelete_Click" Text="Delete" CssClass="btn-link"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

