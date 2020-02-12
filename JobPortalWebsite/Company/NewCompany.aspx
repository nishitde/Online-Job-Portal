<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPageForViewer.master" AutoEventWireup="true" CodeFile="NewCompany.aspx.cs" Inherits="Company_NewCompany" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-xs-12">
            <span class="h3" style="color:#344154;text-transform:uppercase">Add a New Company</span>
            <span class="pull-right"><a href="CompanyList.aspx" class="btn btn-info">Back to list of Companies</a></span>
        </div>
    </div>
    <br />
    <div class="row">
    <div class="col-xs-12 col-sm-5">
        <div class="row">
            <h6>Company Name:</h6>
        <asp:TextBox runat="server" ID="TxtCompanyName" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="ReqCompanyName" ControlToValidate="TxtCompanyName" ErrorMessage="Please specify Company Name" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
        <asp:Label runat="server" ID="LblDuplicateCompanyName" Text="This Company already exists in database" Visible="false" CssClass="text-danger"></asp:Label>
        </div>
        <div class="row">
            <h6>Website</h6>
                    <asp:TextBox runat="server" ID="TxtWebsiteURL" CssClass="form-control" placeholder="Website URL"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="ReqWebsiteURL" ControlToValidate="TxtWebsiteURL" ErrorMessage="Please specify Website URL" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ID="RegWebsiteURL" ControlToValidate="TxtWebsiteURL" CssClass="text-danger" ErrorMessage="Website URL not in correct format" Display="Dynamic" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
        </div>
        <div class="row">
            <h6>Industry Name</h6>
                    <asp:DropDownList runat="server" ID="DdlIndustryName" CssClass="form-control" DataValueField="Id" DataTextField="IndustryName"></asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="ReqIndustryName" ControlToValidate="DdlIndustryName" InitialValue="--Select--" ErrorMessage="Please select Industry" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator> 
        </div>
    </div>
    <div class="col-xs-12 col-sm-offset-1 col-sm-5">
            <div class="row">
                <h6>Description </h6>
            <asp:TextBox runat="server" ID="TxtDescription" TextMode="MultiLine" CssClass="form-control" Height="230"></asp:TextBox>
            </div>
                </div>
        </div>

    <div class="divider"></div>
    <div class="row">
        <h4>Primary Contact Details</h4>
        
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-4">
        <h6>Branch Name</h6>
        <asp:TextBox runat="server" ID="TxtBranchName" CssClass="form-control" Text="Main"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="ReqBranchName" ErrorMessage="Please Specify Branch Name" Display="Dynamic" ControlToValidate="TxtBranchName" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>
        
     </div>
    <br />
    
        <div class="col-xs-12 col-sm-6">
            <div class="row">
            <h6>Address Detail</h6>
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
            <h6>Contact Details</h6>
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
        <asp:Button runat="server" ID="BtnAddCompany" Text="Add Company"  OnClick="BtnAddCompany_Click" CssClass="form-control btn-primary" />
        </div>
    </div>
    <br />
    
</asp:Content>