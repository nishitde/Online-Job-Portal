<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RecruiterLogin.aspx.cs" Inherits="Login_RecruiterLogin" %>

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
                    <div class="panel-heading h3">Login</div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="pull-left">Email Id</label>
                                <asp:TextBox runat="server" ID="TxtEmailId" ValidationGroup="RecruiterLogin" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="ReqEmail" ValidationGroup="RecruiterLogin" ControlToValidate="TxtEmailId" CssClass="text-danger" Display="Dynamic" Text="Please specify Email Id"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="pull-left">Password</label>
                                <asp:TextBox runat="server" ID="TxtPassword" TextMode="Password" ValidationGroup="RecruiterLogin" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="ReqPassword" ValidationGroup="RecruiterLogin" ControlToValidate="TxtPassword" CssClass="text-danger" Display="Dynamic" Text="Please specify Password"></asp:RequiredFieldValidator>
                                <asp:Label runat="server" ID="LblInvalidLoginDetails" Text="Invalid Login Details" CssClass="text-danger" Visible="false"></asp:Label>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-xs-12">
                                <asp:Button runat="server" ID="BtnRecruiterLogin" CssClass="btn btn-primary" OnClick="BtnRecruiterLogin_Click" ValidationGroup="RecruiterLogin" Text="Login" />
                                &nbsp;&nbsp;&nbsp;
                                <asp:HyperLink NavigateUrl="~/Default.aspx" runat="server" ID="LnkBtnClose" CssClass="btn btn-default" Text="Close" CausesValidation="false"></asp:HyperLink>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                  Not a member yet?<a href="../Register/RegisterJobSeeker.aspx" class="btn-link">Regiter Now</a>
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