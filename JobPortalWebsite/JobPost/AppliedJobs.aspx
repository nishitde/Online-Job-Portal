<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPageForViewer.master" AutoEventWireup="true" CodeFile="AppliedJobs.aspx.cs" Inherits="JobPost_AppliedJobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <span class="h3" style="color:#344154;text-transform:uppercase">Applied Jobs</span>
    </div>
    <br />
    <div class="row text-center">
        <h5>Number Of Applied Jobs: <asp:Label runat="server" ID="LblNumberOfRecords"></asp:Label></h5>
    </div>
    <div class="table-responsive">
        <asp:GridView runat="server" ID="GridViewAppliedJobs" DataKeyNames="Id,JobPostId" HeaderStyle-BackColor="#344154" Font-Size="Large" RowStyle-BackColor="White" HeaderStyle-ForeColor="White" BorderColor="#ff00ff" AutoGenerateColumns="false" OnRowDataBound="GridViewAppliedJobs_RowDataBound" CssClass="table table-bordered table-hover">
            <Columns>
                <asp:BoundField  HeaderText="Job Title" DataField="JobPostId"/>
                <asp:HyperLinkField HeaderText="View" DataNavigateUrlFields="Id" Text="View" Target="_blank" DataNavigateUrlFormatString="ViewJobDescription.aspx?ID={0}"/>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton runat="server" ID="LnkBtnDelete" Text="Delete" CausesValidation="false" OnClick="LnkBtnDelete_Click" CssClass="btn-link"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>