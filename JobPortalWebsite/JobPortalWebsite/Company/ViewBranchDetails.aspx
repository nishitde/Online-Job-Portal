<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/ViewCompany.master" AutoEventWireup="true" CodeFile="ViewBranchDetails.aspx.cs" Inherits="Company_ViewBranchDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" Runat="Server">
    <br />
    <div class="row">
        <span class="h3">List Of Branches</span>
        <span class="pull-right"><asp:LinkButton runat="server" ID="LnkBtnAddBranchModal" Text="Add a Branch" OnClick="LnkBtnAddBranchModal_Click"></asp:LinkButton></span>
    </div>
    <div class="row">
        <div class="text-center">
            Number Of Branches:<asp:Label runat="server" ID="LblNumberOfBranches" Visible="true"></asp:Label>
        </div>
    </div>
    <div class="table-responsive">
        <asp:GridView runat="server" AutoGenerateColumns="false" ID="GridViewBranches" OnRowDataBound="GridViewBranches_RowDataBound" CssClass="table table-bordered table-hover">
            <Columns>
                <asp:BoundField HeaderText="Branch Name" DataField="BranchName" />
                <asp:BoundField HeaderText="City" DataField="CityId" />
                <asp:BoundField HeaderText="Country" DataField="CountryId" />
            </Columns>
        </asp:GridView>
    </div>

    <!-- Add Branch Modal -->
    <div runat="server" id="AddBranchModal" class="modal show" visible="false" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Add a Branch</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        <div class="col-xs-12 col-sm-6">
        <label>Branch Name</label>
        <asp:TextBox runat="server" ID="TxtBranchName" ValidationGroup="AddBranch" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ValidationGroup="AddBranch" ID="ReqBranchName" ErrorMessage="Please Specify Branch Name" Display="Dynamic" ControlToValidate="TxtBranchName" CssClass="text-danger"></asp:RequiredFieldValidator>
        <asp:Label runat="server" ID="LblDuplicateBranchNameError" CssClass="text-danger" Text="This Branch Name already exists in database" Visible="false"></asp:Label>
        </div>
     </div>
    <br />
    <div class="row">
        <div class="col-xs-12 col-sm-6">
            <div class="row">
            <label>Address Detail</label>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <asp:TextBox runat="server" ID="TxtAddressLine1" ValidationGroup="AddBranch" CssClass="form-control" placeholder="Address Line 1"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="AddBranch" ID="ReqAddressLine1" ControlToValidate="TxtAddressLine1" ErrorMessage="Please specify Address" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-xs-12">
                    <asp:TextBox runat="server" ID="TxtAddressLine2" ValidationGroup="AddBranch" CssClass="form-control" placeholder="Address Line 2"></asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-xs-6">
                    <label>Country</label>
                    <asp:DropDownList runat="server" ID="DdlCountry" AutoPostBack="true" OnSelectedIndexChanged="DdlCountry_SelectedIndexChanged" DataTextField="CountryName" DataValueField="Id" ValidationGroup="AddBranch" CssClass="form-control" placeholder="Country"></asp:DropDownList>   
                </div>
                <div class="col-xs-6">
                    <label>State</label>
                    <asp:DropDownList runat="server" ID="DdlState" AutoPostBack="true" OnSelectedIndexChanged="DdlState_SelectedIndexChanged" DataTextField="StateName" DataValueField="Id" ValidationGroup="AddBranch" CssClass="form-control" placeholder="State"></asp:DropDownList>   
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-xs-6">
                    <label>City</label>
                    <asp:DropDownList runat="server" ID="DdlCity" ValidationGroup="AddBranch" CssClass="form-control" DataTextField="CityName" DataValueField="Id" placeholder="City"></asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="ReqCity" ValidationGroup="AddBranch" ControlToValidate="DdlCity" InitialValue="--Select--" ErrorMessage="Please specify City" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
                <div class="col-xs-6">
                    <label>Pincode</label>
                    <asp:TextBox runat="server" ID="TxtPinCode" ValidationGroup="AddBranch" CssClass="form-control" placeholder="Pin Code"></asp:TextBox>   
                </div>
               
            </div>
             
            
        </div>
        <div class="col-xs-12 col-sm-6">
            <div class="row">
            <label>Contact Details</label>
            </div>
             
            <div class="row">
                <div class="col-xs-12">
                    <asp:TextBox runat="server" ID="TxtPhoneNumber1" ValidationGroup="AddBranch" CssClass="form-control" placeholder="Phone Number 1"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="AddBranch" ID="ReqPhoneNumber1" ControlToValidate="TxtPhoneNumber1" ErrorMessage="Please specify Phone Number" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-xs-12">
                    <asp:TextBox runat="server" ID="TxtPhoneNumber2" ValidationGroup="AddBranch" CssClass="form-control" placeholder="Phone Number 2"></asp:TextBox>
                    
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-xs-12">
                    <asp:TextBox runat="server" ValidationGroup="AddBranch" ID="TxtEmail1" CssClass="form-control" placeholder="Email Address 1"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="ReqEmail" ValidationGroup="AddBranch" ControlToValidate="TxtEmail1" ErrorMessage="Please specify Email Address" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ID="RegEmail" ValidationGroup="AddBranch" ControlToValidate="TxtEmail1" ErrorMessage="Email Address is not in correct format" Display="Dynamic" CssClass="text-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-xs-12">
                    <asp:TextBox runat="server" ID="TxtEmail2" CssClass="form-control" ValidationGroup="AddBranch" placeholder="Email Address 2"></asp:TextBox>
                    
                </div>
            </div>
        </div>
    </div>
      </div>
      <div class="modal-footer">
          <div class="row">
              <asp:Button runat="server" ID="BtnAddBranch" Text="Add This Branch" ValidationGroup="AddBranch" CausesValidation="true" CssClass="btn btn-default" OnClick="BtnAddBranch_Click" />
            &nbsp;&nbsp;
          <asp:LinkButton runat="server" ID="LnkBtnCloseAddBranchModal" CssClass="btn btn-default" Text="Close" OnClick="LnkBtnCloseAddBranchModal_Click"></asp:LinkButton>
          </div>
          
      </div>
    </div>

  </div>
</div>
</asp:Content>