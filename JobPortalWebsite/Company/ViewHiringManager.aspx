<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/ViewCompany.master" AutoEventWireup="true" CodeFile="ViewHiringManager.aspx.cs" Inherits="Company_ViewHiringManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" Runat="Server">
    <br />
    <div class="row">
        <div class="col-xs-12">
            <span class="h3" style="color:#344154;text-transform:uppercase">List Of Hiring Managers</span>
        <span class="pull-right"><asp:LinkButton runat="server" ID="LnkBtnAddHiringManagerModal" CssClass="btn btn-info" OnClick="LnkBtnAddHiringManagerModal_Click" Text="Add a Hiring Manager"></asp:LinkButton></span>
        </div>
    </div>
     <div class="row">
        <div class="text-center">
            <h5>Number Of Hiring Managers: <asp:Label runat="server" ID="LblNumberOfHiringManager" Visible="true"></asp:Label></h5>
        </div>
    </div>
    <div class="table-responsive">
        <asp:GridView runat="server" HeaderStyle-BackColor="#344154" Font-Size="Large" OnRowDataBound="GridViewHiringManager_RowDataBound" RowStyle-BackColor="White" HeaderStyle-ForeColor="White" BorderColor="#ff00ff" AutoGenerateColumns="false" ID="GridViewHiringManager" CssClass="table table-responsive table-bordered table-hover">
            <Columns>
                <asp:BoundField HeaderText="Hiring Manager Name" DataField="HiringManagerName" />
                <asp:BoundField HeaderText="Email Address" DataField="EmailId" />
                <asp:BoundField HeaderText="Branch Name" DataField="BranchId" />
                <asp:BoundField HeaderText="Department Name" DataField="DepartmentId" />
            </Columns>
        </asp:GridView>
    </div>
 <!-- Add Hiring Manager Modal -->
    <div runat="server" id="AddHiringMnagerModal" class="modal show" visible="false" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Add a Hiring Manager</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        <div class="col-xs-12">
        <label class="h4">Hiring Manger Name</label>
        <asp:TextBox runat="server" ID="TxtHiringManagerName" ValidationGroup="AddHiringManager" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ValidationGroup="AddHiringManager" ID="ReqHiringManagerName" ErrorMessage="Please Specify Hiring Manager Name" Display="Dynamic" ControlToValidate="TxtHiringManagerName" CssClass="text-danger"></asp:RequiredFieldValidator>
        <asp:Label runat="server" ID="LblDuplicateHiringManagerNameError" CssClass="text-danger" Text="This Hiring Manager Name already exists in database" Visible="false"></asp:Label>
        </div>
     </div>
    <br />
          <div class="row">
        <div class="col-xs-12">
        <label class="h4">Hiring Manger Email</label>
        <asp:TextBox runat="server" ID="TxtEmail" ValidationGroup="AddHiringManager" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ValidationGroup="AddHiringManager" ID="RequiredFieldValidator1" ErrorMessage="Please Specify Hiring Manager Email" Display="Dynamic" ControlToValidate="TxtEmail" CssClass="text-danger"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator runat="server" ID="RegEmail" ControlToValidate="TxtEmail" ValidationGroup="AddHiringManager" ErrorMessage="Invalid Format" Display="Dynamic" CssClass="text-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </div>
     </div>
          <br />
    <div class="row">
        <div class="col-xs-12">
            <label class="h4">Select Branch</label>
            <asp:DropDownList runat="server" ID="DdlBranches" CssClass="form-control" DataTextField="BranchName" DataValueField="Id"></asp:DropDownList>
        </div>
    </div>
          <br />
    <div class="row">
        <div class="col-xs-12">
            <label class="h4">Select Department</label>
            <asp:DropDownList runat="server" ID="DdlDepartment" DataTextField="DepartmentName" DataValueField="Id" CssClass="form-control"></asp:DropDownList>
        </div>
    </div>
      </div>
      <div class="modal-footer">
          <div class="row">
              <asp:Button runat="server" ID="BtnAddHiringManager" Text="Add This HiringManager" ValidationGroup="AddHiringManager" CausesValidation="true" CssClass="btn btn-primary" OnClick="BtnAddHiringManager_Click" />
            &nbsp;&nbsp;
          <asp:LinkButton runat="server" ID="LnkBtnCloseAddHiringManagerModal" CssClass="btn btn-default" Text="Close" OnClick="LnkBtnCloseAddHiringManagerModal_Click"></asp:LinkButton>
          </div>
          
      </div>
    </div>

  </div>
</div>
</asp:Content>