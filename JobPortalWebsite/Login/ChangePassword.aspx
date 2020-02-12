<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPageForViewer.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Login_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <div class="container" style="margin-top:50px;">
            <div class="col-xs-12 col-sm-offset-3 col-sm-7">
                <div class="panel" style="background-color:grey!important;border-color:black">
                    <h3>Change Password</h3>
                <div class="panel-body">
                    <div class="row text-center">
        <asp:Label runat="server" ID="LblMessage" Visible="true"></asp:Label>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <asp:TextBox runat="server" placeholder="Previous Password" TextMode="Password" ID="TxtPreviousPassword" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="ReqPreviousPassword" CssClass="text-danger" ControlToValidate="TxtPreviousPassword" SetFocusOnError="true" Display="Dynamic" ErrorMessage="Please specify Previous Password"></asp:RequiredFieldValidator>
            <asp:Label runat="server" ID="LblPreviousPasswordError" CssClass="text-danger" Text="Incorrect Previous Password" Visible="false"></asp:Label>
    </div>
        </div>
    <br />
    <div class="row">
        <div class="col-xs-12">
            <asp:TextBox runat="server" ID="TxtNewPassword" placeholder="New Password" TextMode="Password" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="ReqNewPassword" CssClass="text-danger" ControlToValidate="TxtNewPassword" SetFocusOnError="true" Display="Dynamic" ErrorMessage="Please specify New Password"></asp:RequiredFieldValidator>
    </div>
        </div>
    <br />
    <div class="row">
        <div class="col-xs-12">
            <asp:TextBox runat="server" TextMode="Password" placeholder="Confirm New Password" ID="TxtConfirmPassword" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="ReqConfirmPassword" CssClass="text-danger" ControlToValidate="TxtConfirmPassword" SetFocusOnError="true" Display="Dynamic" ErrorMessage="Please confirm your Password"></asp:RequiredFieldValidator>
            <asp:CompareValidator runat="server" ID="CmpPassword" CssClass="text-danger" ControlToCompare="TxtNewPassword" ControlToValidate="TxtConfirmPassword" SetFocusOnError="true" Display="Dynamic" ErrorMessage="Password Mismatched"></asp:CompareValidator>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-12">
            <asp:Button runat="server" ID="BtnUpdatePassword" OnClick="BtnUpdatePassword_Click" Text="Update Password" CssClass="btn btn-primary" />
        </div>
    </div>
                    </div>
                </div>
            </div>
    </div>
    </center>
    
</asp:Content>