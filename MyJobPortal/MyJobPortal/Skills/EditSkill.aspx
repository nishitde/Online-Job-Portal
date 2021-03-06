﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageWithLogin.master" AutoEventWireup="true" CodeFile="EditSkill.aspx.cs" Inherits="Skills_EditSkill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-12">
            <span class="h3">Edit a New Skill</span>
            <span class="pull-right"><a href="SkillList.aspx">Back to the List of Skills</a></span>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-12 col-sm-3">
            <label>Skill Name</label>
            <asp:TextBox runat="server" ID="TxtSkill" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="ReqSkill" CssClass="text-danger" ControlToValidate="TxtSkill" ErrorMessage="Please specify the Skill" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:Label runat="server" ID="LblDuplicateSkillError" Visible="false" Text="A duplicate Skill already exists in the database" CssClass="text-danger"></asp:Label>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-12 col-sm-3">
            <label>Select SkillType</label>
            <asp:DropDownList runat="server" ID="DdlSkillType" DataTextField="SkillTypeName" DataValueField="Id" CssClass="form-control"></asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="ReqSkillType" CssClass="text-danger" ControlToValidate="DdlSkillType" InitialValue="--Select--" ErrorMessage="Please specify the Skill Type" Display="Dynamic"></asp:RequiredFieldValidator>
            
        </div>
    </div>
    <br />
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
            <asp:Button runat="server" ID="BtnEdit" CssClass="btn btn-default" Text="Edit this Skill" OnClick="BtnEdit_Click" />
        </div>
    </div>
</asp:Content>