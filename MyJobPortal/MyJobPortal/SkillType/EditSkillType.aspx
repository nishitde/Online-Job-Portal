<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageWithLogin.master" AutoEventWireup="true" CodeFile="EditSkillType.aspx.cs" Inherits="SkillType_EditSkillType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-12">
            <span class="h3">Edit Skill Type</span>
            <span class="pull-right"><a href="SkillTypeList.aspx">Back to the List of SkillTypes</a></span>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-3">
            <label>SkillType</label>
            <asp:TextBox runat="server" ID="TxtSkillType" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="ReqSkillType" CssClass="text-danger" ControlToValidate="TxtSkillType" ErrorMessage="Please specify the Skill Type" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:Label runat="server" ID="LblDuplicateSkillTypeError" Visible="false" Text="A duplicate Skill Type already exists in the database" CssClass="text-danger"></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-3">
            <label>Status</label>
            <asp:DropDownList runat="server" ID="DdlStatus" CssClass="form-control">
                <asp:ListItem>Active</asp:ListItem>
                <asp:ListItem>Inactive</asp:ListItem>
            </asp:DropDownList>
       </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-12">
            <asp:Button runat="server" ID="BtnUpdate" CssClass="btn btn-default" Text="Update this SkillType" OnClick="BtnUpdate_Click" />
        </div>
    </div>
</asp:Content>