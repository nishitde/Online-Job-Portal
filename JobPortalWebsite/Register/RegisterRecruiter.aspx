<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage/MasterPageForViewer.master" CodeFile="RegisterRecruiter.aspx.cs" Inherits="Register_RegisterRecruiter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <center>
      

    <div class="container" style="margin-top:50px">
            <div class="col-xs-12 col-sm-offset-2 col-sm-8">
                <div class="panel" style="background-color:grey;border-color:black">
                    <h3>Register Yourself</h3>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-12 col-sm-2">
                                <asp:DropDownList runat="server" ID="DdlTitle" DataTextField="TitleName" DataValueField="Id" CssClass="form-control"></asp:DropDownList>
                            </div>
                            <div class="col-xs-12 col-sm-5">
                                <asp:TextBox runat="server" ID="TxtFirstName" placeholder="First Name" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="ReqFirstName" ControlToValidate="TxtFirstName" Display="Dynamic" CssClass="text-danger pull-left" ErrorMessage="Please specify First Name"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-xs-12 col-sm-5">
                                <asp:TextBox runat="server" ID="TxtLastName" placeholder="Last Name" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="ReqLastName" ControlToValidate="TxtLastName" Display="Dynamic" CssClass="text-danger pull-left" ErrorMessage="Please specify Last Name"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-xs-12">
                                <asp:DropDownList runat="server" ID="DdlCompany" CssClass="form-control" DataTextField="CompanyName" DataValueField="Id"></asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="ReqCompany" InitialValue="--Select Company--" ControlToValidate="DdlCompany" Display="Dynamic" ErrorMessage="Please select a company" CssClass="text-danger pull-left"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-xs-12">
                                <asp:TextBox runat="server" ID="TxtEmail" placeholder="Email Address" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="ReqEmail" ControlToValidate="TxtEmail" Display="Dynamic" CssClass="text-danger pull-left" ErrorMessage="Please specify Email"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ID="RegEmail" ControlToValidate="TxtEmail" Display="Dynamic" CssClass="text-danger pull-left" ErrorMessage="Email Id not in correct format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                <asp:Label runat="server" ID="LblDuplicateEmail" Text="We already have a account with this Email" CssClass="text-danger" Visible="false"></asp:Label>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-xs-12 col-sm-6">
                                <asp:TextBox runat="server" ID="TxtPassword" TextMode="Password" placeholder="Password" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="ReqPassword" ControlToValidate="TxtPassword" Display="Dynamic" CssClass="text-danger pull-left" ErrorMessage="Please specify Password"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-xs-12 col-sm-6">
                                <asp:TextBox runat="server" ID="TxtConfirmPassword" TextMode="Password" placeholder="Confirm Password" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="ReqConfirmPassword" ControlToValidate="TxtConfirmPassword" Display="Dynamic" CssClass="text-danger pull-left" ErrorMessage="Please re-enter Password"></asp:RequiredFieldValidator>
                            </div>
                            <asp:CompareValidator runat="server" ID="CmpPassword" ControlToValidate="TxtConfirmPassword" ControlToCompare="TxtPassword" CssClass="text-danger pull-left" ErrorMessage="Password Mismatched" Display="Dynamic" SetFocusOnError="True"></asp:CompareValidator>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-xs-12">
                                <asp:CheckBox runat="server" ID="ChkEnableEmail" Text="Send/Receive Email" CssClass="h4 checkbox" ForeColor="White" />
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <asp:Button runat="server" ID="BtnRegister" OnClick="BtnRegister_Click"  CssClass="btn btn-primary" Text="Register" />
                        </div>
                        <br />
                        <div class="row h4" style="color:white">
                            Already a Member? <a href="../Login/RecruiterLogin.aspx" class="btn btn-default">Click here to Sign In</a>
                        </div>
                    </div>
                </div>
            </div>
        
    </div>
          </center>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../js/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../js/bootstrap.min.js"></script>
</asp:Content>
    

