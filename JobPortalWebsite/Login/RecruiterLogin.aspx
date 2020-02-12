<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage/MasterPageForViewer.master" CodeFile="RecruiterLogin.aspx.cs" Inherits="Login_RecruiterLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 
    <div class="container col-xs-12 col-sm-offset-3 col-sm-5" style="margin-top:50px;background-color:gray!important;border-color:black">
        <div class="row text-center">
            <h3>Sign In To Your Account</h3>
        </div>
        <center>
        <div class="signin-form">
            <div class="row">
                            <div class="col-xs-12">
                                
                                <asp:TextBox runat="server" ID="TxtEmailId" placeholder="Email Id" ValidationGroup="RecruiterLogin" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="ReqEmail" ValidationGroup="RecruiterLogin" ControlToValidate="TxtEmailId" CssClass="text-danger" Display="Dynamic" Text="Please specify Email Id"></asp:RequiredFieldValidator>
                            </div>
                        </div>
            <br />
            <div class="row">
                            <div class="col-xs-12">
                                
                                <asp:TextBox runat="server" ID="TxtPassword" TextMode="Password" placeholder="Password" ValidationGroup="RecruiterLogin" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="ReqPassword" ValidationGroup="RecruiterLogin" ControlToValidate="TxtPassword" CssClass="text-danger" Display="Dynamic" Text="Please specify Password"></asp:RequiredFieldValidator>
                                <asp:Label runat="server" ID="LblInvalidLoginDetails" Text="Invalid Login Details" CssClass="text-danger" Visible="false"></asp:Label>
                            </div>
                        </div>
            <br />
            <div class="row">
                <div class="col-xs-12">
                    <asp:CheckBox runat="server" ID="ChkRemeberLogin" CssClass="checkbox h4" ForeColor="White" Text="Remember me on this device" />
                </div>
            </div>
            <div class="row">
                            <div class="col-xs-12">
                                <asp:Button runat="server" ID="BtnRecruiterLogin" CssClass="btn btn-primary" OnClick="BtnRecruiterLogin_Click" ValidationGroup="RecruiterLogin" Text="Login" />
                                
                                
                            </div>
                        </div>
                        <br />
                        <div class="row h4" style="color:white">
                  Not a member yet?<a href="../Register/RegisterRecruiter.aspx" class="btn btn-default" >Register Now</a>
              </div>
            <br />
            </div>
        </center>
         </div>       
                        
                    
        
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../js/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../js/bootstrap.min.js"></script>
</asp:Content>