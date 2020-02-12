<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/ViewJobPost.master" AutoEventWireup="true" CodeFile="ViewInterviewProcess.aspx.cs" Inherits="JobPost_ViewInterviewProcess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" Runat="Server">
    <br />
    <div class="row">
        <div class="col-xs-12">
            <span class="h3">Interview Process</span>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-12 col-sm-3">
            <span class="h4">Number Of Aptitude Tests : </span>
        </div>
        <div class="col-xs-12 col-sm-6">
            <asp:Label runat="server" ID="LblNumberOfAptitude" Text="example 1" Font-Bold="true" CssClass="h4"></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-3">
            <span class="h4">Number Of Technical Rounds : </span>
        </div>
        <div class="col-xs-12 col-sm-6">
            <asp:Label runat="server" ID="LblNumberOfTechnical" Text="example 1" Font-Bold="true" CssClass="h4"></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-3">
            <span class="h4">Number Of Group Discussions : </span>
        </div>
        <div class="col-xs-12 col-sm-6">
            <asp:Label runat="server" ID="LblNumberOfGD" Text="example 1" Font-Bold="true" CssClass="h4"></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-3">
            <span class="h4">Number Of Interviews : </span>
        </div>
        <div class="col-xs-12 col-sm-6">
            <asp:Label runat="server" ID="LblNumberOfinterview" Text="example 1" Font-Bold="true" CssClass="h4"></asp:Label>
        </div>
    </div>
</asp:Content>

