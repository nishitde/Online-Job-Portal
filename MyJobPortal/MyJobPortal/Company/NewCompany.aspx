<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageWithLogin.master" AutoEventWireup="true" CodeFile="NewCompany.aspx.cs" Inherits="Company_NewCompany" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-xs-12">
            <span class="h3">Add new Company</span>
            <span class="pull-right"><a href="CompanyList.aspx">Back to list of Companies</a></span>
        </div>
    </div>
    <br />
    <div class="row">
    <div class="col-xs-12 col-sm-4">
        <label>Company Name:</label>
        <asp:TextBox runat="server" ID="TxtCompanyName" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="ReqCompanyName" ControlToValidate="TxtCompanyName" ErrorMessage="Please specify Company Name" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
        <asp:Label runat="server" ID="LblDuplicateCompanyName" Text="This Company already exists in database" Visible="false" CssClass="text-danger"></asp:Label>
    </div>
        <div class="col-xs-12 col-sm-4">
            <label>Website</label>
                    <asp:TextBox runat="server" ID="TxtWebsiteURL" CssClass="form-control" placeholder="Website URL"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="ReqWebsiteURL" ControlToValidate="TxtWebsiteURL" ErrorMessage="Please specify Website URL" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ID="RegWebsiteURL" ControlToValidate="TxtWebsiteURL" CssClass="text-danger" ErrorMessage="Website URL not in correct format" Display="Dynamic" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
                </div>
        <div class="col-xs-12 col-sm-4">
            <label>Industry Name</label>
                    <asp:DropDownList runat="server" ID="DdlIndustryName" CssClass="form-control" DataValueField="Id" DataTextField="IndustryName"></asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="ReqIndustryName" ControlToValidate="DdlIndustryName" InitialValue="--Select--" ErrorMessage="Please select Industry" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator> 
                </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-12 col-sm-6">
            <label>Description </label>
            <asp:TextBox runat="server" ID="TxtDescription" TextMode="MultiLine" CssClass="form-control" Height="80"></asp:TextBox>
        </div>
    </div>
    <br />
    <div class="row">
        <label>Primary Contact Details</label>
        <br />
        
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-4">
        <label>Branch Name</label>
        <asp:TextBox runat="server" ID="TxtBranchName" CssClass="form-control" Text="Main"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="ReqBranchName" ErrorMessage="Please Specify Branch Name" Display="Dynamic" ControlToValidate="TxtBranchName" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>
        
     </div>
    <br />
    
        <div class="col-xs-12 col-sm-6">
            <div class="row">
            <label>Address Detail</label>
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-10">
                    <asp:TextBox runat="server" ID="TxtAddressLine1" CssClass="form-control" placeholder="Address Line 1"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="ReqAddressLine1" ControlToValidate="TxtAddressLine1" ErrorMessage="Please specify Address" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-xs-12 col-sm-10">
                    <asp:TextBox runat="server" ID="TxtAddressLine2" CssClass="form-control" placeholder="Address Line 2"></asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-xs-6 col-sm-5">
                    <asp:DropDownList runat="server" ID="DdlCountry" DataTextField="CountryName" OnSelectedIndexChanged="DdlCountry_SelectedIndexChanged" AutoPostBack="true" DataValueField="Id" CssClass="form-control" placeholder="Country"></asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="ReqCountry" ControlToValidate="DdlCountry" InitialValue="--Select--" ErrorMessage="Please select Country" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
                <div class="col-xs-6 col-sm-5">
                    <asp:DropDownList runat="server" ID="DdlState" DataTextField="StateName" DataValueField="Id" AutoPostBack="true" OnSelectedIndexChanged="DdlState_SelectedIndexChanged" CssClass="form-control" placeholder="State"></asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="ReqState" ControlToValidate="DdlState" InitialValue="--Select--" ErrorMessage="Please select State" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-xs-6 col-sm-5">
                    <asp:DropDownList runat="server" ID="DdlCity" DataTextField="CityName" DataValueField="Id" CssClass="form-control" placeholder="City"></asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="ReqCity" ControlToValidate="DdlCity" ErrorMessage="Please select City" Display="Dynamic" InitialValue="--Select--" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
                <div class="col-xs-6 col-sm-5">
                    <asp:TextBox runat="server" ID="TxtPinCode" CssClass="form-control" placeholder="Pin Code"></asp:TextBox>   
                </div>
               
            </div>
            
        </div>
        <div class="col-xs-12 col-sm-6">
            <div class="row">
            <label>Contact Details</label>
            </div>
             
            <div class="row">
                <div class="col-xs-12 col-sm-10">
                    <asp:TextBox runat="server" ID="TxtPhoneNumber1" CssClass="form-control" placeholder="Phone Number 1"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="ReqPhoneNumber1" ControlToValidate="TxtPhoneNumber1" ErrorMessage="Please specify Phone Number" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-xs-12 col-sm-10">
                    <asp:TextBox runat="server" ID="TxtPhoneNumber2" CssClass="form-control" placeholder="Phone Number 2"></asp:TextBox>
                    
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-xs-12 col-sm-10">
                    <asp:TextBox runat="server" ID="TxtEmail1" CssClass="form-control" placeholder="Email Address 1"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="ReqEmail" ControlToValidate="TxtEmail1" ErrorMessage="Please specify Email Address" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ID="RegEmail" ControlToValidate="TxtEmail1" ErrorMessage="Email Address is not in correct format" Display="Dynamic" CssClass="text-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-xs-12 col-sm-10">
                    <asp:TextBox runat="server" ID="TxtEmail2" CssClass="form-control" placeholder="Email Address 2"></asp:TextBox>
                    
                </div>
            </div>
        </div>
    
   
    <div class="row">
         
        <div class="col-xs-12 col-sm-3">
            <br />
        <asp:Button runat="server" ID="BtnAddCompany" Text="Add Company" OnClick="BtnAddCompany_Click" CssClass="form-control btn-primary" />
        </div>
    </div>
</asp:Content>