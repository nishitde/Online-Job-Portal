<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/ViewCompany.master" AutoEventWireup="true" CodeFile="ViewCompany.aspx.cs" Inherits="Company_ViewCompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" Runat="Server">
    <br />
    <div class="row">
        <div class="col-xs-12" style="font-size:large">
            <span class="pull-left"></span>
            <span style="color:#f53157">Company Name:&nbsp;&nbsp;<asp:Label runat="server" ID="LblCompanyName" ForeColor="DarkBlue" Visible="true" Text="Demo"></asp:Label>&nbsp;&nbsp;&nbsp;<asp:LinkButton runat="server" ID="LnkBtnEditCompanyDetails" OnClick="LnkBtnEditCompanyDetails_Click" CssClass="glyphicon-pencil glyphicon h4"></asp:LinkButton></span>
            <br />
            <br />
            <span style="color:#f53157">Website:&nbsp;&nbsp;<asp:Label runat="server" ForeColor="DarkBlue" ID="LblWebsiteURL" Visible="true"></asp:Label></span>
            <br />
            <br />
            <span style="color:#f53157">Industry:&nbsp;&nbsp;<asp:Label runat="server" ForeColor="DarkBlue" ID="LblIndustry" Visible="true"></asp:Label></span>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-12" style="font-size:large;color:#f53157">
            <span class="h4">Description :</span>
        <br />
        <asp:Label runat="server" ID="LblDescription" ForeColor="DarkBlue" CssClass="h4" Visible="true" ViewStateMode="Enabled" TextMode="MultiLine" ></asp:Label>
        </div>
        
    </div>
    <br />
    
    

    <!-- Edit Company Modal -->
    <div runat="server" id="EditCompanyModal" class="modal show" visible="false" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Edit Company</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        
        <label>Company Name</label>
        <asp:TextBox runat="server" ID="TxtCompanyName" ValidationGroup="EditCompany" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ValidationGroup="EditCompany" ID="ReqCompanyName" ErrorMessage="Please Specify Company Name" Display="Dynamic" ControlToValidate="TxtCompanyName" CssClass="text-danger"></asp:RequiredFieldValidator>
        <asp:Label runat="server" ID="LblDuplicateCompanyError" CssClass="text-danger" Text="This Company already exists in database" Visible="false"></asp:Label>

     </div>
    <br />
          <div class="row">
              <label>Website URL:</label>
              <asp:TextBox runat="server" ID="TxtWebsiteURL" ValidationGroup="EditCompany" CssClass="form-control"></asp:TextBox>
              <asp:RequiredFieldValidator runat="server" ID="ReqWebsiteURL" Display="Dynamic" ErrorMessage="Please specify Website URL" ValidationGroup="EditCompany" ControlToValidate="TxtWebsiteURL" CssClass="text-danger"></asp:RequiredFieldValidator>
          </div>
          <div class="row">
              <label>Industry :</label>
              <asp:DropDownList runat="server" ID="DdlIndustry" ValidationGroup="EditCompany" DataTextField="IndustryName" DataValueField="Id" CssClass="form-control"></asp:DropDownList>
              <asp:RequiredFieldValidator runat="server" ID="ReqIndustry" Display="Dynamic" ErrorMessage="Please specify Website URL" ValidationGroup="EditCompany" ControlToValidate="DdlIndustry" InitialValue="--Select--" CssClass="text-danger"></asp:RequiredFieldValidator>
          </div>
          <div class="row">
              <label>Description :</label>
              <asp:TextBox runat="server" ID="TxtDescription" ValidationGroup="EditCompany" TextMode="MultiLine" Height="100" CssClass="form-control"></asp:TextBox>
          </div>
          <div class="row">
              <label>Status :</label>
              <asp:DropDownList runat="server" ID="DdlStatus" ValidationGroup="EditCompany" CssClass="form-control">
                  <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                  <asp:ListItem Text="Inactive" Value="Inactive"></asp:ListItem>
              </asp:DropDownList>
          </div>
        </div>   
      <div class="modal-footer">
          <div class="row">
              <asp:Button runat="server" ID="BtnUpdateCompany" Text="Update this Company" ValidationGroup="EditCompany" CausesValidation="true" CssClass="btn btn-primary" OnClick="BtnUpdateCompany_Click"/>
            &nbsp;&nbsp;
          <asp:LinkButton runat="server" ID="LnkBtnCloseCompany" CssClass="btn btn-default" CausesValidation="false" Text="Close" OnClick="LnkBtnCloseCompany_Click"></asp:LinkButton>
          </div>
          
      </div>
    </div>

  </div>
</div>
</asp:Content>