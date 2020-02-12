<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/ViewJobPost.master" AutoEventWireup="true" CodeFile="ViewRequirements.aspx.cs" Inherits="JobPost_ViewRequirements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" Runat="Server">
    <br />
    <div class="row">
        <div class="col-xs-12">
            <span class="h3">Job Requirement</span>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-12 col-sm-2">
            <span class="h4">Education : </span>
        </div>
        <div class="col-xs-12 col-sm-6">
            <asp:Label runat="server" ID="LblEducation" Text="example 1" Font-Bold="true" CssClass="h4"></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-2">
            <span class="h4">Experience : </span>
        </div>
        <div class="col-xs-12 col-sm-6">
            <asp:Label runat="server" ID="LblExperience" Text="example 1" Font-Bold="true" CssClass="h4"></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-2">
            <span class="h4">Skills : </span>
        </div>
    </div>
    <div class="table-responsive">
        <asp:GridView runat="server" ID="GridViewSkills" CssClass="table table-bordered table-hover" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField HeaderText="Skill Name" DataField="SkillName" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

