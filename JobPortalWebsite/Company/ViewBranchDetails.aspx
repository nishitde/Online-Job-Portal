<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/ViewCompany.master" AutoEventWireup="true" CodeFile="ViewBranchDetails.aspx.cs" Inherits="Company_ViewBranchDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" Runat="Server">
    <br />
    <div class="row">
        <div class="col-xs-12">
             <span class="h3" style="color:#344154;text-transform:uppercase">List Of Branches</span>
        <span class="pull-right"><asp:LinkButton runat="server" ID="LnkBtnAddBranchModal" CssClass="btn btn-info" Text="Add a Branch" OnClick="LnkBtnAddBranchModal_Click"></asp:LinkButton></span>
        </div>
    </div>
    <div class="row">
        <div class="text-center">
            <h5>Number Of Branches:<asp:Label runat="server" ID="LblNumberOfBranches" Visible="true"></asp:Label></h5>
        </div>
    </div>
    <div class="table-responsive">
        <asp:GridView runat="server" HeaderStyle-BackColor="#344154" Font-Size="Large" RowStyle-BackColor="White" HeaderStyle-ForeColor="White" BorderColor="#ff00ff" AutoGenerateColumns="false" ID="GridViewBranches" OnRowDataBound="GridViewBranches_RowDataBound" CssClass="table table-bordered table-hover">
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
      <div class="modal-body" style="max-height:400px;overflow-y:scroll">
        <div class="row">
        <div class="col-xs-12 col-sm-6">
        <h6>Branch Name</h6>
        <asp:TextBox runat="server" ID="TxtBranchName" ValidationGroup="AddBranch" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ValidationGroup="AddBranch" ID="ReqBranchName" ErrorMessage="Please Specify Branch Name" Display="Dynamic" ControlToValidate="TxtBranchName" CssClass="text-danger"></asp:RequiredFieldValidator>
        <asp:Label runat="server" ID="LblDuplicateBranchNameError" CssClass="text-danger" Text="This Branch Name already exists in database" Visible="false"></asp:Label>
        </div>
     </div>
    <br />
    <div class="row">
        <div class="col-xs-12 col-sm-6">
            <div class="row">
            <h6>Address Detail</h6>
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
                    <h6>Country</h6>
                    <asp:DropDownList runat="server" ID="DdlCountry" AutoPostBack="true" OnSelectedIndexChanged="DdlCountry_SelectedIndexChanged" DataTextField="CountryName" DataValueField="Id" ValidationGroup="AddBranch" CssClass="form-control" placeholder="Country"></asp:DropDownList>   
                </div>
                <div class="col-xs-6">
                    <h6>State</h6>
                    <asp:DropDownList runat="server" ID="DdlState" AutoPostBack="true" OnSelectedIndexChanged="DdlState_SelectedIndexChanged" DataTextField="StateName" DataValueField="Id" ValidationGroup="AddBranch" CssClass="form-control" placeholder="State"></asp:DropDownList>   
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-xs-6">
                    <h6>City</h6>
                    <asp:DropDownList runat="server" ID="DdlCity" ValidationGroup="AddBranch" CssClass="form-control" DataTextField="CityName" DataValueField="Id" placeholder="City"></asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="ReqCity" ValidationGroup="AddBranch" ControlToValidate="DdlCity" InitialValue="--Select--" ErrorMessage="Please specify City" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
                <div class="col-xs-6">
                    <h6>Pincode</h6>
                    <asp:TextBox runat="server" ID="TxtPinCode" ValidationGroup="AddBranch" CssClass="form-control" placeholder="Pin Code"></asp:TextBox>   
                </div>
               
            </div>
             
            
        </div>
        <div class="col-xs-12 col-sm-6">
            <div class="row">
            <h6>Contact Details</h6>
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
              <asp:Button runat="server" ID="BtnAddBranch" Text="Add This Branch" ValidationGroup="AddBranch" CausesValidation="true" CssClass="btn btn-primary" OnClick="BtnAddBranch_Click" />
            &nbsp;&nbsp;
          <asp:LinkButton runat="server" ID="LnkBtnCloseAddBranchModal" CssClass="btn btn-default" Text="Close" OnClick="LnkBtnCloseAddBranchModal_Click"></asp:LinkButton>
          </div>
          
      </div>
    </div>

  </div>
</div>
</asp:Content>