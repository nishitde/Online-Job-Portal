<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegisterJobSeeker.aspx.cs" Inherits="Register_RegisterJobSeeker" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Bootstrap 101 Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" media="screen">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="dist/js/html5shiv.js"></script>
      <script src="dist/js/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
      <form runat="server">
      <center>
      <div class="row">
          <label style="color:brown;font-size:50px;">Online Job Portal</label>
          
      </div>

    <div class="container" style="margin-top:50px">
            <div class="col-xs-12 col-sm-offset-2 col-sm-8">
                <div class="panel panel-primary">
                    <div class="panel-heading h3">Register Yourself</div>
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
                            <asp:Button runat="server" ID="BtnRegister" OnClick="BtnRegister_Click" CssClass="btn btn-primary" Text="Register" />
                            &nbsp;&nbsp;&nbsp;
                            <a  href="../Default.aspx" class="btn btn-default">Cancel</a>
                        </div>
                    </div>
                </div>
            </div>
        
    </div>
          </center>
          </form>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../js/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../js/bootstrap.min.js"></script>
  </body>
</html>