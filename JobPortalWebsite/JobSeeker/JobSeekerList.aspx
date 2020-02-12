<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPageForViewer.master" AutoEventWireup="true" CodeFile="JobSeekerList.aspx.cs" Inherits="JobSeeker_JobSeekerList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <span class="h3" style="color:#344154;text-transform:uppercase">List Of JobSeekers</span>
    </div>
    <div class="row text-center">
        <h5>Number Of Records:<asp:Label runat="server" ID="LblNumberOfRecords"></asp:Label></h5>
    </div>
    <div class="table-responsive">
        <asp:GridView runat="server" HeaderStyle-BackColor="#344154" Font-Size="Large" RowStyle-BackColor="White" HeaderStyle-ForeColor="White" BorderColor="#ff00ff" ID="GridViewJobSeeker" AutoGenerateColumns="false" CssClass="table table-bordered table-hover">
            <Columns>
                <asp:BoundField HeaderText="Job Seeker Name" DataField="FirstName" />
                <asp:BoundField HeaderText="Email" DataField="EmailId" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>